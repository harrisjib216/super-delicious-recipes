//
//  GlimmerView.swift
//  Super Delicious Recipes
//
//  Created by development on 3/17/25.
//

import SwiftUI

// alternative loading spinner/component
// presents a box with a looping fading animation
struct GlimmerView: View {
    @State var isInitialState: Bool = false
    
    var body: some View {
        Rectangle()
            .background(.gray)
            .opacity(isInitialState ? 0.4 : 0.20)
            .animation(
                .linear(duration: 1.5)
                    .delay(0.25)
                    .repeatForever(),
                value: isInitialState
            )
            .onAppear() {
                withAnimation {
                    isInitialState = true
                }
            }
    }
}

#Preview {
    GlimmerView()
}
