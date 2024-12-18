//
//  RecipeListViewModel.swift
//  RecipesApp
//
//  Created by Md Rezaul Karim on 12/17/24.
//

import Foundation
import UIKit

@MainActor
class RecipeListViewModel: ObservableObject {
    
    enum ViewState {
        case na
        case error(message: String)
        case loading
        case success(recipe: [Recipes])
        case refreshing
    }
    
    @Published var state: ViewState = .na
    
    public let recipeService: RecipeServiceProtocol
    private let imageCache = ImageCache()
    
    init(recipeService: RecipeServiceProtocol) {
        self.recipeService = recipeService
    }
    
    func fetchRecipes() async {
        state = .loading
        do {
            let fetchedRecipes = try await recipeService.fetchRecipes()
            let recipes = fetchedRecipes
            state = .success(recipe: recipes)
        } catch {
            let errorMessage = "Failed to load recipes. Please try again."
            state = .error(message: errorMessage)
        }
    }
    
    func loadImage(for url: URL?) async -> UIImage? {
        guard let url = url else { return nil }
        do {
            return try await imageCache.image(for: url)
        } catch {
            return nil
        }
    }
}
