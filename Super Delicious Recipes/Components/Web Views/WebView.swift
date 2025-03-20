//
//  WebView.swift
//  Super Delicious Recipes
//
//  Created by development on 3/18/25.
//

import SwiftUI

// a wrapper component to display the webpage being loaded
// and a loading glimmer/indicator before it finishes loading
struct WebView: View {
    @State private var isLoading = true
    @State private var error: Error? = nil
    
    let link: String
    
    var body: some View {
        return ZStack {
            WebsiteLoader(link: link, isLoading: $isLoading, error: $error)
            
            if isLoading {
                GlimmerView()
            }
        }
    }
}

#Preview {
    WebView(link: "https://www.bbcgoodfood.com/recipes/778642/apple-and-blackberry-crumble")
}
