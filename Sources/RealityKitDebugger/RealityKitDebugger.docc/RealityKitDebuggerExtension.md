# ``RealityKitDebugger``

Reality Kit Debugging Tools

## Overview

When using a Transform and hit a breakpoint, you can hover over the quickLook to
see an visual representation of what the item looks like

```
let transform = Transform.init(scale: .one,
                               rotation: simd_quatf(angle: 0, axis: SIMD3<Float>(0,0,0)),
                               translation: SIMD3<Float>(0,0.5,0))
#if DEBUG
let debugTransform = RealityKitDebugger.quicklook(transform: transform, shape: .cube)
#endif
```
