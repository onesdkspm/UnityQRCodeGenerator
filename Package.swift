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
            url: "https://yw-depot-nexus.100bt.com/repository/onesdk-ios-trunk/spm/UnityQRCodeGenerator/2.0.3-dev-1562014/UnityQRCodeGenerator.xcframework.zip",
            checksum: "fa03a914da98e3c811fde4272e0e33eba1a5a26e31b9ae10ad61ca636339fb31"
        )
    ]
)
