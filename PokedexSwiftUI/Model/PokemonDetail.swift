//
//  PokemonDetail.swift
//  PokedexSwiftUI
//
//  Created by Robert on 5/29/22.
//

import Foundation

struct PokemonDetail: Decodable {
//    let abilities: [Ability]?
//    let baseExperience: Int?
//    let forms: [Species]?
//    let gameIndices: [GameIndex]?
//    let height: Int?
//    let heldItems: [JSONAny]?
    let id: Int?
//    let isDefault: Bool?
//    let locationAreaEncounters: String?
//    let moves: [Move]?
    let name: String?
    let order: Int?
//    let pastTypes: [JSONAny]?
//    let species: Species?
    let sprites: Sprites?
    let stats: [Stat]?
    let types: [Type]?
    let weight: Int?

//    enum CodingKeys: String, CodingKey {
//        case abilities
//        case baseExperience = "base_experience"
//        case forms
//        case gameIndices = "game_indices"
//        case height
//        case heldItems = "held_items"
//        case id
//        case isDefault = "is_default"
//        case locationAreaEncounters = "location_area_encounters"
//        case moves, name, order
//        case pastTypes = "past_types"
//        case species, sprites, stats, types, weight
//    }
    private enum CodingKeys: CodingKey {
        case id, name, order, sprites, weight, types, stats
    }
    
}

struct Type: Decodable {
    let slot: Int?
    let type: PokemonType?
}

struct PokemonType: Decodable {
    let name: PokemonTypeName?
    let url: String?
}

struct Species: Decodable {
    let name: String?
    let url: String?
}

struct Sprites: Decodable {
    let backDefault: String?
    let backFemale: String?
    let backShiny: String?
    let backShinyFemale: String?
    let frontDefault: String?
    let frontFemale: String?
    let frontShiny: String?
    let frontShinyFemale: String?
    let other: Other?
    
    enum CodingKeys: String, CodingKey {
        case backDefault = "back_default"
        case backFemale = "back_female"
        case backShiny = "back_shiny"
        case backShinyFemale = "back_shiny_female"
        case frontDefault = "front_default"
        case frontFemale = "front_female"
        case frontShiny = "front_shiny"
        case frontShinyFemale = "front_shiny_female"
        case other
    }
}

struct Other: Codable {
    let dreamWorld: DreamWorld?
    let home: Home?
    let officialArtwork: OfficialArtwork?

    enum CodingKeys: String, CodingKey {
        case dreamWorld = "dream_world"
        case home
        case officialArtwork = "official-artwork"
    }
}

struct OfficialArtwork: Codable {
    let frontDefault: String?

    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
    }
}

struct DreamWorld: Codable {
    let frontDefault: String?
    let frontFemale: String?

    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
        case frontFemale = "front_female"
    }
}

struct Home: Codable {
    let frontDefault: String?
    let frontFemale: String?
    let frontShiny: String?
    let frontShinyFemale: String?

    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
        case frontFemale = "front_female"
        case frontShiny = "front_shiny"
        case frontShinyFemale = "front_shiny_female"
    }
}

struct Stat: Decodable, Identifiable {
    let id = UUID()
    let baseStat, effort: Int?
    let stat: StatInfo?

    enum CodingKeys: String, CodingKey {
        case baseStat = "base_stat"
        case effort, stat
    }
}

struct StatInfo: Decodable {
    let name: StatName?
    let url: String?
}

enum StatName: String, Codable {
    case attack
    case hp
    case defense
    case specialAttack = "special-attack"
    case specialDefense = "special-defense"
    case speed
    
    var displayValue: String {
        switch self {
        case .attack:
            return "ATK"
        case .hp:
            return "HP"
        case .defense:
            return "DEF"
        case .specialAttack:
            return "SATK"
        case .specialDefense:
            return "SDEF"
        case .speed:
            return "SPD"
        }
    }
    
}


