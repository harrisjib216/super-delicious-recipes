//
//  BooleanFilter.swift
//  Super Delicious Recipes
//
//  Created by development on 3/18/25.
//

enum RecipeDetailComponent: String, Codable {
    case overview = "Overview"
    case youtube = "Youtube"
    case website = "Website"
    
    static let allValues = [
        overview,
        youtube,
        website
    ]
}
