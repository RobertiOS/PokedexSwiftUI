//
//  Pokemon.swift
//  PokedexSwiftUI
//
//  Created by Robert on 5/29/22.
//

// MARK: - Pokemon
struct Pokemon: Decodable {
    let name: String?
    let url: String?
}

extension Pokemon: Hashable {
    
}
