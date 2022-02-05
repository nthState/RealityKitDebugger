//
//  AxesEntity.swift
//  RealityKitDebugger
//
//  Copyright © 2021 Chris Davis, nthState .
//  Released under the Apache 2 License.
//
//  See https://github.com/nthState/RealityKitDebugger/blob/master/LICENSE for license information.
//

import RealityKit
import UIKit

internal class AxesEntity: Entity, HasModel, HasAnchoring {
  
  required init(size: Float) {
    super.init()
    
    self.addChild(AxesEntity.generateCoordinateSystemAxes(width: 0.05 * size, height: 2 * size, depth: 0.05 * size))
  }
  
  required init() {
    fatalError("init() has not been implemented")
  }
}

extension AxesEntity {
  
  static func generateCoordinateSystemAxes(width: Float = 0.1, height: Float = 1, depth: Float = 0.1) -> Entity {
    
    let cornerRadius: Float = 0.2
    
    let xAxisBox = MeshResource.generateBox(size: [width, height, depth], cornerRadius: cornerRadius)
    let yAxisBox = MeshResource.generateBox(size: [depth, width, height], cornerRadius: cornerRadius)
    let zAxisBox = MeshResource.generateBox(size: [height, depth, width], cornerRadius: cornerRadius)
    
    let xAxis = ModelEntity(mesh: zAxisBox, materials: [UnlitMaterial(color: .blue)])
    let yAxis = ModelEntity(mesh: xAxisBox, materials: [UnlitMaterial(color: .red)])
    let zAxis = ModelEntity(mesh: yAxisBox, materials: [UnlitMaterial(color: .green)])
    
    let axes = Entity()
    axes.addChild(xAxis)
    axes.addChild(yAxis)
    axes.addChild(zAxis)
    return axes
  }
}

