//
//  QuickLookTransform.swift
//  RealityKitDebugger
//
//  Copyright © 2021 Chris Davis, nthState .
//  Released under the Apache 2 License.
//
//  See https://github.com/nthState/RealityKitDebugger/blob/master/LICENSE for license information.
//

import Foundation
import RealityKit
import UIKit

public class QuickLookTransform {
  
  let transform: Transform
  let shape: VisualizationShape
  
  init(transform: Transform, shape: VisualizationShape = .sphere) {
    self.transform = transform
    self.shape = shape
  }
  
}

extension QuickLookTransform {
  
  @objc func debugQuickLookObject() -> AnyObject {
    
    let vc = RealityKitViewController(transform: transform, shape: shape)
    
    // Force load
    let _ = vc.view!
    
    var image: UIImage?
    
    vc.arView.snapshot(saveToHDR: false) { (resultImage) in
      image = resultImage
    }
    
    while (image == nil) {
      RunLoop.current.run(mode: .default, before: Date(timeIntervalSinceNow: 1))
    }
    
    guard let img = image else {
      return "no image found" as AnyObject
    }
    
    return img
  }
  
}
