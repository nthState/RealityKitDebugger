# RealityKitDebugger

*The missing Xcode Debugger Tools for RealityKit*

Have you ever had the problem of debugging a `Transform` and you see something like this in the `Console` - and you think to yourself, I know exactly how that looks in 3D space?.... me neither.

```
Printing description of transform:
▿ Transform
  ▿ scale : SIMD3<Float>(1.0, 2.0, 1.0)
    ▿ _storage : SIMD4Storage
      - _value : (Opaque Value)
  ▿ rotation : simd_quatf(real: 0.87758255, imag: SIMD3<Float>(0.47942555, 0.9588511, 0.47942555))
    ▿ vector : SIMD4<Float>(0.47942555, 0.9588511, 0.47942555, 0.87758255)
      ▿ _storage : SIMD4Storage
        - _value : (Opaque Value)
  ▿ translation : SIMD3<Float>(0.1, 0.0, 0.0)
    ▿ _storage : SIMD4Storage
      - _value : (Opaque Value)
```

RealityKitDebugger is a drop in tool to give you Visual Feedback on how things look in 3D space.

## How to use

Install the Swift Package

```
let transform = Transform.init(scale: .one,
                               rotation: simd_quatf(angle: 0, axis: SIMD3<Float>(0,0,0)),
                               translation: SIMD3<Float>(0,0.5,0))
#if DEBUG
let debugTransform = RealityKitDebugger.quicklook(transform: transform, shape: .cube)
#endif
```

Gives:

![Transform](https://github.com/nthState/RealityKitDebugger/blob/main/Images/transform1.png?raw=true)

```
let vector = SIMD3<Float>(0.4,0.2,0.4)
#if DEBUG
let debugVector = RealityKitDebugger.quicklook(vector: vector)
#endif
```

![Vector](https://github.com/nthState/RealityKitDebugger/blob/main/Images/vector1.png?raw=true)

## Features

- [x] Visually debug `Transform`
- [x] Visually debug `SIMD3<Float>` Vectors
- [x] Visually debug `Material`

## Requirements

- iOS 13.0+ 
- Xcode 12.0
- Swift 5.0

## Installation

### Swift Package Manager

For ease-of-use, please use the Swift Package Manager installation of this code.

```swift
// swift-tools-version:5.0

import PackageDescription
let package = Package(
    name: "<Your Product Name>",
    dependencies: [
        .package(url: "https://github.com/nthState/RealityKitDebugger.git")
    ],
    targets: [
        .target(
        name: "<Your Target Name>",
        dependencies: ["RealityKitDebugger"]),
    ]
)
```

After adding the dependency, you can fetch the library with:

```bash
$ swift package resolve
```

## Why this exists

Currently `struct` types in RealityKit don't support the function `func debugQuickLookObject() -> AnyObject` which is used internally by Xcode 
to render QuickLook displays of variables in the debugger.

This code is a simple wrapper around those types to help us visualize.

I fully expect Apple to add native support for this in future. 

## Future

- [ ] Apple adds further support for debugging RealityKit types in Xcode.
- [ ] It would be great if we could give a live QiickLook view, instead of a rendered image, that way the user could pan the result

## Todo

- [ ] Material viewer has issues
