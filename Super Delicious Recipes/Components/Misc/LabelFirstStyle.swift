//
//  LabelFirstStyle.swift
//  Super Delicious Recipes
//
//  Created by development on 3/19/25.
//

import SwiftUI

struct LabelFirstStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack(alignment: .center, spacing: 8) {
            configuration.title
            configuration.icon
        }
    }
}
