# TVVLCKit binary

VideoLAN's prebuilt [TVVLCKit](https://code.videolan.org/videolan/VLCKit) for tvOS, repackaged
as a zip that Swift Package Manager can download as a binary target.

The framework is VideoLAN's build, unmodified, with one difference: the debug symbols are
removed, which takes the download from 612 MB to 52 MB. `repackage.sh` rebuilds the zip
from VideoLAN's own download and checks it against VideoLAN's published checksum.

| Release | TVVLCKit | libVLC | Source tarball (VideoLAN) | SwiftPM checksum |
|---|---|---|---|---|
| 3.7.4 | 3.7.4 | 3.0.24 | `TVVLCKit-3.0-20260930-0854.tar.xz` (sha256 `07892cae…65d5`) | `9616b858df28a5a4c161f9ca5d3dd8b38f1fd7df9cc3c17daf1512811755b1c8` |

```swift
.binaryTarget(
    name: "TVVLCKit",
    url: "https://github.com/sunnierseattle/tvvlckit-binary/releases/download/3.7.4/TVVLCKit.xcframework.zip",
    checksum: "9616b858df28a5a4c161f9ca5d3dd8b38f1fd7df9cc3c17daf1512811755b1c8")
```

## License

VLCKit and libVLC are licensed under the GNU LGPL 2.1 (`COPYING.txt`, from VideoLAN's
download). Source code: https://code.videolan.org/videolan/VLCKit and
https://code.videolan.org/videolan/vlc. This repository only redistributes VideoLAN's
binary; it is not affiliated with VideoLAN.
