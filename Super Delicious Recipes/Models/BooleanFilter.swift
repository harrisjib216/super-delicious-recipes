//
//  BooleanFilter.swift
//  Super Delicious Recipes
//
//  Created by development on 3/18/25.
//

enum BooleanFilter: String, Codable {
    case either = "Either"
    case yes = "Yes"
    case no = "No"
    
    static let allValues = [
        either,
        yes,
        no
    ]
}
