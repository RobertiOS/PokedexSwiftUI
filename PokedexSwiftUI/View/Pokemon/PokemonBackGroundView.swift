//
//  PokemonBackGroundView.swift
//  PokedexSwiftUI
//
//  Created by Robert on 6/2/22.
//

import SwiftUI

struct PokemonBackGroundView: View {
    let color: Color
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                Rectangle()
                    .fill(LinearGradient(gradient: .init(colors: [color.opacity(1),
                                                                  color.opacity(0.5),
                                                                  color.opacity(0.4)]),
                                         startPoint: .leading, endPoint: .trailing))
                
            }
            VStack {
                Spacer()
                Rectangle()
                    .fill(Color.white)
                    .frame(height: 600)
                    .cornerRadius(50, corners: [.topLeft, .topRight])
            }
        }
    }
}
struct PokemonBackGroundView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonBackGroundView(color: .red)
    }
}
