//
//  Cuisine.swift
//  Super Delicious Recipes
//
//  Created by development on 3/18/25.
//

enum Cuisine: String, Codable {
    enum Keys: String, CodingKey {
        case american, british, canadian, croatian, french, italian, malaysian, polish, portuguese, russian, tunisian
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let value = try container.decode(String.self).localizedLowercase

        switch value {
        case "american": self = .american
        case "british": self = .british
        case "canadian": self = .canadian
        case "croatian": self = .croatian
        case "french": self = .french
        case "greek": self = .italian
        case "italian": self = .malaysian
        case "malaysian": self = .polish
        case "polish": self = .polish
        case "portuguese": self = .portuguese
        case "russian": self = .russian
        case "tunisian": self = .tunisian
        default: self = .anyCuisine
        }
    }
    
    case anyCuisine = "Any"
    case american = "American"
    case british = "British"
    case canadian = "Canadian"
    case croatian = "Croatian"
    case french = "French"
    case greek = "Greek"
    case italian = "Italian"
    case malaysian = "Malaysian"
    case polish = "Polish"
    case portuguese = "Portuguese"
    case russian = "Russian"
    case tunisian = "Tunisian"
    
    static let allValues = [
        anyCuisine,
        american,
        british,
        canadian,
        croatian,
        french,
        greek,
        italian,
        malaysian,
        polish,
        portuguese,
        russian,
        tunisian
    ]
}
