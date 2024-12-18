//
//  Recipe.swift
//  RecipesApp
//
//  Created by Md Rezaul Karim on 12/17/24.
//

import Foundation


struct Recipe: Codable {
    let recipes: [Recipes]
}

struct Recipes: Codable {
    let cuisine: String
    let name: String
    let photoURLSmall: URL?
    let uuid: String

    enum CodingKeys: String, CodingKey {
        case cuisine, name, uuid
        case photoURLSmall = "photo_url_small"
    }
}
