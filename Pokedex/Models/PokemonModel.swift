//
//  PokemonModel.swift
//  Pokedex
//
//  Created by Asad Rizvi on 11/18/22.
//

import Foundation

// Represents an individual Pokémon
struct Pokemon: Codable, Identifiable, Equatable {
    // Unique ID for pokemon data
    let id = UUID()
    // Pokemon name
    let name: String
    // URL for pokemon data
    let url: String
}

// Sample pokemon for setup
let SAMPLE_POKEMON = Pokemon(name: "pikachu", url: "https://pokeapi.co/api/v2/pokemon/25/")
