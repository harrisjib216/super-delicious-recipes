//
//  RecipeDetailsViewModel.swift
//  Super Delicious Recipes
//
//  Created by development on 3/18/25.
//

import SwiftUI

// a view model for managing state & interactivity
// in the RecipeDetailsScreen
final class RecipeDetailsViewModel: ObservableObject {
    @Published var isDetailsScreenReady = false
    @Published var selectedRecipe: Recipe?
    @Published var components: [RecipeDetailComponent]
    @Published var selectedComponent = RecipeDetailComponent.overview

    init() {
        components = [RecipeDetailComponent.overview]
        selectedComponent = RecipeDetailComponent.overview
    }
    
    func resetState() {
        self.objectWillChange.send()
        selectedRecipe = nil
        components = [RecipeDetailComponent.overview]
        selectedComponent = RecipeDetailComponent.overview
        isDetailsScreenReady = false
    }

    func setSelectedRecipe(recipe: Recipe) {
        self.objectWillChange.send()
        selectedRecipe = recipe
        components = componentsForRecipe()
        selectedComponent = RecipeDetailComponent.overview
        isDetailsScreenReady = true
    }
    
    
    /// MARK: helper functions for selected component within the recipe details screen
    func setSelectedComponent(component: RecipeDetailComponent) {
        self.objectWillChange.send()
        withAnimation {
            selectedComponent = component
        }
    }
    
    private func componentsForRecipe() -> [RecipeDetailComponent] {
        var components = [RecipeDetailComponent.overview]
        
        if !selectedRecipe!.youtubeUrl.isEmpty {
            components.append(RecipeDetailComponent.youtube)
        }
        
        if !selectedRecipe!.sourceUrl.isEmpty {
            components.append(RecipeDetailComponent.website)
        }
        
        return components
    }
}
