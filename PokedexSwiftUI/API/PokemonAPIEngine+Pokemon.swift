//
//  PokemonAPIEngine+Pokemon.swift
//  PokedexSwiftUI
//
//  Created by Robert on 5/29/22.
//

import Foundation

extension PokemonAPIEngine {
    func fetchPokemonDetails(for url: String) async throws -> PokemonDetail? {
        guard let url = URL(string: url) else { throw PokemonListError.url }
        
        let (data, respose) = try await URLSession.shared.data(from: url)
        
        guard let response = respose as? HTTPURLResponse,
              response.statusCode == 200 else { throw PokemonListError.statusCode }
        
        let pokemon = try JSONDecoder().decode(PokemonDetail.self, from: data)
        
        return pokemon
    }
}
