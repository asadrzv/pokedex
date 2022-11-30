//
//  Utilities.swift
//  Pokedex
//
//  Created by Asad Rizvi on 11/18/22.
//

import Foundation

extension Bundle {
    
    // Decode data from a static JSON file
    func decode<T: Decodable>(file: String) -> T {
        // Throww an error if file not found
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Error: Could not find \(file) in bundle!")
        }
        // Throws an error if file could not be loaded
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Error: Could not load \(file) from bundle!")
        }
        
        let decoder = JSONDecoder()
        // Throws an error if file could not be decoded
        guard let jsonData = try? decoder.decode(T.self, from: data) else {
            fatalError("Error: Could not decode \(file) from bundle!")
        }
        
        return jsonData
    }
    
    // Fetch and decode live data from API
    func fetch<T: Decodable>(url: String, model: T.Type, completion:@escaping(T) -> (), failure:@escaping(Error) -> ()) {
        guard let url = URL(string: url) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            // Get data from live server
            guard let data = data else {
                // Return any errors that occur
                if let error = error {
                    failure(error)
                }
                return
            }
            // Decode data from live server
            do {
                let serverData = try JSONDecoder().decode(T.self, from: data)
                // Return data from server
                completion(serverData)
            } catch {
                // Return any errors that occur
                failure(error)
            }
        }.resume()
    }
}
