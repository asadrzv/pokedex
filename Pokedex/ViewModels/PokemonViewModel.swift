//
//  PokemonViewModel.swift
//  Pokedex
//
//  Created by Asad Rizvi on 11/18/22.
//

import Foundation
import SwiftUI

class PokemonViewModel: ObservableObject {
    private let pokemonManager = PokemonManager()
    
    @Published var pokemonList = [Pokemon]()
    @Published var pokemonDetails: PokemonDetails?
    @Published var searchText = ""
        
    // Build filtered list of pokemon according to search text
    var filteredPokemonList: [Pokemon] {
        if searchText.isEmpty {
            return self.pokemonList
        }
        return self.pokemonList.filter {
            $0.name.lowercased().contains(searchText.lowercased())
        }
    }
    
    // MARK: Setup/Initializer functions
    
    // Initializer
    init() {
        self.pokemonList = pokemonManager.getAllPokemon()
    }
    
    // MARK: Getter/Setter functions
    
    // Return ID of the specified pokemon
    func getPokemonID(pokemon: Pokemon) -> Int {
        if let index = self.pokemonList.firstIndex(of: pokemon) {
            return index + 1
        }
        return 0
    }
    
    // Get details for specific pokemon
    func getPokemonDetails(pokemon: Pokemon) {
        let id = getPokemonID(pokemon: pokemon)

        // Initailize PokemonDetails field
        self.pokemonDetails = PokemonDetails(id: 0, name: "", weight: 0, height: 0)
        
        // Set PokemonDetails
        pokemonManager.getPokemonDetails(id: id) { data in
            DispatchQueue.main.async {
                self.pokemonDetails = data
            }
        }
    }
    
    // MARK: Helper functions
    
    // Return formatted weight/height
    func formatWeightAndHeight(value: Int) -> String {
        return String(format: "%.2f", Double(value) / 10)
    }
}
