//
//  PokemonAPIDataModel.swift
//  Pokedex
//
//  Created by Asad Rizvi on 11/19/22.
//

import Foundation

// Represents data retreived from PokéAPI
struct PokemonAPIData: Codable {
    // Total number of resources available from API
    let count: Int
    // URL for next page in the list
    let next: String
    // URL for previous page in the list
    // let previous: String?
    // List of named API resources (i.e. pokemon)
    let results: [Pokemon]
}
