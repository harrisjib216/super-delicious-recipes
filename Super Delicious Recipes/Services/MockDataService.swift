//
//  HelpersService.swift
//  Super Delicious Recipes
//
//  Created by development on 3/19/25.
//

struct MockDataService {
    static func getSampleRecipe() -> Recipe {
        getMultipleRecipes().first!
    }
        
    static func getMultipleRecipes() -> [Recipe] {
        return [
            Recipe(
                uuid: "f8b20884-1e54-4e72-a417-dabbc8d91f12",
                name: "Banana Pancakes",
                cuisine: Cuisine.american,
                photoUrlLarge: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b6efe075-6982-4579-b8cf-013d2d1a461b/large.jpg",
                photoUrlSmall: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b6efe075-6982-4579-b8cf-013d2d1a461b/small.jpg",
                sourceUrl: "https://www.bbcgoodfood.com/recipes/banana-pancakes",
                youtubeUrl: "https://www.youtube.com/watch?v=kSKtb2Sv-_U",
                isCached: false,
                isSaved: false,
                rating: RecipeRating.either
            ),
            Recipe(
                uuid: "b5db2c09-411e-4bdf-9a75-a194dcde311b",
                name: "BeaverTails",
                cuisine: Cuisine.canadian,
                photoUrlLarge: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/3b33a385-3e55-4ea5-9d98-13e78f840299/large.jpg",
                photoUrlSmall: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/3b33a385-3e55-4ea5-9d98-13e78f840299/small.jpg",
                sourceUrl: "https://www.tastemade.com/videos/beavertails",
                youtubeUrl: "https://www.youtube.com/watch?v=2G07UOqU2e8",
                isCached: false,
                isSaved: false,
                rating: RecipeRating.either
            ),
            Recipe(
                uuid: "563dbb27-5323-443c-b30c-c221ae598568",
                name: "Budino Di Ricotta",
                cuisine: Cuisine.italian,
                photoUrlLarge: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/2cac06b3-002e-4df7-bb08-e15bbc7e552d/large.jpg",
                photoUrlSmall: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/2cac06b3-002e-4df7-bb08-e15bbc7e552d/small.jpg",
                sourceUrl: "https://thehappyfoodie.co.uk/recipes/ricotta-cake-budino-di-ricotta",
                youtubeUrl: "https://www.youtube.com/watch?v=6dzd6Ra6sb4",
                isCached: false,
                isSaved: false,
                rating: RecipeRating.either
            )
        ]
    }
}
