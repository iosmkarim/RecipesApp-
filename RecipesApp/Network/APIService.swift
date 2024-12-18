//
//  APIService.swift
//  RecipesApp
//
//  Created by Md Rezaul Karim on 12/17/24.
//

import Foundation


protocol RecipeServiceProtocol {
    func fetchRecipes() async throws -> [Recipes]
}

class RecipeService: RecipeServiceProtocol {
    static let recipesURL = "https://d3jbb8n5wk0qxi.cloudfront.net/recipes.json"
    
    static let recipesURLMalformed = "https://d3jbb8n5wk0qxi.cloudfront.net/recipes-malformed.json"
    
    static let recipesURLEmpty = "https://d3jbb8n5wk0qxi.cloudfront.net/recipes-empty.json"
    
    func fetchRecipes() async throws -> [Recipes] {
        
        guard let url = URL(string: RecipeService.recipesURL) else {
            throw RecipeServiceError.invalidURL
        }
                
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let response = response as? HTTPURLResponse,
              response.statusCode == 200 else {
            throw RecipeServiceError.invalidResponse
        }
        do {
            let decoder = JSONDecoder()
            let decodedData = try decoder.decode(Recipe.self, from: data)
            return decodedData.recipes
        }catch {
            throw RecipeServiceError.invalidData
        }
    }
}
