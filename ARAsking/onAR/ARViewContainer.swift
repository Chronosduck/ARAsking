//
//  ARViewContainer.swift
//  Cosmoclub
//
//  Created by Admin on 27/4/2568 BE.
//



import SwiftUI
import RealityKit
import ARKit

struct ARViewContainer: UIViewRepresentable {
    var modelName: String?
    
    func makeUIView(context: Context) -> ARView {
        let arView = ARView(frame: .zero)
        
        let config = ARWorldTrackingConfiguration()
        config.planeDetection = [.horizontal, .vertical]
        config.environmentTexturing = .automatic
        
        let coachingOverlay = ARCoachingOverlayView()
        coachingOverlay.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        coachingOverlay.session = arView.session
        coachingOverlay.goal = .horizontalPlane
        arView.addSubview(coachingOverlay)
        
        let rotateGesture = UIRotationGestureRecognizer(target: context.coordinator, action: #selector(Coordinator.handleRotate(_:)))
        arView.addGestureRecognizer(rotateGesture)
        
        let pinchGesture = UIPinchGestureRecognizer(target: context.coordinator, action: #selector(Coordinator.handlePinch(_:)))
        arView.addGestureRecognizer(pinchGesture)
        
        arView.session.run(config)
        context.coordinator.arView = arView
        
        return arView
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {
        if let modelName = modelName {
            context.coordinator.loadModel(named: modelName)
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator()
    }
    
    class Coordinator {
        weak var arView: ARView?
        var currentModel: String?
        var currentEntity: ModelEntity?
        
        func loadModel(named name: String) {
            guard let arView = arView, currentModel != name else { return }
            currentModel = name
            
            arView.scene.anchors.removeAll()
            
            do {
                let modelEntity = try ModelEntity.loadModel(named: name)
                modelEntity.generateCollisionShapes(recursive: true)
                
                let anchor = AnchorEntity(world: [0, 0, -1.5])
                anchor.addChild(modelEntity)
                arView.scene.addAnchor(anchor)
                
                self.currentEntity = modelEntity
                
            } catch {
                print("Error loading model: \(error)")
                let errorEntity = ModelEntity(mesh: .generateBox(size: 0.1))
                errorEntity.model?.materials = [SimpleMaterial(color: .red, isMetallic: false)]
                let anchor = AnchorEntity(plane: .horizontal)
                anchor.addChild(errorEntity)
                arView.scene.addAnchor(anchor)
            }
        }
        

        @objc func handleRotate(_ gesture: UIRotationGestureRecognizer) {
            guard let _ = arView, let entity = currentEntity else { return }
            
            if gesture.state == .changed {
                let rotation = Float(gesture.rotation)
                entity.transform.rotation *= simd_quatf(angle: rotation, axis: [0, 1, 0])
                gesture.rotation = 0
            }
        }
        
        @objc func handlePinch(_ gesture: UIPinchGestureRecognizer) {
            guard let entity = currentEntity else { return }
            
            if gesture.state == .changed {
                let scale = Float(gesture.scale)
                entity.scale *= SIMD3<Float>(repeating: scale)
                gesture.scale = 1.0 // Reset scale delta
            }
        }
    }
}
