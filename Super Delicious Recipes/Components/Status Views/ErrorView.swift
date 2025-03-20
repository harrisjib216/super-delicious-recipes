//
//  ErrorView.swift
//  Super Delicious Recipes
//
//  Created by development on 3/18/25.
//

import SwiftUI

// simple error message incase something goes wrong
struct ErrorView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Image(systemName: "questionmark.circle.fill")
                    .foregroundStyle(.gray)
                    .font(.system(size: 60))
                
                Text("Oops!")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundStyle(.gray)
                
                Text("This screen could not be opened")
                    .font(.title2)
                    .fontWeight(.medium)
                    .foregroundStyle(.gray)
            }
            .background(Color(
                UIColor(red: 1.00, green: 0.99, blue: 0.93, alpha: 1.00)
            ))
        }
    }
}

#Preview {
    ErrorView()
}
