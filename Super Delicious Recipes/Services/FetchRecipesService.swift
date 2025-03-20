//
//  FetchRecipesService.swift
//  Super Delicious Recipes
//
//  Created by development on 3/19/25.
//

import Foundation
import CoreData

struct Response: Codable {
    let recipes: [Recipe]
}

class FetchRecipesService {
    static let api = "https://d3jbb8n5wk0qxi.cloudfront.net/recipes.json"
    static let emptyApi = "https://d3jbb8n5wk0qxi.cloudfront.net/recipes-empty.json"
    static let badApi = "https://d3jbb8n5wk0qxi.cloudfront.net/recipes-malformed.json"
    
    static func loadData(callback: ([Recipe]) -> ()) async {
        // todo: check if we've cached the data
        let hasCachedRecipes = false
        
        let recipes = if hasCachedRecipes {
            await fetchFromCoreData()
        } else {
            await fetchFromServer()
        }

        callback(recipes)
    }
    
    static func fetchFromServer(url: String = FetchRecipesService.api) async -> [Recipe] {
        guard let url = URL(string: url) else {
            return []
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            if let res = try? JSONDecoder().decode(Response.self, from: data) {
                var index = 0
                
                return res.recipes.map { recipe in
                    var clone = recipe
                    clone.index = index
                    index += 1

                    return clone
                }
            }
            
            return []
        } catch {
            return []
        }
    }
    
    // todo: call storage service
    static func fetchFromCoreData() async -> [Recipe] {
        return []
    }
}
