//
//  PokemonImageView.swift
//  Pokedex
//
//  Created by Asad Rizvi on 11/19/22.
//

import SwiftUI

struct PokemonImageView: View {
    @EnvironmentObject var pokemonViewModel: PokemonViewModel
    // Dimension of pokemon image view
    private let dimensions: Double = 80
    // Selected pokemon
    let pokemon: Pokemon
        
    var body: some View {
        VStack {
            // Pokemon image sprite loaded by getting ID from PokemonViewModel
            AsyncImage(url: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(pokemonViewModel.getPokemonID(pokemon: pokemon)).png")) { phase in
                // Transaction phase parameter to handle errors loading image
                switch phase {
                // Placeholder loading image
                case .empty:
                    ProgressView()
                        .frame(width: dimensions, height: dimensions)
                        .background(.thinMaterial)
                // Valid Pokemon image
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: dimensions, height: dimensions)
                        .background(.thinMaterial)
                // Error fetching image from url
                case .failure:
                    Text("Error: Failed to fetch image")
                // Error unknown
                @unknown default:
                    Text("Error: Unknown")
                }
            }
        }
    }
}

struct PokemonImageView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonImageView(pokemon: SAMPLE_POKEMON)
            .environmentObject(PokemonViewModel())
    }
}
