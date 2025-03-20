//
//  BackButton.swift
//  Super Delicious Recipes
//
//  Created by development on 3/19/25.
//

import SwiftUI

struct BackButton: View {
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        Button(action: {
            dismiss()
        }) {
            Image(systemName: "arrowshape.backward.circle.fill")
                .foregroundStyle(.white, .orange)
                .font(.largeTitle)
        }
    }
}
