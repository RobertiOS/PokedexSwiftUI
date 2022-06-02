//
//  PokemonView.swift
//  PokedexSwiftUI
//
//  Created by Robert on 5/30/22.
//

import SwiftUI

struct PokemonView: View {
    @ObservedObject var viewModel: PokemonViewModel
    let color = PokemonTypeName.water.color
    var body: some View {
        ZStack {
            PokemonBackGroundView(color: viewModel.pokemonColor)
            PokemonInformationView(viewModel: viewModel)
        }
    }
}

struct PokemonView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonView(viewModel: PokemonViewModel(pokemonUrl: "https://pokeapi.co/api/v2/pokemon/6"))
            .previewLayout(.sizeThatFits)
    }
}
