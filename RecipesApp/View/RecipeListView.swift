//
//  RecipeListView.swift
//  RecipesApp
//
//  Created by Md Rezaul Karim on 12/17/24.
//

import SwiftUI

struct RecipeListView: View {
    @StateObject private var viewModel = RecipeListViewModel(recipeService: RecipeService())
    @State private var isRefreshing = false
    
    var body: some View {
        NavigationView {
            Group {
                switch viewModel.state {
                case .loading:
                    ProgressView("Loading recipes...")
                case .error(let error):
                    Text(error).foregroundColor(.red)
                case .success(recipe: let recipes):
                    if recipes.isEmpty {
                        Text("No recipes available.")
                    } else {
                        List(recipes, id: \.uuid) { recipe in
                            RecipeRow(recipe: recipe, viewModel: viewModel)
                        }
                    }
                default:
                    Text("No recipes available.")
                }
            }
            .navigationTitle("Recipes")
            .refreshable {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    Task {
                        await viewModel.fetchRecipes()
                    }
                }
            }
        }
        .task {
            await viewModel.fetchRecipes()
        }
    }
}

struct RecipeRow: View {
    let recipe: Recipes
    @ObservedObject var viewModel: RecipeListViewModel

    @State private var image: UIImage?

    var body: some View {
        HStack {
            if let image = image {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 50, height: 50)
                    .clipShape(RoundedRectangle(cornerRadius: 5))
            } else {
                ProgressView()
                    .frame(width: 50, height: 50)
            }
            VStack(alignment: .leading) {
                Text(recipe.name).font(.headline)
                Text(recipe.cuisine).font(.subheadline)
            }
        }
        .task {
            image = await viewModel.loadImage(for: recipe.photoURLSmall)
        }
    }
}

#Preview {
    RecipeListView()
}
