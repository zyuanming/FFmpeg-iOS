#!/bin/sh

echo "Install build dependencies..."
brew install autoconf automake libtool pkg-config curl git doxygen nasm bison wget gettext gh meson

work_space=$(pwd)

# build old
# rm -rf tool
# git clone -b tool --depth 1 https://github.com/zyuanming/FFmpeg-iOS tool
# cd tool
# swift run
# cd ..


# rm -rf ffmpeg-kit-main
# git clone -b main --depth 1 git@github.com:arthenica/ffmpeg-kit.git ffmpeg-kit-main
# cd ffmpeg-kit-main
# sh ios.sh --enable-dav1d --disable-armv7 --disable-arm64-mac-catalyst --disable-x86-64-mac-catalyst --disable-arm64e --xcframework

# dav1d_arm64=prebuilt/apple-ios-arm64/dav1d/lib/libdav1d.a
# dav1d_arm64_headers=prebuilt/apple-ios-arm64/dav1d/include
# xcodebuild -create-xcframework -library $dav1d_arm64 -headers $dav1d_arm64_headers -output prebuilt/bundle-apple-xcframework-ios/libdav1d.xcframework


cd $work_space/tool
mkdir tmp_output_frameworks
cd $work_space/ffmpeg-kit-main/prebuilt/bundle-apple-xcframework-ios

for f in ./*.xcframework
do
	f=`basename $f .xcframework`

  # 检查文件名是否为ffmpegkit.framework
  if [ "$f" == "ffmpegkit" ]; then
      # 如果是ffmpegkit.framework，则跳过
      continue
  fi
  zip -rq "$f.zip" $f.xcframework
  cp $f.zip $work_space/tool/tmp_output_frameworks
done


# TAG=v0.0.6-`date +b%Y%m%d-%H%M%S`
TAG=0.0.8

cd $work_space/tool

cp ../Package.swift .


for f in ../ffmpeg-kit-main/prebuilt/bundle-apple-xcframework-ios/*.xcframework
do
	f=`basename $f .xcframework`

  # 检查文件名是否为ffmpegkit.framework
  if [ "$f" == "ffmpegkit" ]; then
      # 如果是ffmpegkit.framework，则跳过
      continue
  fi
	echo $f...
  # 检查字符串是否以"lib"开头
  if [[ $f == lib* ]]; then
      # 使用参数扩展去除前缀"lib"
      lib_string=${f#lib}
      echo "Modified string: $lib_string"
  else
      echo "String does not start with 'lib'."
  fi
	rm Package.swift.in
	mv Package.swift Package.swift.in
	sed "s#/download/[^/]*/$f\.zip[^)]*#/download/$TAG/$f.zip\", checksum: \"`swift package compute-checksum tmp_output_frameworks/$f.zip`\"#" Package.swift.in > Package.swift
done

rm ../Package.swift
mv Package.swift ..

echo "::set-output name=tag::$TAG"

cd ..

echo "Check if the user is logged in to GitHub CLI"
if gh auth status 2>&1 | grep -q 'You are not logged in to any GitHub hosts'; then
  echo "You are not logged in to GitHub CLI."
  # Call gh auth login to start the login process
  gh auth login
else
  echo "You are already logged in to GitHub CLI."
fi

gh repo set-default zyuanming/FFmpeg-iOS

echo "Committing Changes..."
git add -u
git commit -am "Creating release for $TAG"

echo "Creating Tag..."
git tag $TAG
git push
git push origin --tags

echo "Creating Release..."
gh release create -d $TAG -t "FFmpeg-iOS $TAG" --generate-notes --verify-tag

echo "Uploading Binaries..."

XCFRAMEWORK_DIR=tool/tmp_output_frameworks
for f in $(ls "$XCFRAMEWORK_DIR")
do
    if [[ $f == *.zip ]]; then
        gh release upload $TAG "$XCFRAMEWORK_DIR/$f"
    fi
done

gh release edit $TAG --draft=false

echo "All done!"
