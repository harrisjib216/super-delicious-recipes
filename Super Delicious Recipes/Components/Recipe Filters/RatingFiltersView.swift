//
//  RatingFiltersView.swift
//  Super Delicious Recipes
//
//  Created by development on 3/18/25.
//

import SwiftUI

// filters for recipes where the user's rating matches the
// selected rating
struct RatingFiltersView: View {
    @EnvironmentObject var storeVM: StoreViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Rating")
                .font(.title2)
                .fontWeight(.bold)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(RecipeRating.allValues, id: \.rawValue) { filter in
                        Text(filter.rawValue)
                            .padding()
                            .foregroundColor(.white)
                            .background(storeVM.recipeRatingFilter == filter ? .orange : .gray)
                            .cornerRadius(10.0)
                            .onTapGesture {
                                withAnimation {
                                    storeVM.setRatingFilter(value: filter)
                                }
                            }
                    }
                }
            }
        }
    }
}

#Preview {
    @ObservedObject var storeVM = StoreViewModel()

    RatingFiltersView()
        .environmentObject(storeVM)
}
