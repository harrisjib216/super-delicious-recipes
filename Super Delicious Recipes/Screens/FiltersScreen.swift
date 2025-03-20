//
//  RecipeFiltersView.swift
//  Super Delicious Recipes
//
//  Created by development on 3/18/25.
//

import SwiftUI

// a screen to let users filter recipes
struct FiltersScreen: View {
    @EnvironmentObject var storeVM: StoreViewModel
    @Environment(\.dismissSearch) var dismissSearch

    var body: some View {
        NavigationStack {
            ScrollView {
                RecipeSearchBar()
                
                CuisineFiltersView()
                
                VideoFiltersView()
                
                WebsiteFiltersView()
                
                SavedFiltersView()
                
                RatingFiltersView()
            }
            .padding()
            .background(Color(
                UIColor(red: 1.00, green: 0.99, blue: 0.93, alpha: 1.00)
            ))
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .navigation, content: {
                BackButton()
            })
        }
    }
}

#Preview {
    @ObservedObject var storeVM = StoreViewModel()

    FiltersScreen()
        .environmentObject(storeVM)
}
