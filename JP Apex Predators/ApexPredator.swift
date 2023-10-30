//
//  ApexPredator.swift
//  JP Apex Predators
//
//  Created by Atacan Sevim on 24.10.2023.
//

import Foundation
import SwiftUI

struct ApexPredator: Decodable, Identifiable {
    let id: Int
    let name: String
    let type: String
    let movies: [String]
    let movieScenes: [MovieScene]
    let link: String
    
    private enum CodingKeys: String, CodingKey {
        case movieScenes = "movie_scenes"
        case id
        case name
        case type
        case movies
        case link
    }
    
    func typeOverlayColor() -> Color {
        switch type {
        case "land": return .brown
        case "air": return .teal
        case "sea": return .blue
        default:
            return .red
        }
    }
}
 
struct MovieScene: Decodable, Identifiable  {
    let id: Int
    let movie: String
    let sceneDescription: String
    
    private enum CodingKeys: String, CodingKey {
        case sceneDescription = "scene_description"
        case id
        case movie
    }
}
