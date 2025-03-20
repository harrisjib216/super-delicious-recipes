//
//  Super_Delicious_RecipesTests.swift
//  Super Delicious RecipesTests
//
//  Created by development on 3/17/25.
//

import Testing
@testable import Super_Delicious_Recipes

struct FetchRecipesServiceTests {
    @Test("Can json decoder handle normal responses")
    func CanHandleANormalResponse() async {
        let recipes = await FetchRecipesService.fetchFromServer(url: FetchRecipesService.api)
        #expect(!recipes.isEmpty)
    }
    
    @Test("Can json decoder handle empty responses")
    func CanHandleAnEmptyResponse() async {
        let recipes = await FetchRecipesService.fetchFromServer(url: FetchRecipesService.emptyApi)
        #expect(recipes.isEmpty)
    }
    
    @Test("Can json decoder handle malformed responses")
    func CanHandleAMalformedResponse() async {
        let recipes = await FetchRecipesService.fetchFromServer(url: FetchRecipesService.badApi)
        #expect(recipes.isEmpty)
    }
}
