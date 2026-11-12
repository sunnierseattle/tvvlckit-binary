#!/bin/sh
# Rebuilds the release zip from VideoLAN's prebuilt TVVLCKit, unchanged except that the
# debug symbols (dSYMs, ~460 MB) are dropped. Version, URL and checksum are VideoLAN's own,
# from Packaging/podspecs/TVVLCKit.podspec in https://code.videolan.org/videolan/VLCKit.
set -e
VERSION="3.7.4"
URL="https://download.videolan.org/cocoapods/prod/TVVLCKit-3.0-20260930-0854.tar.xz"
SHA256="07892cae8e59e95a23f1fcf11692f802eae106312aa5ad9782faa2556b2d65d5"
out="$(pwd)/TVVLCKit.xcframework.zip"
tmp=$(mktemp -d)
curl -fsSL -o "$tmp/tvvlckit.tar.xz" "$URL"
echo "$SHA256  $tmp/tvvlckit.tar.xz" | shasum -a 256 -c -
tar -xf "$tmp/tvvlckit.tar.xz" -C "$tmp"
cd "$tmp/TVVLCKit-binary"
rm -rf TVVLCKit.xcframework/*/dSYMs
xattr -cr TVVLCKit.xcframework
rm -f "$out"
COPYFILE_DISABLE=1 zip -qrX -y "$out" TVVLCKit.xcframework
rm -rf "$tmp"
echo "TVVLCKit $VERSION -> $out"
swift package compute-checksum "$out"
