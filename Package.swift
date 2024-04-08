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
        .binaryTarget(name: "avcodec", url: "https://github.com/zyuanming/FFmpeg-iOS/releases/download/0.0.10/avcodec.zip", checksum: "7031d10751303bef09df9b3b16f50b88e729126d7bbc4b0359ab826bf2a9f208"),
        .binaryTarget(name: "avutil", url: "https://github.com/zyuanming/FFmpeg-iOS/releases/download/0.0.10/avutil.zip", checksum: "456b63195e361e40b436c767fce971e07b2dca5a27b69c6c0aca9f47a3bf7757"),
        .binaryTarget(name: "avformat", url: "https://github.com/zyuanming/FFmpeg-iOS/releases/download/0.0.10/avformat.zip", checksum: "e9af19f207e5cb10eda090c93a360f906bcb18d661949a6bb67036cbedb4a408"),
        .binaryTarget(name: "avfilter", url: "https://github.com/zyuanming/FFmpeg-iOS/releases/download/0.0.10/avfilter.zip", checksum: "0255e6096259a9a4e7a81363e50edfa0cc24472379b2192171b53f72fe7187cb"),
        .binaryTarget(name: "avdevice", url: "https://github.com/zyuanming/FFmpeg-iOS/releases/download/0.0.10/avdevice.zip", checksum: "c5577513a0693880fc3669885f82ac5b0eb461276b40361cd0d8a42f7a1e6568"),
        .binaryTarget(name: "swscale", url: "https://github.com/zyuanming/FFmpeg-iOS/releases/download/0.0.10/swscale.zip", checksum: "9d307686c1a167cf62534b42e6c56e5a30ec59622d5370867e78047676c74660"),
        .binaryTarget(name: "swresample", url: "https://github.com/zyuanming/FFmpeg-iOS/releases/download/0.0.10/swresample.zip", checksum: "31abc749b41aaa914bb973123eb6391c8af1e03514c217158e50c7fc984f0dee"),
        .binaryTarget(name: "fftools", url: "https://github.com/zyuanming/FFmpeg-iOS/releases/download/0.0.10/fftools.zip", checksum: "8e4cd89e779665234ac8f5c84cab1336d626c42e861f7c8af590485b6aaa8149"),
        .target(name: "Dummy", dependencies: [
            "fftools",
            "avcodec", "avformat", "avfilter", "avdevice", "avutil", "swscale", "swresample",
            "FFmpeg-iOS-Support",
        ]),
        .testTarget(name: "FFmpeg-iOSTests",
                    dependencies: ["Dummy",]),
    ]
)
