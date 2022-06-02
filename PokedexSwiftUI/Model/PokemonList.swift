//
//  PokemonList.swift
//  PokedexSwiftUI
//
//  Created by Robert on 5/29/22.
//

import Foundation

// MARK: - PokemonList
struct PokemonList: Decodable {
    let count: Int?
    let next: String?
    let previous: String?
    let pokemon: [Pokemon]?
    
    private enum CodingKeys: String, CodingKey {
        case count, next, previous
        case pokemon = "results"
    }
}
