//
//  RecipeRating.swift
//  Super Delicious Recipes
//
//  Created by development on 3/17/25.
//

enum RecipeRating: String, Codable {
    case either = "🤷🏽‍♂️ Skip"
    case delicious = "😋 Delicious"
    case disgusting = "🤮 Disgusting"
    
    static let allValues = [
        either,
        delicious,
        disgusting
    ]
}
