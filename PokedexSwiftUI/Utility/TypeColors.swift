//
//  TypeColors.swift
//  PokedexSwiftUI
//
//  Created by Robert on 5/30/22.
//

import Foundation
import SwiftUI

enum PokemonTypeName: String, Decodable, Identifiable {
    var id: UUID { UUID()}
    case normal
    case fire
    case grass
    case water
    case electric
    case ice
    case fighting
    case poison
    case ground
    case flying
    case psychic
    case bug
    case rock
    case ghost
    case dragon
    case dark
    case steel
    case fairy
    
    var color: Color {
        switch self {
        case .fire:
            return Color(hex: "EE8130")
        case .grass:
            return Color(hex: "7AC74C")
        case .water:
            return Color(hex: "6390F0")
        case .electric:
            return Color(hex: "F7D02C")
        case .ice:
            return Color(hex: "96D9D6")
        case .fighting:
            return Color(hex: "C22E28")
        case .poison:
            return Color(hex: "A33EA1")
        case .ground:
            return Color(hex: "E2BF65")
        case .flying:
            return Color(hex: "A98FF3")
        case .psychic:
            return Color(hex: "F95587")
        case .bug:
            return Color(hex: "A6B91A")
            
        default:
            return Color(hex: "A8A77A")
        }
    }
    
    var iconType: Image {
        switch self {
        case .fire:
            return Image(systemName: "flame")
        case .grass:
            return Image(systemName: "leaf.fill")
        case .water:
            return Image(systemName: "drop")
        case .electric:
            return Image(systemName: "bolt")
        case .ice:
            return Image(systemName: "snowflake")
        case .fighting:
            return Image(systemName: "exclamationmark.triangle")
        case .poison:
            return Image(systemName: "exclamationmark.triangle")
        case .flying:
            return Image(systemName: "paperplane.fill")
        case .bug:
            return Image(systemName: "ladybug")
            
        default:
            return Image(systemName: "flame")
        }
    }
    
    private enum CodingKeys: CodingKey {
        case normal
        case fire
        case grass
        case water
        case electric
        case ice
        case fighting
        case poison
        case ground
        case flying
        case psychic
        case bug
        case rock
        case ghost
        case dragon
        case dark
        case steel
        case fairy
    }
}


extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }
        
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
