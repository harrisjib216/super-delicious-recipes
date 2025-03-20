//
//  RecipeDetailsScreen.swift
//  Super Delicious Recipes
//
//  Created by development on 3/18/25.
//

import SwiftUI
import WebKit
import CoreData

struct RecipeDetailsScreen: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var storeVM: StoreViewModel
    @EnvironmentObject var recipeDetailsVM: RecipeDetailsViewModel

    var body: some View {
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        
        NavigationStack {
            if let recipe = recipeDetailsVM.selectedRecipe {
                ZStack {
                    // youtube preview
                    if !recipe.youtubeUrl.isEmpty {
                        WebView(link: recipe.youtubeUrl)
                            .frame(width: screenWidth, height: screenHeight)
                            .ignoresSafeArea()
                            .opacity(recipeDetailsVM.selectedComponent == RecipeDetailComponent.youtube ? 1.0 : 0.0)
                    }
                    
                    // website preview
                    if !recipe.sourceUrl.isEmpty {
                        WebView(link: recipeDetailsVM.selectedRecipe!.sourceUrl)
                            .ignoresSafeArea()
                            .frame(width: screenWidth, height: screenHeight)
                            .opacity(recipeDetailsVM.selectedComponent == RecipeDetailComponent.website ? 1.0 : 0.0)
                    }
                    
                    // recipe overview
                    RecipeDetails()
                       .opacity(recipeDetailsVM.selectedComponent == RecipeDetailComponent.overview ? 1.0 : 0.0)
                    
                    // component selector
                    if recipeDetailsVM.components.count > 1 {
                        HStack {
                            ForEach(recipeDetailsVM.components, id: \.rawValue) { component in
                                Text(component.rawValue)
                                    .foregroundStyle(.white)
                                    .padding()
                                    .background(recipeDetailsVM.selectedComponent == component ? .orange : .gray)
                                    .cornerRadius(12.0)
                                    .onTapGesture {
                                        recipeDetailsVM.setSelectedComponent(component: component)
                                    }
                            }
                        }
                        .offset(y: screenHeight * 0.4)
                    }
                }
                .background(Color(
                    UIColor(red: 1.00, green: 0.99, blue: 0.93, alpha: 1.00)
                ))
            } else {
                ErrorView()
            }
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .navigation, content: {
                BackButton()
            })
        }
    }
}

#Preview {
    @ObservedObject var storeVM = StoreViewModel()
    @ObservedObject var recipeDetailsVM = RecipeDetailsViewModel()
    
    RecipeDetailsScreen()
        .environmentObject(storeVM)
        .environmentObject(recipeDetailsVM)
}
