//
//  RealityKitViewController.swift
//  RealityKitDebugger
//
//  Copyright © 2021 Chris Davis, nthState .
//  Released under the Apache 2 License.
//
//  See https://github.com/nthState/RealityKitDebugger/blob/master/LICENSE for license information.
//

import Foundation
import RealityKit
import SceneKit
import UIKit

internal class RealityKitViewController: UIViewController {
  
  /// The realitykit view
  var arView: ARView!
  /// Set if we are debugging a transform
  var transform: Transform?
  /// Set if we are debugging a material
  var material: SimpleMaterial?
  /// Set if we are debugging a vector
  var vector: SIMD3<Float>?
  /// Render shape
  var shape: VisualizationShape = .sphere
  
  // MARK: - Constructors
  
  init() {
    
    super.init(nibName: nil, bundle: nil)
  }
  
  convenience init(transform: Transform, shape: VisualizationShape) {
    self.init()
    
    self.transform = transform
    self.shape = shape
  }
  
  convenience init(material: SimpleMaterial, shape: VisualizationShape) {
    self.init()
    
    self.material = material
    self.shape = shape
  }
  
  convenience init(vector: SIMD3<Float>) {
    self.init()
    
    self.vector = vector
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - View lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Create a new ARView
    arView = ARView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
    // arView.debugOptions.insert(.showStatistics)
    self.view.addSubview(arView)
    
    // Let the ARView fill the view
    arView.translatesAutoresizingMaskIntoConstraints = false
    
    let constraints = [
      arView.topAnchor.constraint(equalTo: view.topAnchor),
      arView.leftAnchor.constraint(equalTo: view.leftAnchor),
      view.bottomAnchor.constraint(equalTo: arView.bottomAnchor),
      view.rightAnchor.constraint(equalTo: arView.rightAnchor)
    ]
    
    NSLayoutConstraint.activate(constraints)
    
    addDefaultAxes()
    
    setupCamera()
    
    // Try and visualize depending on what data we have
    visualizeMaterial()
    visualizeVector()
    visualizeTransform()
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
    arView.backgroundColor = .green
  }
  
}

extension RealityKitViewController {
  
  func addDefaultAxes() {
    let axes = AxesEntity(size: 1)
    arView.scene.addAnchor(axes)
  }
  
}

extension RealityKitViewController {
  
  /// We move the camera so that it's at an angle to the axes
  func setupCamera() {
    
    let cameraTransform = Transform(scale: .one,
                                    rotation: simd_quatf(angle: 0.7, axis: SIMD3<Float>(0, 1, 0)), // radians
                                    translation: SIMD3<Float>(1, 0.25, 1))
    
    let cameraEntity = PerspectiveCamera()
    //cameraEntity.camera.fieldOfViewInDegrees = 100
    
    let cameraAnchor = AnchorEntity(world: cameraTransform.matrix)
    cameraAnchor.addChild(cameraEntity)
    
    arView.scene.addAnchor(cameraAnchor)
  }
  
}

extension RealityKitViewController {
  
  /// Draw a sphere with the correct material
  func visualizeMaterial() {
    
//    guard let m = material else {
//      return
//    }
//    
//    let materialEntity = ShapeEntity(material: m, mesh: getMesh())
//    arView.scene.addAnchor(materialEntity)
    
  }
  
  /// Mark a dot where the vector end point is
  func visualizeVector() {
    
    guard let v = vector else {
      return
    }
    
    let vectorEntity = AxesEntity(size: 0.25)
    vectorEntity.position = v
    arView.scene.addAnchor(vectorEntity)
  }
  
  /// Add a sphere and set it's transform
  func visualizeTransform() {
    
    guard let t = transform else {
      return
    }
    
    let transformEntity = ShapeEntity(material: SimpleMaterial(color: UIColor.orange, isMetallic: false), mesh: getMesh())
    transformEntity.transform = t
    arView.scene.addAnchor(transformEntity)
    
  }
  
  /// Returns a mesh dependant on what the user specifiys
  /// - Returns: MeshResource
  func getMesh() -> MeshResource {
    switch shape {
    case .sphere:
      return .generateSphere(radius: 0.1)
    case .cube:
      return .generateBox(size: 0.2)
    }
  }
  
}
