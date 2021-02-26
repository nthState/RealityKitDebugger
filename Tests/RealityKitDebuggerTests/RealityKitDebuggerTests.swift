//
//  RealityKitDebuggerTests.swift
//  RealityKitDebugger
//
//  Copyright © 2021 Chris Davis, nthState .
//  Released under the Apache 2 License.
//
//  See https://github.com/nthState/RealityKitDebugger/blob/master/LICENSE for license information.
//

import XCTest
import RealityKit
@testable import RealityKitDebugger

/**
 These are not typical unit tests,
 I instantiate the specific QuickLook I want to check
 Set a break point, and then hover over the variable
 The appropriate QuickLook should display
 */
final class RealityKitDebuggerTests: XCTestCase {
  
  func testQuickLookMaterialOrange() {
    
    // Hovering over `material` will yield no decent quick look
    let material = SimpleMaterial(color: UIColor.orange, isMetallic: false)
    
    // Breakpoint the next line, Hovering over `debugMaterial` should yield a decent quick look
    let debugMaterial = QuickLookMaterial(material: material)
  }
  
  func testQuickLookMaterialGreen() {
    
    // Hovering over `material` will yield no decent quick look
    let material = SimpleMaterial(color: UIColor.green, isMetallic: false)
    
    // Breakpoint the next line, Hovering over `debugMaterial` should yield a decent quick look
    let debugMaterial = QuickLookMaterial(material: material, shape: .cube)
  }
  
  func testQuickLookVector() {
    
    // Hovering over `vector` will yield no decent quick look
    let vector = SIMD3<Float>(0.4,0.2,0.4)
    
    // Breakpoint the next line, Hovering over `debugVector` should yield a decent quick look
    let debugVector = QuickLookVector(vector: vector)
  }
  
  func testQuickLookTransform() {
    
    // Hovering over `transform` will yield no decent quick look
    let transform = Transform.init(scale: SIMD3<Float>(1,2,1),
                                   rotation: simd_quatf(angle: 1, axis: SIMD3<Float>(1,2,1)),
                                   translation: SIMD3<Float>(0.1,0,0))
    
    // Breakpoint the next line, Hovering over `debugTransform` should yield a decent quick look
    let debugTransform = QuickLookTransform(transform: transform)
  }
  
  func testQuickLookTransformTranslationXPositive() {
    
    // Hovering over `transform` will yield no decent quick look
    let transform = Transform.init(scale: .one,
                                   rotation: simd_quatf(angle: 0, axis: SIMD3<Float>(0,0,0)),
                                   translation: SIMD3<Float>(0.5,0,0))
    
    // Breakpoint the next line, Hovering over `debugTransform` should yield a decent quick look
    let debugTransform = QuickLookTransform(transform: transform)
  }
  
  func testQuickLookTransformTranslationYPositive() {
    
    // Hovering over `transform` will yield no decent quick look
    let transform = Transform.init(scale: .one,
                                   rotation: simd_quatf(angle: 0, axis: SIMD3<Float>(0,0,0)),
                                   translation: SIMD3<Float>(0,0.5,0))
    
    // Breakpoint the next line, Hovering over `debugTransform` should yield a decent quick look
    let debugTransform = QuickLookTransform(transform: transform, shape: .cube)
  }
  
  static var allTests = [
    ("testQuickLookMaterial", testQuickLookMaterialOrange),
    ("testQuickLookMaterial", testQuickLookMaterialGreen),
    ("testQuickLookVector", testQuickLookVector),
    ("testQuickLookTransform", testQuickLookTransform),
    ("testQuickLookTransformTranslationXPositive", testQuickLookTransformTranslationXPositive),
    ("testQuickLookTransformTranslationYPositive", testQuickLookTransformTranslationYPositive),
  ]
}
