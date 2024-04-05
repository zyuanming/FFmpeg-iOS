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
        .binaryTarget(name: "avcodec", url: "https://github.com/zyuanming/FFmpeg-iOS/releases/download/v0.0.6-b20240405-135956/avcodec.zip", checksum: "568788cdec79eeddc1eef358c60edcf81490236f62e0ba3c788a20396ec87a7d"),
        .binaryTarget(name: "avutil", url: "https://github.com/zyuanming/FFmpeg-iOS/releases/download/v0.0.6-b20240405-135956/avutil.zip", checksum: "5e5041e16cee3f915bde33b880b0fe4fe8bb1cb03a378231d47c97b806b1859a"),
        .binaryTarget(name: "avformat", url: "https://github.com/zyuanming/FFmpeg-iOS/releases/download/v0.0.6-b20240405-135956/avformat.zip", checksum: "652ef5078b03e1e4931d0f060749cec218bc9ff584771b440207e8e83fea8ccf"),
        .binaryTarget(name: "avfilter", url: "https://github.com/zyuanming/FFmpeg-iOS/releases/download/v0.0.6-b20240405-135956/avfilter.zip", checksum: "4f3e201a54b4d5d801068838920d2b3642c553ced9d13daed7681094af3cb96a"),
        .binaryTarget(name: "avdevice", url: "https://github.com/zyuanming/FFmpeg-iOS/releases/download/v0.0.6-b20240405-135956/avdevice.zip", checksum: "1d1ee1b3f3fa5bdbd42dcf00eee410c8148dcbc807a420e80901fe82a29dfa7d"),
        .binaryTarget(name: "swscale", url: "https://github.com/zyuanming/FFmpeg-iOS/releases/download/v0.0.6-b20240405-135956/swscale.zip", checksum: "ec10da20f9afa019c8b7f22a63387b232e3e1617000e4089e2814734b1968be8"),
        .binaryTarget(name: "swresample", url: "https://github.com/zyuanming/FFmpeg-iOS/releases/download/v0.0.6-b20240405-135956/swresample.zip", checksum: "f7001738aed5357baf58e3c2969af86312f3f7b3777bbe7357b1d92f6f8e0f08"),
        .binaryTarget(name: "fftools", url: "https://github.com/zyuanming/FFmpeg-iOS/releases/download/v0.0.6-b20240405-135956/fftools.zip", checksum: "279ed364c293e377db2a02e7349ec0ded16ae0dd740724f20f7c5d96728dc75f"),
        .target(name: "Dummy", dependencies: [
            "fftools",
            "avcodec", "avformat", "avfilter", "avdevice", "avutil", "swscale", "swresample",
            "FFmpeg-iOS-Support",
        ]),
        .testTarget(name: "FFmpeg-iOSTests",
                    dependencies: ["Dummy",]),
    ]
)
