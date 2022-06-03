//
//  LoadingPokeballView.swift
//  PokedexSwiftUI
//
//  Created by Robert on 6/3/22.
//

import SwiftUI

struct LoadingPokeballView: View {
    @State private var appear = false

    var foreverAnimation: Animation {
        Animation.linear.repeatForever()
    }
    
    var body: some View {
        Image("pokeball-red")
            .resizable()
            .frame(width: 40, height: 40)
            .rotationEffect(Angle(degrees: appear ? 360 : 0))
            .animation(Animation.linear(duration: 2).repeatForever(autoreverses: false))
            .onAppear {
                appear = true
            }
    }
}

struct LoadingPokeballView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingPokeballView()
    }
}
