//
//  PokemonDetailsModel.swift
//  Pokedex
//
//  Created by Asad Rizvi on 11/19/22.
//

import Foundation

// Represents details of individual Pokemon
struct PokemonDetails: Codable {
    // Pokedex ID No.
    let id: Int
    // Name
    let name: String
    // Weight
    let weight: Int
    // Height
    let height: Int
}
