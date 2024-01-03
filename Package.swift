import PackageDescription

let package = Package(
    name: "PasteboardNotifications",
    targets: [
        .target(
            name: "PasteboardNotifications",
            sources: ["Sources"]
        ),
    ]
)