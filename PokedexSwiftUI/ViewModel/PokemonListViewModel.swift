//
//  PokemonListViewModel.swift
//  PokedexSwiftUI
//
//  Created by Robert on 5/29/22.
//

import Foundation

extension PokedexListView {
    @MainActor class ViewModel: ObservableObject {
        @Published var pokemon: [Pokemon]?
        @Published var isLoading = true
        
        init() {
            getPokemons()
        }
        
        func getPokemons() {
            Task {
                do {
                    isLoading = true
                    pokemon = try await PokemonAPIEngine.shared.fetchPokemonList(limit: 20, offset: 0)
                    isLoading = false
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
}
