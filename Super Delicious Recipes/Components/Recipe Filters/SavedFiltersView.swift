//
//  SavedFiltersView.swift
//  Super Delicious Recipes
//
//  Created by development on 3/18/25.
//

import SwiftUI

// filters for saved recipes
struct SavedFiltersView: View {
    @EnvironmentObject var storeVM: StoreViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Saved")
                .font(.title2)
                .fontWeight(.bold)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(BooleanFilter.allValues, id: \.rawValue) { filter in
                        Text(filter.rawValue)
                            .padding()
                            .foregroundColor(.white)
                            .background(storeVM.recipeSavedFilter == filter ? .orange : .gray)
                            .cornerRadius(10.0)
                            .onTapGesture {
                                withAnimation {
                                    storeVM.setSavedFilter(value: filter)
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

    SavedFiltersView()
        .environmentObject(storeVM)
}
