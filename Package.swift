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
        .binaryTarget(name: "avcodec", url: "https://github.com/zyuanming/FFmpeg-iOS/releases/download/0.0.9/avcodec.zip", checksum: "07788f4ff6c0ca748044f56789038d1f7c1d7a29dd9b019e6dcd990832af2a64"),
        .binaryTarget(name: "avutil", url: "https://github.com/zyuanming/FFmpeg-iOS/releases/download/0.0.9/avutil.zip", checksum: "60fdac3fea8563e29c035fcfc949e1a77b463c96644550b449d8c13f576d27d7"),
        .binaryTarget(name: "avformat", url: "https://github.com/zyuanming/FFmpeg-iOS/releases/download/0.0.9/avformat.zip", checksum: "ff4f4c003b4a654348c42cf8e518f5fdcc8b451ac04a988ab451224ca3d02f98"),
        .binaryTarget(name: "avfilter", url: "https://github.com/zyuanming/FFmpeg-iOS/releases/download/0.0.9/avfilter.zip", checksum: "34e65867752576a930d866af886eca85e2d6963d30a1bf799a1492026073f617"),
        .binaryTarget(name: "avdevice", url: "https://github.com/zyuanming/FFmpeg-iOS/releases/download/0.0.9/avdevice.zip", checksum: "3642e65d26dccaab61ac22803e38f21192ee1830efff378a9605ac3e767d7db4"),
        .binaryTarget(name: "swscale", url: "https://github.com/zyuanming/FFmpeg-iOS/releases/download/0.0.9/swscale.zip", checksum: "96590fda2163a8f9cb12d1eb1e17a12c7d98c771c8c70abcf96a0dcba1d2e7fd"),
        .binaryTarget(name: "swresample", url: "https://github.com/zyuanming/FFmpeg-iOS/releases/download/0.0.9/swresample.zip", checksum: "d8da08a9c60f15abbdcfd129e2d72d603b4588dae65c02a63924af59c64aa24b"),
        .binaryTarget(name: "fftools", url: "https://github.com/zyuanming/FFmpeg-iOS/releases/download/0.0.9/fftools.zip", checksum: "4fb0864c4257c4afadbbefe421f87b188ca23bb2e3d729df083e000b59538769"),
        .target(name: "Dummy", dependencies: [
            "fftools",
            "avcodec", "avformat", "avfilter", "avdevice", "avutil", "swscale", "swresample",
            "FFmpeg-iOS-Support",
        ]),
        .testTarget(name: "FFmpeg-iOSTests",
                    dependencies: ["Dummy",]),
    ]
)
