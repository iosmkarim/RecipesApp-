//
//  RecipeServiceError.swift
//  RecipesApp
//
//  Created by Md Rezaul Karim on 12/17/24.
//

import Foundation

enum RecipeServiceError: Error {
    case invalidURL
    case invalidData
    case invalidResponse
    
    var errorDescirption: String? {
        switch self {
        case .invalidURL: return "invalid URL found"
        case .invalidData: return "invalid Data found"
        case .invalidResponse: return "invalid Response found"
        }
    }
}
