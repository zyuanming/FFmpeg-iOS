#!/bin/sh

rm -rf tool
git clone -b tool --depth 1 https://github.com/zyuanming/FFmpeg-iOS tool
cd tool

swift run

# TAG=v0.0.6-`date +b%Y%m%d-%H%M%S`
TAG=0.0.10

cp ../Package.swift .

for f in Frameworks/*.xcframework
do
	f=`basename $f .xcframework`
	echo $f...
	rm Package.swift.in
	mv Package.swift Package.swift.in
	sed "s#/download/[^/]*/$f\.zip[^)]*#/download/$TAG/$f.zip\", checksum: \"`swift package compute-checksum Frameworks/$f.zip`\"#" Package.swift.in > Package.swift
done

rm ../Package.swift
mv Package.swift ..

echo "::set-output name=tag::$TAG"



cd ..

echo "Install build dependencies..."
brew install autoconf automake libtool pkg-config curl git doxygen nasm bison wget gettext gh

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

XCFRAMEWORK_DIR=tool/Frameworks
for f in $(ls "$XCFRAMEWORK_DIR")
do
    if [[ $f == *.zip ]]; then
        gh release upload $TAG "$XCFRAMEWORK_DIR/$f"
    fi
done

gh release edit $TAG --draft=false

echo "All done!"
