//
//  PokemonTypeListView.swift
//  PokedexSwiftUI
//
//  Created by Robert on 6/2/22.
//

import SwiftUI

struct PokemonTypeListView: View {
    @ObservedObject var viewModel: PokemonViewModel
    var body: some View {
        HStack {
            ForEach(viewModel.getPokemonTypes()) { type in
                Label {
                    Text(type.rawValue)
                        .foregroundColor(.white)
                        .bold()
                        .textCase(.uppercase)
                        .font(.caption)
                        .shadow(color: .white.opacity(0.9), radius: 4)
                    
                } icon: {
                    type.iconType
                        .foregroundColor(.white)
                        .shadow(color: .white.opacity(0.9), radius: 4)
                }
                .bordered(color: type.color)
            }
            
        }
    }
}

struct PokemonTypeListView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonTypeListView(viewModel: PokemonViewModel(pokemonUrl: "https://pokeapi.co/api/v2/pokemon/2"))
    }
}
