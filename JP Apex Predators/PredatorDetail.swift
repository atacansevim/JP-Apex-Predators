//
//  PredatorDetail.swift
//  JP Apex Predators
//
//  Created by Atacan Sevim on 30.10.2023.
//

import SwiftUI

struct PredatorDetail: View {
    let predator: ApexPredator
    
    var body: some View {
        ScrollView {
            VStack(alignment: .trailing) {
                Image(predator.type)
                    .resizable()
                    .scaledToFit()
                
                Image(predator.name.lowercased().filter { $0 != " "})
                    .resizable()
                    .scaledToFit()
                    .frame(
                        width: UIScreen.main.bounds.width/1.5,
                        height: UIScreen.main.bounds.height/4
                    )
                    .shadow(radius: 6)
                    .offset(y: -210)
                    .rotation3DEffect(
                        .degrees(180),
                        axis: (x: 0.0, y: 1.0, z: 0.0)
                    )
                
                VStack(alignment: .leading) {
                    Text(predator.name)
                        .font(.title)
                        .padding(.bottom, 8)
                    
                    Text("Appear in: ")
                        .font(.title3)
                        
                    
                    ForEach(predator.movies, id: \.self) { movie in
                        Text("• \(movie)")
                            .font(.subheadline)
                    }
                    
                    Text("Movie Moments")
                        .font(.title)
                        .padding(.top, 15)
                    
                    ForEach(predator.movieScenes) { scene in
                        Text(scene.movie)
                            .font(.title2)
                        Text(scene.sceneDescription)
                            .padding(.bottom, 15)
                    }
                    Text("Read more: ")
                        .font(.caption)
                    Link(
                        predator.link,
                        destination: URL(fileURLWithPath: predator.link)
                    ).font(.caption)
                        .foregroundColor(.blue)
                }.padding(.top, -230)
                    .padding()
            }
        }.edgesIgnoringSafeArea(.top)
    }
}

#Preview {
    PredatorDetail(
        predator: ApexPredator(
            id: 1,
            name: "Tyrannosaurus Rex",
            type: "land",
            movies: ["1", "2", "4", "5"],
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
