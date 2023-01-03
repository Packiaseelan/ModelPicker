//
//  CustomARView.swift
//  ModelPicker
//
//  Created by Packiaseelan S on 03/01/23.
//

import RealityKit
import ARKit
import FocusEntity

class CustomARView: ARView {
    
    let focusSqare = FESquare()
    
    required init(frame frameRect: CGRect) {
        super.init(frame: frameRect)
        
        focusSqare.viewDelegate = self
        focusSqare.delegate = self
        focusSqare.setAutoUpdate(to: true)
        
        setupARView()
    }
    
    @MainActor required dynamic init?(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupARView() {
        let config = ARWorldTrackingConfiguration()
        config.planeDetection = [.horizontal, .vertical]
        config.environmentTexturing = .automatic
        
        if ARWorldTrackingConfiguration.supportsSceneReconstruction(.mesh) {
            config.sceneReconstruction = .mesh
        }
        
        self.session.run(config)
    }
}

extension CustomARView: FEDelegate {
    func toTrackingState() {
        print("tracking")
    }
    
    func toInitializingState() {
        print("Initializing")
    }
}
