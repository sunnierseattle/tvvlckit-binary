# TVVLCKit binary

VideoLAN's prebuilt [TVVLCKit](https://code.videolan.org/videolan/VLCKit) for tvOS, repackaged
as a zip that Swift Package Manager can download as a binary target.

The framework is VideoLAN's build, unmodified, with one difference: the debug symbols (and the
`Info.plist` entries naming them) are removed, which takes the download from 612 MB to 52 MB. `repackage.sh` rebuilds the zip
from VideoLAN's own download and checks it against VideoLAN's published checksum.

| Release | TVVLCKit | libVLC | Source tarball (VideoLAN) | SwiftPM checksum |
|---|---|---|---|---|
| 3.7.4 | 3.7.4 | 3.0.24 | `TVVLCKit-3.0-20260930-0854.tar.xz` (sha256 `07892cae…65d5`) | `aefa4a26b590b149468ba4e6af40d55d036af258e99e36836005bf170f929bea` |

```swift
.binaryTarget(
    name: "TVVLCKit",
    url: "https://github.com/sunnierseattle/tvvlckit-binary/releases/download/3.7.4/TVVLCKit.xcframework.zip",
    checksum: "aefa4a26b590b149468ba4e6af40d55d036af258e99e36836005bf170f929bea")
```

## License

VLCKit and libVLC are licensed under the GNU LGPL 2.1 (`COPYING.txt`, from VideoLAN's
download). Source code: https://code.videolan.org/videolan/VLCKit and
https://code.videolan.org/videolan/vlc. This repository only redistributes VideoLAN's
binary; it is not affiliated with VideoLAN.
