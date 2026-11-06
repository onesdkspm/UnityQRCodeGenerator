// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "UnityQRCodeGenerator",
    platforms: [.iOS(.v12)],
    products: [
        .library(
            name: "UnityQRCodeGenerator",
            targets: ["UnityQRCodeGeneratorWrapper"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/onesdkspm/BTQRCode.git", from: "2.0.3"),
    ],
    targets: [
        // ========== Wrapper Target（统一管理系统依赖）==========
        .target(
            name: "UnityQRCodeGeneratorWrapper",
            dependencies: [
                .byName(name: "UnityQRCodeGenerator"),
                .product(name: "BTQRCode", package: "BTQRCode"),
            ],
            path: "UnityQRCodeGeneratorWrapper",
            linkerSettings: [
                // iOS 系统框架
                
                // 系统库
            ]
        ),
        
        // ========== Binary Frameworks ==========
        .binaryTarget(
            name: "UnityQRCodeGenerator",
            url: "https://yw-depot-nexus.100bt.com/repository/onesdk-ios-trunk/spm/UnityQRCodeGenerator/2.0.3/UnityQRCodeGenerator.xcframework.zip",
            checksum: "f85d618eb6c65cc947cf94f2f0b6067317d2b5db5bb1c51cd0f035c97f83353d"
        )
    ]
)
