//
//  RealityKitDebugger.swift
//  RealityKitDebugger
//
//  Copyright © 2021 Chris Davis, nthState .
//  Released under the Apache 2 License.
//
//  See https://github.com/nthState/RealityKitDebugger/blob/master/LICENSE for license information.
//

import RealityKit

public enum VisualizationShape {
  case sphere
  case cube
}

public class RealityKitDebugger {
  
  /**
   Creates a QuickLookable Visual Display of a RealityKit Transform
   
   ~~~
   // When debugging hover over the variable to get a visual display:
   let transform = Transform.init(scale: SIMD3<Float>(1,2,1), rotation: simd_quatf(angle: 1, axis: SIMD3<Float>(1,2,1)), translation: SIMD3<Float>(0.1,0,0))
   let hoverOverMe = RealityKitDebugger.quicklook(transform: transform)
   ~~~
   
   - Parameter transform: The transform to debug
   
   - Returns: A QuickLook Debuggable Transform
   */
  public class func quicklook(transform: Transform, shape: VisualizationShape = .sphere) -> QuickLookTransform {
    return QuickLookTransform(transform: transform, shape: shape)
  }
  
  public class func quicklook(vector: SIMD3<Float>) -> QuickLookVector {
    return QuickLookVector(vector: vector)
  }
  
  public class func quicklook(material: SimpleMaterial, shape: VisualizationShape = .sphere) -> QuickLookMaterial {
    return QuickLookMaterial(material: material, shape: shape)
  }
  
}
