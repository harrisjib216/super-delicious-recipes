//
//  Super_Delicious_RecipesTests.swift
//  Super Delicious RecipesTests
//
//  Created by development on 3/19/25.
//

import Testing
@testable import Super_Delicious_Recipes

struct RecipeDetailsViewModelTests {
    var recipeDetailsVM = RecipeDetailsViewModel()
    
    @Test("Init")
    func Init() {
        CheckStateForInitOrReset()
    }
    
    @Test("Can select a recipe")
    func CanSetSelectedRecipe() {
        let recipe = MockDataService.getSampleRecipe()
        
        recipeDetailsVM.setSelectedRecipe(recipe: recipe)
        
        #expect(recipeDetailsVM.selectedRecipe?.uuid == recipe.uuid)
    }
    
    @Test("Can select a component")
    func CanSetSelectedComponent() {
        recipeDetailsVM.setSelectedComponent(component: RecipeDetailComponent.youtube)
        #expect(recipeDetailsVM.selectedComponent == RecipeDetailComponent.youtube)
        
        recipeDetailsVM.setSelectedComponent(component: RecipeDetailComponent.website)
        #expect(recipeDetailsVM.selectedComponent == RecipeDetailComponent.website)
        
        recipeDetailsVM.setSelectedComponent(component: RecipeDetailComponent.overview)
        #expect(recipeDetailsVM.selectedComponent == RecipeDetailComponent.overview)
    }
    
    @Test("Can reset state")
    func CanResetState() {
        recipeDetailsVM.resetState()
        CheckStateForInitOrReset()
    }
    
    func CheckStateForInitOrReset() {
        #expect(recipeDetailsVM.isDetailsScreenReady == false)
        #expect(recipeDetailsVM.selectedRecipe == nil)
        #expect(recipeDetailsVM.components.count == 1)
        #expect(recipeDetailsVM.components[0] == RecipeDetailComponent.overview)
        #expect(recipeDetailsVM.selectedComponent == RecipeDetailComponent.overview)
    }
}
