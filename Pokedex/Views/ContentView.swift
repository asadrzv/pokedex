//
//  ContentView.swift
//  Pokedex
//
//  Created by Asad Rizvi on 11/18/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var pokemonViewModel = PokemonViewModel()
    // Adaptive grid columns that fit as many cells per row as possible
    // using a minimum size of _ pts each
    private let columns = [
        GridItem(.adaptive(minimum: 80))
    ]
    
    var body: some View {
        NavigationView {
            // Displays scrollable grid of all pokemon
            ScrollView {
                LazyVGrid(columns: columns, spacing: 10) {
                    // Iterate over pokemon list filtered by search text
                    ForEach(pokemonViewModel.filteredPokemonList) { pokemon in
                        // Displays Pokemon's image/name that opens its PokemonDetailsView when tapped
                        NavigationLink(destination: PokemonDetailsView(pokemon: pokemon)) {
                            VStack {
                                PokemonImageView(pokemon: pokemon)
                                
                                Text(pokemon.name.capitalized)
                                    .font(.system(size: 10, weight: .regular, design: .monospaced))
                                    .padding(.bottom, 10)
                            }
                        }
                    }
                }
            }
            // Display search bar for user to filter pokemon by name
            .searchable(text: $pokemonViewModel.searchText)
            // Animation for searching so pokemon don't simply disapear
            .animation(.easeInOut(duration: 0.3), value: pokemonViewModel.filteredPokemonList.count)
            // Navigation title: Pokédex
            .navigationTitle("Pokédex")
            .navigationBarTitleDisplayMode(.inline)
            .padding(10)
        }
        .environmentObject(pokemonViewModel)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.portrait)
    }
}
