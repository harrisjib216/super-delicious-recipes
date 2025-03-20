//
//  Super_Delicious_RecipesTests.swift
//  Super Delicious RecipesTests
//
//  Created by development on 3/19/25.
//

import Testing
@testable import Super_Delicious_Recipes

struct StoreViewModelTests {
    var storeVM = StoreViewModel()
    
    @Test("init")
    func Init() async throws {
        #expect(storeVM.isFetchingRecipes == true)
        #expect(storeVM.filteredRecipes.isEmpty)
        #expect(storeVM.featuredRecipe == nil)

        #expect(storeVM.recipeVideoFilter == BooleanFilter.either)
        #expect(storeVM.recipeWebsiteFilter == BooleanFilter.either)
        #expect(storeVM.recipeSavedFilter == BooleanFilter.either)
        #expect(storeVM.recipeRatingFilter == RecipeRating.either)
        #expect(storeVM.recipeCuisineFilter == Cuisine.anyCuisine)
        #expect(storeVM.recipeNameFilter == "")
    }
    
    @Test("Can fetch recipes")
    func CanFetchRecipes() async {
        storeVM.allRecipes = MockDataService.getMultipleRecipes()
        storeVM.featuredRecipe = storeVM.allRecipes.randomElement()!
        storeVM.isFetchingRecipes = false
        
        #expect(!storeVM.filteredRecipes.isEmpty)
        #expect(storeVM.featuredRecipe != nil)
        #expect(storeVM.isFetchingRecipes == false)
    }
    
    @Test("Can save a recipe")
    func CanSaveARecipe() {
        if let recipe = storeVM.filteredRecipes.randomElement() {
            let recipe = storeVM.saveRecipe(index: recipe.index)
            #expect(recipe.isSaved == true)
        }
        
        if let _ = storeVM.featuredRecipe {
            storeVM.saveFeaturedRecipe()
            #expect(storeVM.featuredRecipe!.isSaved == true)
        }
    }
    
    @Test("Can rate a recipe")
    func CanRateARecipe() {
        if let recipe = storeVM.filteredRecipes.randomElement() {
            let recipe = storeVM.rateRecipe(index: recipe.index, rating: RecipeRating.delicious)
            #expect(recipe.rating == RecipeRating.delicious)
        }
        
        if let _ = storeVM.featuredRecipe {
            storeVM.rateFeaturedRecipe(rating: RecipeRating.disgusting)
            #expect(storeVM.featuredRecipe!.rating == RecipeRating.disgusting)
        }
    }
    
    @Test("Can filter by name")
    func CanFilterByName() {
        storeVM.allRecipes = MockDataService.getMultipleRecipes()
        storeVM.recipeNameFilter = "abcdefghijk"
        #expect(storeVM.filteredRecipes.isEmpty)
        
        storeVM.recipeNameFilter = ""
        #expect(!storeVM.filteredRecipes.isEmpty)
    }
    
    @Test("Can filter by cusine")
    func CanFilterByCuisine() {
        storeVM.allRecipes = MockDataService.getMultipleRecipes()
        storeVM.recipeCuisineFilter = Cuisine.russian
        #expect(storeVM.filteredRecipes.isEmpty)
        
        storeVM.recipeCuisineFilter = Cuisine.anyCuisine
        #expect(!storeVM.filteredRecipes.isEmpty)
    }
    
    @Test("Can filter saved recipes")
    func CanFilterSavedRecipes() {
        storeVM.allRecipes = MockDataService.getMultipleRecipes()
        storeVM.setSavedFilter(value: BooleanFilter.yes)
        #expect(storeVM.filteredRecipes.isEmpty)
        
        storeVM.setSavedFilter(value: BooleanFilter.either)
        #expect(!storeVM.filteredRecipes.isEmpty)
    }
    
    @Test("Can filter rated recipes")
    func CanFilterRatedRecipes() {
        storeVM.allRecipes = MockDataService.getMultipleRecipes()
        storeVM.setRatingFilter(value: RecipeRating.delicious)
        #expect(storeVM.filteredRecipes.isEmpty)
        
        storeVM.setRatingFilter(value: RecipeRating.either)
        #expect(!storeVM.filteredRecipes.isEmpty)
    }
    
    @Test("Can filter for recipes with a video")
    func CanFilterForRecipesWithAVideo() {
        storeVM.allRecipes = MockDataService.getMultipleRecipes()
        storeVM.setVideoFilter(value: BooleanFilter.no)
        #expect(storeVM.filteredRecipes.isEmpty)
        
        storeVM.setVideoFilter(value: BooleanFilter.yes)
        #expect(!storeVM.filteredRecipes.isEmpty)
    }
    
    @Test("Can filter recipes with a website")
    func CanFilterForRecipesWithAWebsite() {
        storeVM.allRecipes = MockDataService.getMultipleRecipes()
        storeVM.setWebsiteFilter(value: BooleanFilter.no)
        #expect(storeVM.filteredRecipes.isEmpty)
        
        storeVM.setWebsiteFilter(value: BooleanFilter.either)
        #expect(!storeVM.filteredRecipes.isEmpty)
    }
}
