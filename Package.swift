// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "FFmpeg-iOS",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "FFmpeg-iOS",
            targets: [
                "avcodec", "avutil", "avformat", "avfilter", "avdevice", "swscale", "swresample", "dav1d",
                "fftools", "Dummy",
            ]),
    ],
    dependencies: [
        .package(url: "https://github.com/kewlbear/FFmpeg-iOS-Support", from: "0.0.1"),
    ],
    targets: [
        .binaryTarget(name: "avcodec", url: "https://github.com/zyuanming/FFmpeg-iOS/releases/download/0.0.8/libavcodec.zip", checksum: "c647be00cd1dd346f1752e2e372f166298d0ab8d7795e168f0bded967ce88c08"),
        .binaryTarget(name: "avutil", url: "https://github.com/zyuanming/FFmpeg-iOS/releases/download/0.0.8/libavutil.zip", checksum: "bb71e9b1879d69f0e4fd1d871a15c5f54ee03854f99efca9f0d05eafb265a36f"),
        .binaryTarget(name: "avformat", url: "https://github.com/zyuanming/FFmpeg-iOS/releases/download/0.0.8/libavformat.zip", checksum: "65df616fbc96db91a01ae3e839fc667a05fa10782da2eb24729293add40b16f6"),
        .binaryTarget(name: "avfilter", url: "https://github.com/zyuanming/FFmpeg-iOS/releases/download/0.0.8/libavfilter.zip", checksum: "25df0aa5ef8d0a1f82ed34c64a536b501dc57c414ef7a7b04fa6feb730c6214c"),
        .binaryTarget(name: "avdevice", url: "https://github.com/zyuanming/FFmpeg-iOS/releases/download/0.0.8/libavdevice.zip", checksum: "e65a45e38ec6c2776758bc085fa04331b39ee8ca0b649569df9b00aeadb71089"),
        .binaryTarget(name: "swscale", url: "https://github.com/zyuanming/FFmpeg-iOS/releases/download/0.0.8/libswscale.zip", checksum: "14286a1150cadf79e847f94b959f0a4ef1363746877852e422fdae96f25ba514"),
        .binaryTarget(name: "swresample", url: "https://github.com/zyuanming/FFmpeg-iOS/releases/download/0.0.8/libswresample.zip", checksum: "e067a6904c9deb571b2806c3abe6fbe370dc6397efed9af235071ece52c52bcf"),
        .binaryTarget(name: "dav1d", url: "https://github.com/zyuanming/FFmpeg-iOS/releases/download/0.0.8/libdav1d.zip", checksum: "317370cc348b574ba39cd1ded6c8acbe900de0550172e07fbdae9aec5ebaef9a"),
        .binaryTarget(name: "fftools", url: "https://github.com/zyuanming/FFmpeg-iOS/releases/download/0.0.6/fftools.zip", checksum: "2cbe76b57a8288ef89d88363d4980bf5ed6d545dfa5a2bb1c974abf2a931bada"),
        .target(name: "Dummy", dependencies: [
            "fftools",
            "avcodec", "avformat", "avfilter", "avdevice", "avutil", "swscale", "swresample", "dav1d",
            "FFmpeg-iOS-Support",
        ]),
        .testTarget(name: "FFmpeg-iOSTests",
                    dependencies: ["Dummy",]),
    ]
)
