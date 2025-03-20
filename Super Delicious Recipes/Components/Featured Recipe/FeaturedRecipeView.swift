//
//  FeaturedRecipeView.swift
//  Super Delicious Recipes
//
//  Created by development on 3/17/25.
//

import SwiftUI

// presents a card with as a featured recipe and allows the user
// to either 1. open it, 2. save it, or 3. rate it
struct FeaturedRecipeView: View {
    @EnvironmentObject var storeVM: StoreViewModel
    @EnvironmentObject var recipeDetailsVM: RecipeDetailsViewModel
    @State private var isDetailsScreenReady = false
    
    var body: some View {
        if let featuredRecipe = storeVM.featuredRecipe {
            VStack(alignment: .leading) {
                // header
                Text("Featured Recipe")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(.black)
                
                HStack {
                    // recipe image
                    RecipeImage(link: featuredRecipe.photoUrlSmall, size: 140.0)
                    
                    // recipe description
                    VStack(alignment: .leading) {
                        // name
                        Text(featuredRecipe.name)
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundStyle(.black)
                            .truncationMode(.tail)
                        
                        // cuisine
                        Text("Cuisine: \(featuredRecipe.cuisine.rawValue)")
                            .font(.body)
                            .foregroundStyle(.black)
                        
                        // has video labe
                        if !featuredRecipe.youtubeUrl.isEmpty {
                            Text("Has video")
                                .font(.subheadline)
                                .foregroundStyle(.black)
                        }
                        
                        // has video labe
                        if !featuredRecipe.youtubeUrl.isEmpty {
                            Text("Has website")
                                .font(.subheadline)
                                .foregroundStyle(.black)
                        }
                        
                        Spacer()
                        
                        // action btns
                        HStack {
                            // save btn
                            SaveFeaturedRecipeBtn()
                            
                            // rate btn
                            RateFeaturedRecipeBtn()
                        }
                    }
                    .padding(.top, 8.0)
                    .padding(.bottom, 6.0)
                    
                    Spacer()
                }
                .frame(height: 150.0)
                .padding(.horizontal, 4.0)
                .overlay {
                    // border
                    RoundedRectangle(cornerRadius: 16.0)
                        .stroke(.gray, lineWidth: 1.0)
                }
                .onTapGesture {
                    // select recipe & navigate
                    recipeDetailsVM.setSelectedRecipe(recipe: featuredRecipe)
                    isDetailsScreenReady = true
                }
                .navigationDestination(isPresented: $isDetailsScreenReady) {
                    RecipeDetailsScreen()
                }
            }
        } else {
            EmptyView()
        }
    }
}

#Preview {
    @ObservedObject var storeVM = StoreViewModel()
    @ObservedObject var recipeDetailsVM = RecipeDetailsViewModel()

    FeaturedRecipeView()
        .environmentObject(storeVM)
        .environmentObject(recipeDetailsVM)
}
