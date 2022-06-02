//
//  PokemonApiEngine.swift
//  PokedexSwiftUI
//
//  Created by Robert on 5/29/22.
//

import Foundation

class PokemonAPIEngine {
    static let shared = PokemonAPIEngine()
    static var baseURL = "https://pokeapi.co/api/v2/"
    
}

extension PokemonAPIEngine {
    
    func fetchPokemonList(limit: Int, offset: Int) async throws -> [Pokemon]? {
        let path = "pokemon?limit=\(limit)&offset=\(offset)"
        guard let url = URL(string: PokemonAPIEngine.baseURL + path) else { throw PokemonListError.url }
        
        let (data, respose) = try await URLSession.shared.data(from: url)
        
        guard let response = respose as? HTTPURLResponse,
              response.statusCode == 200 else { throw PokemonListError.statusCode }
        
        let pokemon = try JSONDecoder().decode(PokemonList.self, from: data)
        
        return pokemon.pokemon
    }
    
    
    enum PokemonListError: Error {
        case url
        case statusCode
    }
}
