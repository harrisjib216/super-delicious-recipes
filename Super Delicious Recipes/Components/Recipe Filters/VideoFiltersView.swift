//
//  VideoFiltersView.swift
//  Super Delicious Recipes
//
//  Created by development on 3/18/25.
//

import SwiftUI

// filters for recipes with a youtube video
struct VideoFiltersView: View {
    @EnvironmentObject var storeVM: StoreViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Has video tutorial")
                .font(.title2)
                .fontWeight(.bold)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(BooleanFilter.allValues, id: \.rawValue) { filter in
                        Text(filter.rawValue)
                            .padding()
                            .foregroundColor(.white)
                            .background(storeVM.recipeVideoFilter == filter ? .orange : .gray)
                            .cornerRadius(10.0)
                            .onTapGesture {
                                withAnimation {
                                    storeVM.setVideoFilter(value: filter)
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

    VideoFiltersView()
        .environmentObject(storeVM)
}
