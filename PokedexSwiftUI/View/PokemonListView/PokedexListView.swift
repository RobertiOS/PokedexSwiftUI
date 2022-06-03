//
//  ContentView.swift
//  PokedexSwiftUI
//
//  Created by Robert on 2/28/22.
//

import SwiftUI

struct PokedexListView: View {
    @ObservedObject var pokemonViewModel = ViewModel()
    
    @ViewBuilder
    var body: some View {
        NavigationView {
            VStack {
                if pokemonViewModel.isLoading {
                    LoadingPokeballView()
                } else {
                    List(pokemonViewModel.pokemon ?? [], id: \.self) { pokemon in
                        if let pokemonUrl = pokemon.url {
                            PokemonCellView(viewModel: PokemonViewModel(pokemonUrl: pokemonUrl))
                        }
                    }
                    .listStyle(.plain)
                }
            }
            .navigationBarTitle(Text("Pokedex"))
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PokedexListView()
    }
}
