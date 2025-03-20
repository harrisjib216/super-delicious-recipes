//
//  Recipe.swift
//  Super Delicious Recipes
//
//  Created by development on 3/17/25.
//

import Foundation

struct Recipe: Codable {
    enum Keys: String, CodingKey {
        case uuid, name, cuisine, photo_url_large, photo_url_small, source_url, youtube_url
    }
    
    init(uuid: String, name: String, cuisine: Cuisine, photoUrlLarge: String, photoUrlSmall: String, sourceUrl: String, youtubeUrl: String, isCached: Bool, isSaved: Bool, rating: RecipeRating) {
        self.index = 0
        self.uuid = uuid
        self.name = name
        self.cuisine = cuisine
        self.photoUrlLarge = photoUrlLarge
        self.photoUrlSmall = photoUrlSmall
        self.sourceUrl = sourceUrl
        self.youtubeUrl = youtubeUrl
        self.isCached = isCached
        self.isSaved = isSaved
        self.rating = rating
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: Keys.self)
        
        self.index = 0
        self.uuid = try container.decode(String.self, forKey: .uuid)
        self.name = try container.decode(String.self, forKey: .name)
        self.cuisine = try container.decode(Cuisine.self, forKey: .cuisine)
        
        self.photoUrlLarge = try container.decode(String.self, forKey: .photo_url_large)
        self.photoUrlSmall = try container.decode(String.self, forKey: .photo_url_small)
        
        if let youtubeUrl = try? container.decode(String.self, forKey: .youtube_url) {
            self.youtubeUrl = youtubeUrl
        } else {
            self.youtubeUrl = ""
        }
        
        if let sourceUrl = try? container.decode(String.self, forKey: .source_url) {
            self.sourceUrl = sourceUrl
        } else {
            self.sourceUrl = ""
        }
                
        self.isCached = false
        self.isSaved = false
        self.rating = RecipeRating.either
    }
    
    var index: Int
    var uuid: String
    var name: String
    var cuisine: Cuisine

    var photoUrlLarge: String
    var photoUrlSmall: String
    var sourceUrl: String
    var youtubeUrl: String
    
    var isCached: Bool
    var isSaved: Bool
    var rating: RecipeRating
    
    static func filenameFromLink(link: String) -> String {
        var fileName = link.components(separatedBy: "photos/").last
        fileName = fileName?.replacingOccurrences(of: "/", with: "-")
        
        return fileName ?? link
    }
}
