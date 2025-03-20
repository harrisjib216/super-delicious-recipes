//
//  RateFeaturedRecipeBtn.swift
//  Super Delicious Recipes
//
//  Created by development on 3/17/25.
//

import SwiftUI

// button to rate the featured recipe
struct RateFeaturedRecipeBtn: View {
    @EnvironmentObject var storeVM: StoreViewModel

    var body: some View {
        if let featuredRecipe = storeVM.featuredRecipe {
            let ratingIsEither = featuredRecipe.rating == RecipeRating.either
            
            Menu(ratingIsEither ? "Rate" : featuredRecipe.rating.rawValue) {
                ForEach(RecipeRating.allValues, id: \.rawValue) { option in
                    Button(
                        action: {
                            storeVM.rateFeaturedRecipe(rating: option)
                        },
                        label: {
                            Text(option.rawValue)
                                .foregroundStyle(.white)
                        }
                    )
                }
            }
            .foregroundStyle(.white)
            .padding(8.0)
            .background(ratingIsEither ? .black : .orange)
            .cornerRadius(12.0)
        } else {
            EmptyView()
        }
    }
}


#Preview {
    @ObservedObject var storeVM = StoreViewModel()

    RateFeaturedRecipeBtn()
        .environmentObject(storeVM)
}
