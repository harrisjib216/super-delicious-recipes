//
//  NoResultsView.swift
//  Super Delicious Recipes
//
//  Created by development on 3/19/25.
//

import SwiftUI

// simple error message incase something goes wrong
struct NoResultsView: View {
    var body: some View {
        VStack(alignment: .center) {
            Text("No results found")
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(.gray)
            
            Text("Please update your filters")
                .font(.title2)
                .fontWeight(.medium)
                .foregroundStyle(.gray)
        }
    }
}

#Preview {
    NoResultsView()
}
