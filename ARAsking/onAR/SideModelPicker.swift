//
//  SideModelPicker.swift
//  CosmoClub
//
//  Created by Admin on 27/4/2568 BE.
//

import SwiftUI

struct SideModelPicker: View {
    let category: ModelCategory
    var onClose: () -> Void
    let onSelect: (ModelItem) -> Void
    
    @State private var searchText = ""
    
    var filteredModels: [ModelItem] {
        if searchText.isEmpty {
            return models(for: category)
        }
        return models(for: category).filter {
            $0.name.localizedCaseInsensitiveContains(searchText)
        }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            HStack {
                Text(category.rawValue)
                    .font(.title)
                    .bold()
                Spacer()
                Button(action: onClose) {
                    Image(systemName: "xmark.circle.fill")
                        .font(.title2)
                }
            }
            .padding(.bottom)
            
            TextField("Search", text: $searchText)
                .textFieldStyle(.roundedBorder)
                .padding(.bottom)
            
            ScrollView {
                VStack(spacing: 10) {
                    ForEach(filteredModels) { model in
                        Button(action: {
                            onSelect(model)
                        }) {
                            HStack {
                                Circle()
                                    .fill(Color.blue.opacity(0.3))
                                    .frame(width: 40, height: 40)
                                    .overlay(
                                        Text(model.emoji)
                                            .font(.title2)
                                    )
                                Text(model.name)
                                    .foregroundColor(.white)
                                Spacer()
                            }
                            .padding()
                            .background(.ultraThinMaterial)
                            .cornerRadius(10)
                        }
                        .accessibilityLabel(model.name)
                    }
                }
            }
            
            Spacer()
        }
        .padding()
        .frame(maxWidth: 250)
        .background(.ultraThinMaterial)
        .cornerRadius(20)
        .padding(.leading)
    }
}
