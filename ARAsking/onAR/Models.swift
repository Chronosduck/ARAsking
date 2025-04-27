//
//  Models.swift
//  Cosmoclub
//
//  Created by Admin on 27/4/2568 BE.
//

import Foundation

enum ModelCategory: String, CaseIterable, Codable {
    case solarSystem = "Solar System"
    case stars = "Stars"
    case spacecraft = "Spacecraft"
}

struct ModelItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let fileName: String
    let emoji: String
    let scale: Float
    
    static let defaultScale: Float = 0.15
}

func models(for category: ModelCategory) -> [ModelItem] {
    switch category {
    case .solarSystem:
        return [
            ModelItem(name: "Earth", fileName: "Earth", emoji: "🌍", scale: 0.05),
            ModelItem(name: "Mars", fileName: "Mars", emoji: "🔴", scale: 0.05),
            ModelItem(name: "Jupiter", fileName: "Jupiter", emoji: "🟠", scale: 0.1),
            ModelItem(name: "Mercury", fileName: "Mercury", emoji: "🟢", scale: 0.5),
            ModelItem(name: "Neptune", fileName: "Neptune", emoji: "🔵", scale: 0.05),
            ModelItem(name: "Saturn", fileName: "Saturn", emoji: "🟣", scale: 0.05)
        ]
    case .stars:
        return [
            ModelItem(name: "Sun", fileName: "Sun", emoji: "☀️", scale: 0.1)
        ]
    case .spacecraft:
        return [
            ModelItem(name: "Voyager 1", fileName: "spacecraft1", emoji: "🛰️", scale: 0.0043),
            ModelItem(name: "Voyager 2", fileName: "spacecraft2", emoji: "👽", scale: 0.05)
        ]
    }
}
