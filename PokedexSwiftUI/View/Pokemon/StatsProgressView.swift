//
//  StatsView.swift
//  PokedexSwiftUI
//
//  Created by Robert on 5/30/22.
//

import SwiftUI

struct StatsProgressView: View {
    let color: Color
    let value: Int
    let statName: StatName?
    var body: some View {
        VStack(alignment: .leading ){
            HStack {
                Text(statName?.displayValue ?? "")
                    .foregroundColor(color)
                    .fontWeight(.bold)
                    .font(.footnote)
//                    .padding(.horizontal, 5)
                    .frame(width: 38, alignment: .leading)
                Text("\(Int(value))")
                    .frame(width: 23, alignment: .leading)
                    .font(.footnote)
                ProgressView(value: Double(value), total: 255)
                    .scaleEffect(x: 1, y: 2)
                    .progressViewStyle(LinearProgressViewStyle(tint: color))
                    .shadow(color: color.opacity(0.7), radius: 3)
            }
        }
    }
}

struct StatsProgressView_Previews: PreviewProvider {
    static var previews: some View {
        StatsProgressView(color: .red, value: 1, statName: .attack)
            .previewLayout(.sizeThatFits)
    }
}
