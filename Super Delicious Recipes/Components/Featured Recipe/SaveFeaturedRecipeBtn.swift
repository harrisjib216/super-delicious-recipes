//
//  SaveFeaturedRecipeBtn.swift
//  Super Delicious Recipes
//
//  Created by development on 3/17/25.
//

import SwiftUI

// button to save the featured recipe to the device
struct SaveFeaturedRecipeBtn: View {
    @EnvironmentObject var storeVM: StoreViewModel
    
    var body: some View {
        if let featuredRecipe = storeVM.featuredRecipe {
            let isSaved = featuredRecipe.isSaved
            
            Image(systemName: isSaved ? "heart.fill" : "heart")
                .padding(10.0)
                .foregroundColor(isSaved ? .red : .white)
                .background(isSaved ? .orange : .black)
                .cornerRadius(10)
                .onTapGesture(perform: onTapped)
        } else {
            EmptyView()
        }
    }
    
    func onTapped() {
        withAnimation(.linear(duration: 0.25)) {
            storeVM.saveFeaturedRecipe()
        }
    }
}

#Preview {
    @ObservedObject var storeVM = StoreViewModel()

    SaveFeaturedRecipeBtn()
        .environmentObject(storeVM)
}
