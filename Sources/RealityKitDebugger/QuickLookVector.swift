//
//  QuickLookVector.swift
//  RealityKitDebugger
//
//  Copyright © 2021 Chris Davis, nthState .
//  Released under the Apache 2 License.
//
//  See https://github.com/nthState/RealityKitDebugger/blob/master/LICENSE for license information.
//

import Foundation
import UIKit

public class QuickLookVector {
  
  let vector: SIMD3<Float>
  
  init(vector: SIMD3<Float>) {
    self.vector = vector
  }
  
}


extension QuickLookVector {
  
  @objc func debugQuickLookObject() -> AnyObject {
    let vc = RealityKitViewController(vector: vector)
    
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
