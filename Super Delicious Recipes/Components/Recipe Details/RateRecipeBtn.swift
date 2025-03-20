//
//  RateRecipeBtn.swift
//  Super Delicious Recipes
//
//  Created by development on 3/19/25.
//

import SwiftUI

struct RateRecipeBtn: View {
    @EnvironmentObject var storeVM: StoreViewModel
    @EnvironmentObject var recipeDetailsVM: RecipeDetailsViewModel
    
    let recipe: Recipe
    
    var body: some View {
        let ratingIsEither = recipe.rating == RecipeRating.either
            
        Menu(ratingIsEither ? "Rate" : recipe.rating.rawValue) {
            ForEach(RecipeRating.allValues, id: \.rawValue) { rating in
                Button(
                    action: {
                        withAnimation(.linear(duration: 0.25)) {
                            let _recipe = storeVM.rateRecipe(index: recipe.index, rating: rating)
                            
                            // update the selected recipe if we are viewing it
                            if recipeDetailsVM.isDetailsScreenReady {
                                recipeDetailsVM.setSelectedRecipe(recipe: _recipe)
                            }
                        }
                    },
                    label: {
                        Text(rating.rawValue)
                            .foregroundStyle(.white)
                    }
                )
            }
        }
        .foregroundStyle(.white)
        .padding(8.0)
        .background(ratingIsEither ? .black : .orange)
        .cornerRadius(12.0)
    }
}
