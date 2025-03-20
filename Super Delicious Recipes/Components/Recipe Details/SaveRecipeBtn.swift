//
//  SaveRecipeBtn.swift
//  Super Delicious Recipes
//
//  Created by development on 3/19/25.
//

import SwiftUI

struct SaveRecipeBtn: View {
    @EnvironmentObject var storeVM: StoreViewModel
    @EnvironmentObject var recipeDetailsVM: RecipeDetailsViewModel
    
    let recipe: Recipe
    
    var body: some View {
        let isSaved = recipe.isSaved

        Image(systemName: isSaved ? "heart.fill" : "heart")
            .padding(10.0)
            .foregroundColor(isSaved ? .red : .white)
            .background(isSaved ? .orange : .black)
            .cornerRadius(10)
            .onTapGesture(perform: onTapped)
    }
    
    func onTapped() {
        withAnimation(.linear(duration: 0.25)) {
            let _recipe = storeVM.saveRecipe(index: recipe.index)
            
            // update the selected recipe if we are viewing it
            if recipeDetailsVM.isDetailsScreenReady {
                recipeDetailsVM.setSelectedRecipe(recipe: _recipe)
            }
        }
    }
}
