//
//  PredatorRow.swift
//  JP Apex Predators
//
//  Created by Atacan Sevim on 25.10.2023.
//

import SwiftUI

struct PredatorRow: View {
    let predator: ApexPredator
    
    var body: some View {
        HStack {
            Image(predator.name.lowercased().filter { $0 != " "})
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .shadow(color: .black, radius: 1)
            
            VStack(alignment: .leading) {
                Text(predator.name)
                    .fontWeight(.bold)
                Text(predator.type)
                    .fontWeight(.bold)
                    .font(.subheadline)
                    .padding(.horizontal, 13)
                    .padding(.vertical, 5)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(predator.typeOverlayColor()).opacity(0.33)
                    )
            }
        }
    }
}

#Preview {
    PredatorRow(
        predator: ApexPredator(
            id: 1,
            name: "Tyrannosaurus Rex",
            type: "Land",
            movies: [""],
            movieScenes: [
                MovieScene(
                    id: 1,
                    movie: "",
                    sceneDescription: ""
                )
            ],
            link: ""
        )
    )
}
