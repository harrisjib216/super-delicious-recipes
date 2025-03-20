//
//  RecipeSearchBar.swift
//  Super Delicious Recipes
//
//  Created by development on 3/19/25.
//

import SwiftUI

struct RecipeSearchBar: View {
    @EnvironmentObject var storeVM: StoreViewModel

    var body: some View {
        HStack(spacing: 8.0) {
            Image(systemName: "magnifyingglass")
                .foregroundStyle(Color(UIColor.systemGray3))
            
            TextField("Search a recipe's name", text: $storeVM.recipeNameFilter)
                .background(Color(UIColor.systemGray6))
                .cornerRadius(12.0)
        }
        .padding(12.0)
        .background(Color(UIColor.systemGray6))
        .cornerRadius(12.0)
    }
}

#Preview {
    @ObservedObject var storeVM = StoreViewModel()

    RecipeSearchBar()
        .environmentObject(storeVM)
}
