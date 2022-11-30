//
//  PokemonDetailsView.swift
//  Pokedex
//
//  Created by Asad Rizvi on 11/19/22.
//

import SwiftUI

struct PokemonDetailsView: View {
    // Gets data from pokemon view model by referring to it
    @EnvironmentObject var pokemonViewModel: PokemonViewModel
    // Selected pokemon
    let pokemon: Pokemon
    
    var body: some View {
        VStack {
            // Displays pokemon image
            PokemonImageView(pokemon: pokemon)
            
            // Displays pokemon details (name, id, weight, height)
            VStack(spacing: 10) {
                // Name
                Text(pokemon.name.capitalized)
                // Pokedex ID No.
                Text("**#** \(String(format: "%03d", pokemonViewModel.pokemonDetails?.id ?? 0))")
                // Weight
                Text("**Weight**: \(pokemonViewModel.formatWeightAndHeight(value: pokemonViewModel.pokemonDetails?.weight ?? 0)) kg")
                // Height
                Text("**Height**: \(pokemonViewModel.formatWeightAndHeight(value: pokemonViewModel.pokemonDetails?.height ?? 0)) m")
            }
        }
        .onAppear {
            // Get details for selected pokemon
            pokemonViewModel.getPokemonDetails(pokemon: pokemon)
        }
    }
}

struct PokemonDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailsView(pokemon: SAMPLE_POKEMON)
            .environmentObject(PokemonViewModel())
    }
}
