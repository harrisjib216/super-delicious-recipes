//
//  Super_Delicious_RecipesApp.swift
//  Super Delicious Recipes
//
//  Created by development on 3/17/25.
//

import SwiftUI

@main
struct Super_Delicious_RecipesApp: App {
    @ObservedObject var storeVM = StoreViewModel()
    @ObservedObject var recipeDetailsVM = RecipeDetailsViewModel()

    var body: some Scene {
        WindowGroup {
            if storeVM.isFetchingRecipes {
                ProgressView()
            } else {
                HomeScreen()
                    .environmentObject(storeVM)
                    .environmentObject(recipeDetailsVM)
            }
        }
    }
}
