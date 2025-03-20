//
//  ContentView.swift
//  Super Delicious Recipes
//
//  Created by development on 3/17/25.
//

import SwiftUI

struct HomeScreen: View {
    @EnvironmentObject var storeVM: StoreViewModel

    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                FeaturedRecipeView()
                RecipesList()
                    .padding(.top, 16.0)
            }
            .refreshable {
                Task {
                    await storeVM.loadRecipes()
                }
            }
            .padding(.horizontal, 16.0)
            .background(Color(
                UIColor(red: 1.00, green: 0.99, blue: 0.93, alpha: 1.00)
            ))
        }
        .frame(alignment: .leading)
    }
}

#Preview {
    @ObservedObject var storeVM = StoreViewModel()
    @ObservedObject var recipeDetailsVM = RecipeDetailsViewModel()

    HomeScreen()
        .environmentObject(storeVM)
        .environmentObject(recipeDetailsVM)
}
