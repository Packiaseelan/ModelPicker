//
//  ModelPickerView.swift
//  ModelPicker
//
//  Created by Packiaseelan S on 03/01/23.
//

import SwiftUI

struct ModelPickerView: View {
    var models: [Model]
    @Binding var isPlacementEnabled: Bool
    @Binding var selectedModel: Model?
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 30) {
                ForEach(0..<models.count, id: \.self) { index in
                    let model = models[index]
                    Button {
                        print("DEBUG: selected model with name: \(model.name)")
                        isPlacementEnabled.toggle()
                        selectedModel = model
                    } label: {
                        Image(model.image)
                            .resizable()
                            .frame(height: 80)
                            .aspectRatio(1/1, contentMode: .fit)
                            .cornerRadius(12)
                    }
                }
            }
        }
        .padding(20)
        .background(.black.opacity(0.5))
    }
}

struct ModelPickerView_Previews: PreviewProvider {
    static var previews: some View {
        ModelPickerView(models: [], isPlacementEnabled: .constant(false), selectedModel: .constant(Model(name: "")))
    }
}
