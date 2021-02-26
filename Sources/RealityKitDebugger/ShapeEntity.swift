//
//  ShapeEntity.swift
//  RealityKitDebugger
//
//  Copyright © 2021 Chris Davis, nthState .
//  Released under the Apache 2 License.
//
//  See https://github.com/nthState/RealityKitDebugger/blob/master/LICENSE for license information.
//

import RealityKit
import UIKit

class ShapeEntity: Entity, HasModel, HasAnchoring {
  
  required init(material: SimpleMaterial, mesh: MeshResource = .generateSphere(radius: 0.1)) {
    super.init()
    self.components[ModelComponent] = ModelComponent(
      mesh: mesh,
      materials: [material]
    )
  }
  
  required init() {
    fatalError("init() has not been implemented")
  }
}

