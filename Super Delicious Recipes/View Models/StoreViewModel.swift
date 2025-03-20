//
//  StoreViewModel.swift
//  Super Delicious Recipes
//
//  Created by development on 3/18/25.
//

import SwiftUI
import Foundation
import CoreData

// this view model manages all the recipes
final class StoreViewModel: ObservableObject {
    @Published var isFetchingRecipes = true
    @Published var allRecipes = [Recipe]()
    @Published var featuredRecipe: Recipe?

    /// MARK: filters the user can apply
    /// filters are also sorted by the order in which they will run based on est time to be proven
    @Published var recipeVideoFilter = BooleanFilter.either
    @Published var recipeWebsiteFilter = BooleanFilter.either
    @Published var recipeSavedFilter = BooleanFilter.either
    @Published var recipeRatingFilter = RecipeRating.either
    @Published var recipeCuisineFilter = Cuisine.anyCuisine
    @Published var recipeNameFilter = ""
    
    
    /// MARK: setup
    init() {
        Task {
            await loadRecipes()
        }
    }
    
    func loadRecipes() async {
        await FetchRecipesService.loadData { recipes in
            DispatchQueue.main.async {
                if !recipes.isEmpty {
                    self.allRecipes = recipes
                    
                    if let randomRecipe = recipes.randomElement() {
                        self.featuredRecipe = randomRecipe
                    }
                }
                
                self.isFetchingRecipes = false
            }
        }
    }

    
    /// MARK: functions modify recipes
    func saveRecipe(index: Int) -> Recipe {
        self.objectWillChange.send()
        self.allRecipes[index].isSaved.toggle()
        
        return self.allRecipes[index]
    }
    
    func rateRecipe(index: Int, rating: RecipeRating) -> Recipe {
        self.objectWillChange.send()
        self.allRecipes[index].rating = rating
        
        return self.allRecipes[index]
    }
    
    func saveFeaturedRecipe() {
        self.objectWillChange.send()
        // todo: cache
        featuredRecipe?.isSaved.toggle()
    }
    
    func rateFeaturedRecipe(rating: RecipeRating) {
        self.objectWillChange.send()
        // todo: cache
        featuredRecipe?.rating = rating
    }
    
    
    /// MARK: functions to filter recipes
    var filteredRecipes: [Recipe] {
        var filters: Array< (Recipe) -> Bool > = []
        
        // determine which filters to add or run
        if recipeVideoFilter != BooleanFilter.either {
            filters.append({ recipe in
                if self.recipeVideoFilter == BooleanFilter.yes {
                    return !recipe.youtubeUrl.isEmpty
                }
                
                return recipe.youtubeUrl.isEmpty
            })
        }
        
        if recipeWebsiteFilter != BooleanFilter.either {
            filters.append({ recipe in
                if self.recipeWebsiteFilter == BooleanFilter.yes {
                    return !recipe.sourceUrl.isEmpty
                }
                
                return recipe.sourceUrl.isEmpty
            })
        }
        
        if recipeSavedFilter != BooleanFilter.either {
            filters.append({ recipe in
                if self.recipeSavedFilter == BooleanFilter.yes {
                    return recipe.isSaved
                }
                
                return !recipe.isSaved
            })
        }
        
        if recipeRatingFilter != RecipeRating.either {
            filters.append({ recipe in
                recipe.rating == self.recipeRatingFilter
            })
        }
        
        if recipeCuisineFilter != Cuisine.anyCuisine {
            filters.append({ recipe in
                recipe.cuisine == self.recipeCuisineFilter
            })
        }
        
        if !recipeNameFilter.isEmpty {
            let cachedName = self.recipeNameFilter.localizedLowercase
            filters.append({ recipe in
                recipe.name.localizedCaseInsensitiveContains(cachedName)
            })
        }

        // return the current recipes if no filters were applied
        if filters.isEmpty {
            return allRecipes
        }
        
        // loop through each selected filter
        return allRecipes.filter { recipe in
            
            // recipe will optimistically pass
            var passed = true
            filters.forEach { filter in
                if !filter(recipe) {
                    // exit early because the recipe failed at least one filter
                    passed = false
                    return
                }
            }
            
            // return true, this recipe passes all filters
            return passed
        }
    }
    
    func resetFilters() {
        self.objectWillChange.send()
        recipeVideoFilter = BooleanFilter.either
        recipeWebsiteFilter = BooleanFilter.either
        recipeSavedFilter = BooleanFilter.either
        recipeRatingFilter = RecipeRating.either
        recipeCuisineFilter = Cuisine.anyCuisine
        recipeNameFilter = ""
    }
    
    func setVideoFilter(value: BooleanFilter) {
        self.objectWillChange.send()
        self.recipeVideoFilter = value
    }
    
    func setWebsiteFilter(value: BooleanFilter) {
        self.objectWillChange.send()
        self.recipeWebsiteFilter = value
    }
    
    func setSavedFilter(value: BooleanFilter) {
        self.objectWillChange.send()
        self.recipeSavedFilter = value
    }
    
    func setRatingFilter(value: RecipeRating) {
        self.objectWillChange.send()
        self.recipeRatingFilter = value
    }
    
    func setCuisineFilter(value: Cuisine) {
        self.objectWillChange.send()
        self.recipeCuisineFilter = value
    }
}
