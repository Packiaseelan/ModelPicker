//
//  PlacementButtonsView.swift
//  ModelPicker
//
//  Created by Packiaseelan S on 03/01/23.
//

import SwiftUI

struct PlacementButtonsView: View {
    @Binding var isPlacementEnabled: Bool
    @Binding var selectedModel: Model?
    @Binding var modelConfirmedForPlacement: Model?
    
    var body: some View {
        HStack {
            Button {
                print("DEBUG: model placement canceled.")
                resetPlacementParameters()
            } label: {
                Image(systemName: "xmark")
                    .frame(width: 60, height: 60)
                    .font(.title)
                    .background(.white.opacity(0.75))
                    .cornerRadius(30)
            }
            
            Button {
                print("DEBUG: model placement confirmed.")
                modelConfirmedForPlacement = selectedModel
                resetPlacementParameters()
            } label: {
                Image(systemName: "checkmark")
                    .frame(width: 60, height: 60)
                    .font(.title)
                    .background(.white.opacity(0.75))
                    .cornerRadius(30)
            }
        }
    }
    
    private func resetPlacementParameters() {
        isPlacementEnabled = false
        selectedModel = nil
    }
}

struct PlacementButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        PlacementButtonsView(isPlacementEnabled: .constant(true), selectedModel: .constant(Model(name: "")), modelConfirmedForPlacement: .constant(Model(name: "")))
    }
}
