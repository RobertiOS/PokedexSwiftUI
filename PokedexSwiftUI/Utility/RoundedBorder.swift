//
//  RoundedBorder.swift
//  PokedexSwiftUI
//
//  Created by Robert on 5/30/22.
//

import Foundation
import SwiftUI

struct BorderedViewModifier: ViewModifier {
    let color: Color
    func body(content: Content) -> some View {
        return content
            .padding(
              EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
            .background(color)
            .cornerRadius(20)
            .shadow(color: color.opacity(0.5),
                    radius: 5)
            
    }
}

extension View {
    func bordered(color: Color) -> some View {
        ModifiedContent(content: self, modifier: BorderedViewModifier(color: color))
    }
}
