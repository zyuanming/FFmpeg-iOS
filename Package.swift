// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "FFmpeg-iOS",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "FFmpeg-iOS",
            targets: [
                "avcodec", "avutil", "avformat", "avfilter", "avdevice", "swscale", "swresample", "dav1d"
                "fftools", "Dummy",
            ]),
    ],
    dependencies: [
        .package(url: "https://github.com/kewlbear/FFmpeg-iOS-Support", from: "0.0.1"),
    ],
    targets: [
        .binaryTarget(name: "avcodec", url: "https://github.com/zyuanming/FFmpeg-iOS/releases/download/0.0.6/libavcodec.zip", checksum: "0fed219db6f8e959b6595e664255b0deb88ecee1eb2e1a938bd4fe7c6c42937e"),
        .binaryTarget(name: "avutil", url: "https://github.com/zyuanming/FFmpeg-iOS/releases/download/0.0.6/libavutil.zip", checksum: "4ceb499953b778a3c925d9806aac0d7c035acca68f6bf2fefb062b299dffe7c9"),
        .binaryTarget(name: "avformat", url: "https://github.com/zyuanming/FFmpeg-iOS/releases/download/0.0.6/libavformat.zip", checksum: "ff5c0c2c884a213f13ba41cc1c1d92db0282b5b8c28235771042dbac97365619"),
        .binaryTarget(name: "avfilter", url: "https://github.com/zyuanming/FFmpeg-iOS/releases/download/0.0.6/libavfilter.zip", checksum: "120513c6c3c53cb26d6ed34927144578b4a18fcdc7d4c1860c0bbfd50d3871d6"),
        .binaryTarget(name: "avdevice", url: "https://github.com/zyuanming/FFmpeg-iOS/releases/download/0.0.6/libavdevice.zip", checksum: "cca615e251b331ef7a350078853ceaaed0994707f297a6b9d5c68d96338e24de"),
        .binaryTarget(name: "swscale", url: "https://github.com/zyuanming/FFmpeg-iOS/releases/download/0.0.6/libswscale.zip", checksum: "620a9c011ed11c84e28dfb3e871d8034281edb5aa3654128203ccae6accec309"),
        .binaryTarget(name: "swresample", url: "https://github.com/zyuanming/FFmpeg-iOS/releases/download/0.0.6/libswresample.zip", checksum: "c089fb1901a8a037a85136a8ec225d7436bfb291cd5194ef85c6c07d3df39e9d"),
        .binaryTarget(name: "dav1d", url: "https://github.com/zyuanming/FFmpeg-iOS/releases/download/0.0.6/libdav1d.zip", checksum: "e8516e1ba3e34503bcf8c23820864a585e641454064def2f91dc5cced2b4f73c"),
        .binaryTarget(name: "fftools", url: "https://github.com/zyuanming/FFmpeg-iOS/releases/download/0.0.6/fftools.zip", checksum: "2cbe76b57a8288ef89d88363d4980bf5ed6d545dfa5a2bb1c974abf2a931bada"),
        .target(name: "Dummy", dependencies: [
            "fftools",
            "avcodec", "avformat", "avfilter", "avdevice", "avutil", "swscale", "swresample", "dav1d"
            "FFmpeg-iOS-Support",
        ]),
        .testTarget(name: "FFmpeg-iOSTests",
                    dependencies: ["Dummy",]),
    ]
)
