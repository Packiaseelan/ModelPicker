//
//  Model.swift
//  ModelPicker
//
//  Created by Packiaseelan S on 03/01/23.
//

import UIKit
import RealityKit
import Combine

class Model {
    var id = UUID()
    let name: String
    let image: String
    var entity: ModelEntity?
    
    var cancellables = Set<AnyCancellable>()
    
    init(name: String) {
        self.name = name
        self.image = name
        
        let fileName = name + ".usdz"
        ModelEntity.loadModelAsync(named: fileName)
            .sink { loadCompletion in
                print("DEBUG: Unable to load modelEntity for \(name)")
            } receiveValue: { [weak self] modelEntity in
                self?.entity = modelEntity
            }
            .store(in: &cancellables)
    }
}
