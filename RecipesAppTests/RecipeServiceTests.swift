//
//  RecipeServiceTests.swift
//  RecipesAppTests
//
//  Created by Md Rezaul Karim on 12/17/24.
//

import XCTest
@testable import RecipesApp

final class RecipeServiceTests: XCTestCase {
    func testFetchRecipesSuccess() async throws {
        let service = RecipeService()
        let recipes = try await service.fetchRecipes()
        XCTAssertFalse(recipes.isEmpty, "Recipes should not be empty on success")
    }

    func testImageCaching() async throws {
        let imageCache = ImageCache()
        let imageURL = URL(string: "https://some.url/small.jpg")!
        let image = try await imageCache.image(for: imageURL)
        XCTAssertNotNil(image, "Image should be fetched and cached")
    }
}
