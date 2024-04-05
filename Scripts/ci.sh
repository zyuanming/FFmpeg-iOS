#!/bin/sh

# git clone -b tool --depth 1 https://github.com/zyuanming/FFmpeg-iOS tool
# cd tool

# swift run

# TAG=v0.0.6-`date +b%Y%m%d-%H%M%S`

# cp ../Package.swift .

# for f in Frameworks/*.xcframework
# do
# 	f=`basename $f .xcframework`
# 	echo $f...
# 	rm Package.swift.in
# 	mv Package.swift Package.swift.in
# 	sed "s#/download/[^/]*/$f\.zip[^)]*#/download/$TAG/$f.zip\", checksum: \"`swift package compute-checksum Frameworks/$f.zip`\"#" Package.swift.in > Package.swift
# done

# rm ../Package.swift
# mv Package.swift ..

# echo "::set-output name=tag::$TAG"



# cd ..

echo "Install build dependencies..."
brew install autoconf automake libtool pkg-config curl git doxygen nasm bison wget gettext gh


echo "Committing Changes..."
git add -u
git commit -am "Creating release for $TAG"

echo "Creating Tag..."
git tag $TAG
git push
git push origin --tags

echo "Creating Release..."
gh release create -p -d $TAG -t "FFmpegKit SPM $TAG" --generate-notes --verify-tag

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
