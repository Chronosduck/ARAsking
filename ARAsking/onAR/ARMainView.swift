//
//  ARMainView.swift
//  Cosmoclub
//
//  Created by Admin on 27/4/2568 BE.
//

import SwiftUI

struct ARMainView: View {
    @State private var selectedCategory: ModelCategory? = nil
    @State private var selectedModelName: String? = nil
    @State private var showModelList: Bool = false
    
    var body: some View {
        ZStack {
            ARViewContainer(modelName: selectedModelName)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                HStack(spacing: 20) {
                    CategoryButton(title: "Solar System") {
                        withAnimation {
                            selectedCategory = .solarSystem
                            showModelList = true
                        }
                    }
                    CategoryButton(title: "Stars") {
                        withAnimation {
                            selectedCategory = .stars
                            showModelList = true
                        }
                    }
                    CategoryButton(title: "Spacecraft") {
                        withAnimation {
                            selectedCategory = .spacecraft
                            showModelList = true
                        }
                    }
                }
                .background(.ultraThinMaterial)
                .padding()
            }
            
            if showModelList, let category = selectedCategory {
                SideModelPicker(
                    category: category,
                    onClose: { withAnimation { showModelList = false } }
                ) { model in
                    withAnimation {
                        selectedModelName = model.fileName
                        showModelList = false
                    }
                }
                .transition(.move(edge: .leading))
                .animation(.easeInOut, value: showModelList)
            }
        }
    }
}

struct CategoryButton: View {
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.headline)
                .padding()
                .background(.ultraThinMaterial)
                .cornerRadius(12)
        }
        .accessibilityLabel(title)
    }
}

#Preview {
    ARMainView()
}
