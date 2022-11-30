//
//  PokemonManager.swift
//  Pokedex
//
//  Created by Asad Rizvi on 11/18/22.
//

import Foundation

// Decode data into format useable by the ViewModel
class PokemonManager {
    
    // Return a list of all pokemon
    func getAllPokemon() -> [Pokemon] {
        let data: PokemonAPIData = Bundle.main.decode(file: "pokemon.json")
        let pokemonList: [Pokemon] = data.results
        
        return pokemonList
    }
    
    // Return the details for an individual pokemon
    func getPokemonDetails(id: Int, _ completion:@escaping(PokemonDetails) -> ()) {
        Bundle.main.fetch(url: "https://pokeapi.co/api/v2/pokemon/\(id)/", model: PokemonDetails.self) { data in
            completion(data) // Use closure for completion and failure case
            print(data)
            
        } failure: { error in
            print(error)
        }
    }
}
