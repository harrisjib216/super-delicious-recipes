//
//  CuisineFiltersView.swift
//  Super Delicious Recipes
//
//  Created by development on 3/18/25.
//

import SwiftUI

// filters all recipes by the selected cuisine
struct CuisineFiltersView: View {
    @EnvironmentObject var storeVM: StoreViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            // label
            Text("Cuisine")
                .font(.title2)
                .fontWeight(.bold)
            
            // countries
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(Cuisine.allValues, id: \.self) { cuisine in
                        Text(cuisine.rawValue)
                            .padding()
                            .foregroundColor(.white)
                            .background(storeVM.recipeCuisineFilter == cuisine ? .orange : .gray)
                            .cornerRadius(10.0)
                            .onTapGesture {
                                withAnimation {
                                    storeVM.setCuisineFilter(value: cuisine)
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

    CuisineFiltersView()
        .environmentObject(storeVM)
}
