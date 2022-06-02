//
//  PokemonCellViewModel.swift
//  PokedexSwiftUI
//
//  Created by Robert on 5/29/22.
//

import Foundation
import SwiftUI

@MainActor class PokemonViewModel: ObservableObject {
    static let mockURL = "https://pokeapi.co/api/v2/pokemon/6"
    @Published var pokemonDetail: PokemonDetail?
    @Published var pokemonImage: Image?
    @Published var isloading = false
    init(pokemonUrl: String) {
        Task {
            do {
                isloading = true
                pokemonDetail = try await PokemonAPIEngine.shared.fetchPokemonDetails(for: pokemonUrl)
                isloading = false
            } catch  {
                
            }
        }
        
    }
    
    func getPokemonTypes() -> [PokemonTypeName] {
        pokemonDetail?.types?.compactMap { $0.type?.name } ?? []
    }
    
    var pokemonColor: Color {
        (pokemonDetail?.types?.first?.type?.name?.color ?? .gray)
    }
    
    var pokemonImageURL: URL? {
        URL(string: pokemonDetail?.sprites?.other?.officialArtwork?.frontDefault ?? "")
    }
    
    var pokemonNumberFormated: String {
        "#" + String(format: "%03d", pokemonDetail?.id ?? 0)
    }
}
