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
        .binaryTarget(name: "avcodec", url: "https://github.com/zyuanming/FFmpeg-iOS/releases/download/0.0.7/avcodec.zip", checksum: "2291eb688093d5822c6c219fbafd8f99bd9d717fd5edba22b46650e8408e7038"),
        .binaryTarget(name: "avutil", url: "https://github.com/zyuanming/FFmpeg-iOS/releases/download/0.0.7/avutil.zip", checksum: "39131f311bd818eafe6910a17ce67818362ea55dde88b7a5b6ec4693c9c66528"),
        .binaryTarget(name: "avformat", url: "https://github.com/zyuanming/FFmpeg-iOS/releases/download/0.0.7/avformat.zip", checksum: "11f7f33616dc9ed7b4d677c1df7e2f53d8e3ae82c5164d84dd4e6f3a30819680"),
        .binaryTarget(name: "avfilter", url: "https://github.com/zyuanming/FFmpeg-iOS/releases/download/0.0.7/avfilter.zip", checksum: "ac83ff255c3d00259f8d24e58dcb2734daa800b1fb7014e7fc93bf63ab81c642"),
        .binaryTarget(name: "avdevice", url: "https://github.com/zyuanming/FFmpeg-iOS/releases/download/0.0.7/avdevice.zip", checksum: "fcc39f075c63fb8b5addfe137ab8e4dd45964d8adf3e0faf31e30b0d22fbf92d"),
        .binaryTarget(name: "swscale", url: "https://github.com/zyuanming/FFmpeg-iOS/releases/download/0.0.7/swscale.zip", checksum: "9ec003015b6924e80edf6f02d66abc422c40f372e233eb017dbd7e73a132208f"),
        .binaryTarget(name: "swresample", url: "https://github.com/zyuanming/FFmpeg-iOS/releases/download/0.0.7/swresample.zip", checksum: "e3bba918835e6ba4f592db69fb436addf6d381e4ce2d2086ad8d00fc6f8d7068"),
        .binaryTarget(name: "fftools", url: "https://github.com/zyuanming/FFmpeg-iOS/releases/download/0.0.7/fftools.zip", checksum: "3009cd1cb275a954d1407b5b5361c775373ba283ff69d4d02011ff128d49a0b8"),
        .target(name: "Dummy", dependencies: [
            "fftools",
            "avcodec", "avformat", "avfilter", "avdevice", "avutil", "swscale", "swresample",
            "FFmpeg-iOS-Support",
        ]),
        .testTarget(name: "FFmpeg-iOSTests",
                    dependencies: ["Dummy",]),
    ]
)
