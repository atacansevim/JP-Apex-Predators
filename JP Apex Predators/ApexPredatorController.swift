//
//  ApexPredatorController.swift
//  JP Apex Predators
//
//  Created by Atacan Sevim on 24.10.2023.
//

import Foundation

class ApexPredatorController {
    var allApexPredator: [ApexPredator] = []
    var apexPredator: [ApexPredator] = []
    let typeFilter: [String] = ["All", "Land", "Air", "Sea"]
    
    init() {
        decodeApexPredator()
    }
    
    private func decodeApexPredator() {
        if let url = Bundle.main.url(forResource: "jpapexpredators", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                allApexPredator = try decoder.decode([ApexPredator].self, from: data)
                apexPredator = allApexPredator
            } catch {
                print("Error: \(error)")
            }
        }
    }
    
    func typeIcon(for type: String) -> String {
        switch type {
        case "All": return "square.stack.3d.up.fill"
        case "Land": return "leaf.fill"
        case "Air": return "wind"
        case "Sea": return "drop.fill"
        default: return "questionmark"
        }
    }
    
    func filterBy(type: String) {
        switch type {
        case "Land", "Sea", "Air":
            apexPredator = allApexPredator.filter({ item in
                type.lowercased() == item.type.lowercased()
            })
        default: apexPredator = allApexPredator
        }
    }
    
    func sortByAlphabetical() {
        apexPredator.sort(by: { $0.name < $1.name })
    }
    
    func sortByMovieAppearance() {
        apexPredator.sort(by: { $0.id < $1.id })
    }
}

