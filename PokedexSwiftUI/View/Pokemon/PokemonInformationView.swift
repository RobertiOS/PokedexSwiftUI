//
//  PokemonInformationView.swift
//  PokedexSwiftUI
//
//  Created by Robert on 6/2/22.
//

import SwiftUI

struct PokemonInformationView: View {
    @ObservedObject var viewModel: PokemonViewModel
    var body: some View {
        HStack {
            VStack {
                Spacer()
                AsyncImage(url: viewModel.pokemonImageURL) {
                    $0
                        .resizable()
                        .frame(width: 170, height: 170)
                } placeholder: {
                    LoadingPokeballView()
                        .frame(width: 170, height: 170)
                }
                
                PokemonTypeListView(viewModel: viewModel)
                
                Text(viewModel.pokemonDetail?.name?.capitalizingFirstLetter() ?? "")
                    .font(.largeTitle)
                    .foregroundColor(.fontColor)
                
                HStack {
                    Button {
                        //open stats view
                    } label: {
                        Text("Stats")
                            .fontWeight(.light)
                            .shadow(color: .white.opacity(0.9), radius: 4)
                    }
                    .bordered(color: viewModel.pokemonColor)
                    
                    Button {
                        // open evolutions view
                    } label: {
                        Text("Evolutions")
                            .fontWeight(.light)
                            .shadow(color: .white.opacity(0.9), radius: 4)
                    }
                    .bordered(color: viewModel.pokemonColor)
                    Button {
                        // open moves view
                    } label: {
                        Text("Moves")
                            .fontWeight(.light)
                            .shadow(color: .white.opacity(0.9), radius: 4)
                    }
                    .bordered(color: viewModel.pokemonColor)
                    
                }
                .foregroundColor(.white)
                
                Text("Squirtle’s shell is not merely used for protection. The shell s rounded shape and the grooves on its surface help minimize resistance in water, enabling this pokemon to swim at high speed.")
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.fontColor)
                    .padding(EdgeInsets(top: 10, leading: 40, bottom: 10, trailing: 40))
                    .frame(height: 150)
                
                VStack {
                    StatsView(viewModel: viewModel)
                    
                }
                
                .padding(EdgeInsets(top: 10, leading: 40, bottom: 70, trailing: 40))
            }
        }
    }
    
}

struct PokemonInformationView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonInformationView(viewModel: PokemonViewModel(pokemonUrl: "https://pokeapi.co/api/v2/pokemon/6"))
    }
}
