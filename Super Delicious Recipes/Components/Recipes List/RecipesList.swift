//
//  RecipesList.swift
//  Super Delicious Recipes
//
//  Created by development on 3/18/25.
//

import SwiftUI

// displays a 2x2 list of recipes with or without filters
struct RecipesList: View {
    @EnvironmentObject var storeVM: StoreViewModel
    @EnvironmentObject var recipeDetailsVM: RecipeDetailsViewModel
    
    let size = UIScreen.main.bounds.width / 2.0 - 16.0
    var columns: [GridItem] {
        return [
            GridItem(.flexible(minimum: size, maximum: size)),
            GridItem(.flexible(minimum: size, maximum: size)),
        ]
    }

    var body: some View {
        VStack {
            HStack(alignment: .center) {
                // number of recipes
                Text(storeVM.filteredRecipes.isEmpty ? "No recipes" : "^[\(storeVM.filteredRecipes.count) Recipe](inflect: true)")
                    .font(.title)
                    .foregroundStyle(.black)
                    .fontWeight(.bold)
                    .foregroundStyle(.gray)
                
                Spacer()
                
                // filtering options
                NavigationLink(destination: FiltersScreen(), label: {
                    Label(title: {
                        Text("Filter")
                            .font(.title3)
                    }, icon: {
                        Image(systemName: "chevron.right")
                    })
                    .foregroundStyle(.orange)
                    .labelStyle(LabelFirstStyle())
                })
            }
            
            if storeVM.filteredRecipes.isEmpty {
                // no recipes
                NoResultsView()
                    .frame(height: 300)
            } else {
                // 2x2 grid of recipes
                LazyVGrid(columns: columns) {
                    ForEach(storeVM.filteredRecipes, id: \.uuid) { recipe in
                        RecipeView(recipe: recipe, size: size)
                    }
                }
            }
        }
        .navigationDestination(isPresented: $recipeDetailsVM.isDetailsScreenReady) {
            RecipeDetailsScreen()
        }
    }
}

#Preview {
    @ObservedObject var storeVM = StoreViewModel()

    RecipesList()
        .environmentObject(storeVM)
}
