//
//  RecipeView.swift
//  Super Delicious Recipes
//
//  Created by development on 3/17/25.
//

import SwiftUI

// card component to display a recipe within a list
struct RecipeView: View {
    @EnvironmentObject var storeVM: StoreViewModel
    @EnvironmentObject var recipeDetailsVM: RecipeDetailsViewModel

    let recipe: Recipe
    let size: CGFloat
    
    var body: some View {
        VStack(alignment: .leading) {
            // thumbnail
            ZStack {
                RecipeImage(link: recipe.photoUrlSmall)
                
                SaveRecipeBtn(recipe: recipe)
                    .offset(x: size * 0.5 - 24.0, y: size * -0.5 + 24.0)
            }
            
            // name
            GeometryReader { reader in
                Text(recipe.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundStyle(.black)
                    .frame(width: reader.size.width, alignment: .leading)
                    .truncationMode(.tail)
            }
            .padding(.bottom, 12.0)
            
            // cusine
            Text(recipe.cuisine.rawValue)
                .font(.title3)
                .foregroundStyle(.black)
        }
        .padding(.bottom, 8.0)
        .onTapGesture {
            // select recipe & navigate
            recipeDetailsVM.setSelectedRecipe(recipe: recipe)
        }
    }
}


#Preview {
    @ObservedObject var storeVM = StoreViewModel()
    @ObservedObject var recipeDetailsVM = RecipeDetailsViewModel()

    RecipeView(recipe: MockDataService.getSampleRecipe(), size: 140)
        .environmentObject(storeVM)
        .environmentObject(recipeDetailsVM)
}
