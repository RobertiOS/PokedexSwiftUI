//
//  StatsView.swift
//  PokedexSwiftUI
//
//  Created by Robert on 5/30/22.
//

import SwiftUI

struct StatsView: View {
    @ObservedObject var viewModel: PokemonViewModel
    var body: some View {
        if let stats = viewModel.pokemonDetail?.stats {
            ForEach(stats) { stat in
                HStack {
                    StatsProgressView(color: viewModel.pokemonColor, value: stat.baseStat ?? 0, statName: stat.stat?.name)
                }
            }
        }
    }
}

struct StatsView_Previews: PreviewProvider {
    static var previews: some View {
        let pokemonViewModel = PokemonViewModel(pokemonUrl: PokemonViewModel.mockURL)
        StatsView(viewModel: pokemonViewModel)
            .previewLayout(.sizeThatFits)
            .frame(width: 200, height: 200, alignment: .center)
    }
}
