// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "FFmpeg-iOS",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "FFmpeg-iOS",
            targets: [
                "avcodec", "avutil", "avformat", "avfilter", "avdevice", "swscale", "swresample",
                "fftools", "Dummy",
            ]),
    ],
    dependencies: [
        .package(url: "https://github.com/kewlbear/FFmpeg-iOS-Support", from: "0.0.1"),
    ],
    targets: [
        .binaryTarget(name: "avcodec", url: "https://github.com/zyuanming/FFmpeg-iOS/releases/download/0.0.6/avcodec.zip", checksum: "79e4f0ce4130ddab90e31b9ab22fad83c0228dc7a32b9a2270d80076e4bd4f76"),
        .binaryTarget(name: "avutil", url: "https://github.com/zyuanming/FFmpeg-iOS/releases/download/0.0.6/avutil.zip", checksum: "546dd335f7fe49e6ed2fb5b144b0243f98077779d8dbf1880f20e5421d8091da"),
        .binaryTarget(name: "avformat", url: "https://github.com/zyuanming/FFmpeg-iOS/releases/download/0.0.6/avformat.zip", checksum: "978c1644da234b7302fef500fb63207fc0dbb3670fa4e2b0f16689c441c39e9c"),
        .binaryTarget(name: "avfilter", url: "https://github.com/zyuanming/FFmpeg-iOS/releases/download/0.0.6/avfilter.zip", checksum: "f42199e3429c6a126523d0a1316e1b85b75dce7fa8f8874d269f6992f2b401d5"),
        .binaryTarget(name: "avdevice", url: "https://github.com/zyuanming/FFmpeg-iOS/releases/download/0.0.6/avdevice.zip", checksum: "a0706192d120449d51d74f335426fb7cbebc2e41a20b57b48e061a0aab58428e"),
        .binaryTarget(name: "swscale", url: "https://github.com/zyuanming/FFmpeg-iOS/releases/download/0.0.6/swscale.zip", checksum: "6e8f9f5abe88ed4a26e6f474363650a9bae311f7a98bc54b636e4adfd8aa64fc"),
        .binaryTarget(name: "swresample", url: "https://github.com/zyuanming/FFmpeg-iOS/releases/download/0.0.6/swresample.zip", checksum: "daf7fa37a24ac20009956893c43d34142050c1001ff27dd975f9116660e5d5da"),
        .binaryTarget(name: "fftools", url: "https://github.com/zyuanming/FFmpeg-iOS/releases/download/0.0.6/fftools.zip", checksum: "2cbe76b57a8288ef89d88363d4980bf5ed6d545dfa5a2bb1c974abf2a931bada"),
        .target(name: "Dummy", dependencies: [
            "fftools",
            "avcodec", "avformat", "avfilter", "avdevice", "avutil", "swscale", "swresample",
            "FFmpeg-iOS-Support",
        ]),
        .testTarget(name: "FFmpeg-iOSTests",
                    dependencies: ["Dummy",]),
    ]
)
