//
//  RecipeDetailsScreen.swift
//  Super Delicious Recipes
//
//  Created by development on 3/18/25.
//

import SwiftUI
import CoreData

struct RecipeDetails: View {
    @EnvironmentObject var recipeDetailsVM: RecipeDetailsViewModel
    @Environment(\.dismiss) private var dismiss
    
    let screenWidth = UIScreen.main.bounds.width
    
    var body: some View {
        if let recipe = recipeDetailsVM.selectedRecipe {
            VStack {
                // image
                RecipeImage(
                    link: recipe.photoUrlLarge,
                    size: screenWidth,
                    radius: 0.0
                )
                .ignoresSafeArea()
                
                ScrollView {
                    VStack(alignment: .leading) {
                        // name
                        Text(recipe.name)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundStyle(.black)
                        
                        // cusine
                        Text(recipe.cuisine.rawValue)
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundStyle(.black)
                            .padding(.bottom, 8.0)
                        
                        HStack {
                            SaveRecipeBtn(recipe: recipe)
                            
                            RateRecipeBtn(recipe: recipe)
                        }
                        
                        // youtube
                        CopyLinkBtn(title: "Youtube", link: recipe.youtubeUrl)
                        
                        // website
                        CopyLinkBtn(title: "Website", link: recipe.sourceUrl)
                    }
                }
                
                Spacer()
            }
            .frame(width: screenWidth)
            .background(Color(
                UIColor(red: 1.00, green: 0.99, blue: 0.93, alpha: 1.00)
            ))
        } else {
            ErrorView()
        }
    }
}

#Preview {
    @ObservedObject var storeVM = StoreViewModel()
    @ObservedObject var recipeDetailsVM = RecipeDetailsViewModel()
    
    RecipeDetails()
        .environmentObject(storeVM)
        .environmentObject(recipeDetailsVM)
}
