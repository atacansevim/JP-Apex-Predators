//
//  ContentView.swift
//  JP Apex Predators
//
//  Created by Atacan Sevim on 24.10.2023.
//

import SwiftUI

struct ContentView: View {
    let apController = ApexPredatorController()
    @State var sortAlphabetical = false
    @State var currentFilter = "All"
    
    var body: some View {
        apController.filterBy(type: currentFilter)
        
        if sortAlphabetical {
            apController.sortByAlphabetical()
        } else {
            apController.sortByMovieAppearance()
        }
        return NavigationView {
            List{
                ForEach(apController.apexPredator) { item in
                    NavigationLink(destination: PredatorDetail(predator: item)) {
                        PredatorRow(predator: item)
                    }
                }
            }
            .navigationTitle("Apex Predators")
            .toolbar {
                ToolbarItem(
                    placement: .topBarLeading) {
                        Button {
                            withAnimation {
                                sortAlphabetical.toggle()
                            }
                        } label: {
                            let imageName = sortAlphabetical ? "film" : "textformat"
                            Image(systemName: imageName)
                                .foregroundStyle(.black)
                        }
                    }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Menu {
                        Picker("Filter", selection: $currentFilter.animation()) {
                            ForEach(apController.typeFilter, id: \.self) { type in
                                HStack {
                                    Text(type)
                                    Spacer()
                                    Image(systemName: apController.typeIcon(for: type))
                                }
                            }
                        }
                    } label: {
                        Image(systemName: "slider.horizontal.3")
                            .foregroundStyle(.black)
                    }
                }
            }
            
        }
    }
}

#Preview {
    ContentView()
}
