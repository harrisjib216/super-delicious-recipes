//
//  WebsiteFiltersView.swift
//  Super Delicious Recipes
//
//  Created by development on 3/18/25.
//

import SwiftUI

// filters for recipes with an original website
struct WebsiteFiltersView: View {
    @EnvironmentObject var storeVM: StoreViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Has website")
                .font(.title2)
                .fontWeight(.bold)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(BooleanFilter.allValues, id: \.rawValue) { filter in
                        Text(filter.rawValue)
                            .padding()
                            .foregroundColor(.white)
                            .background(storeVM.recipeWebsiteFilter == filter ? .orange : .gray)
                            .cornerRadius(10.0)
                            .onTapGesture {
                                withAnimation {
                                    storeVM.setWebsiteFilter(value: filter)
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

    WebsiteFiltersView()
        .environmentObject(storeVM)
}
