//
//  PokemonCellView.swift
//  PokedexSwiftUI
//
//  Created by Robert on 5/29/22.
//

import SwiftUI

struct PokemonCellView: View {
    @ObservedObject var viewModel: PokemonViewModel
    @State private var isShowingPokemonView = false
    var body: some View {
        if viewModel.isloading {
            LoadingPokeballView()
        } else {
            
            ZStack(alignment: .bottom) {
                
                HStack {
                    VStack(alignment: .leading) {
                        Text(verbatim: viewModel.pokemonDetail?.name?.capitalizingFirstLetter() ?? "")
                        
                            .font(.title)
                            .foregroundColor(.white)
                            .bold()
                            .shadow(color: .black.opacity(0.1) ,radius: 3)
                        
                        Text(verbatim: viewModel.pokemonNumberFormated)
                            .foregroundColor(.fontColor)
                            .shadow(color: .fontColor.opacity(0.7) ,radius: 1)
                        TypesView(types: viewModel.getPokemonTypes())
                    }
                    Spacer()
                    
                }
                .padding(5)
                .background(viewModel.pokemonColor.opacity(0.5))
                .cornerRadius(10)
                .shadow(color: viewModel.pokemonColor.opacity(0.9), radius: 10)
                .onTapGesture {
                    isShowingPokemonView = true
                }
                .sheet(isPresented: $isShowingPokemonView) {
                    PokemonView(viewModel: viewModel)
                }
                .background(
                    VStack {
                        Spacer().frame(width: 0, height: 70)
                        HStack {
                            Spacer()
                            Image("pokeball")
                                .resizable()
                                .frame(width: 180, height: 180, alignment: .top)
                                .rotationEffect(.degrees(-3))
                                .padding(.trailing, 30)
                        }
                    }
                )
                .clipped()
                HStack {
                    Spacer()
                    AsyncImage(url: viewModel.pokemonImageURL) {
                        $0
                            .resizable()
                            .frame(width: 120, height: 120)
                        
                    } placeholder: {
                        LoadingPokeballView()
                            .frame(width: 120, height: 120)
                    }
                    .shadow(color: .black, radius: 6, x: 10)
                }
            }
        }
    }
}


struct PokemonCellView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonCellView(viewModel: PokemonViewModel(pokemonUrl: "https://pokeapi.co/api/v2/pokemon/177"))
            .previewLayout(.sizeThatFits)
        //            .frame(width: 200, height: 200)
    }
}

struct TypesView: View {
    let types: [PokemonTypeName]
    var body: some View {
        HStack {
            ForEach(types, id: \.self) { typeName in
                
                
                Label {
                    Text(typeName.rawValue)
                        .fontWeight(.light)
                        .font(.system(size: 12))
                        .textCase(.uppercase)
                        
                } icon: {
                    typeName.iconType
                        .resizable()
                        .frame(width: 12, height: 12)
                }
                .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
                .background(typeName.color)
                .cornerRadius(10)
                .shadow(color: .black.opacity(0.4), radius: 10)
                .foregroundColor(.white)
                .labelStyle(.titleAndIcon)
            }
        }
        .padding(.horizontal, 5)
    }
}
