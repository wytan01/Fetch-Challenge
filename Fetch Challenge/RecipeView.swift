//
//  RecipeView.swift
//  Fetch Challenge
//
//  Created by Weiyi Tan on 2/23/24.
//

import SwiftUI

struct RecipeView: View {
    @State private var dessertRecipe = [Recipe]()
    @State private var recipe = Recipe.defaultRecipe
    @State private var ingredientsAndMeasurements = [(ingredient: String, measurement: String)]()
    let id: String
    
    var body: some View {
        ScrollView {
            VStack {
                AsyncImage(url: URL(string: recipe.strMealThumb))  { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .scaledToFit()
                            .clipShape(RoundedRectangle(cornerRadius: 10.0))
                            .overlay(RoundedRectangle(cornerRadius: 10.0).stroke(Color.gray, lineWidth: 2))
                    } else if phase.error != nil {
                        Text("There was an error loading the image.")
                    } else {
                        ProgressView()
                    }
                }
                .frame(height: 200)
                
                HStack {
                    Text("Ingredients:")
                        .font(.headline)
                        .padding([.leading, .top])
                    Spacer()
                }
                
                ForEach(ingredientsAndMeasurements, id: \.ingredient) {item in
                    let ingredient = item.ingredient
                    let measurement = item.measurement
                    
                    if (ingredient != "") {
                        HStack {
                            Text("\u{2022}\t" + ingredient + ",")
                                .padding([.leading])
                            Text(measurement)
                                .italic()
                            Spacer()
                        }
                    }
                }
                
                
                HStack {
                    Text("Instructions:")
                        .font(.headline)
                        .padding([.leading, .top])
                    Spacer()
                    
                }
                Text(recipe.strInstructions)
                    .padding([.horizontal])
                
                    .task {
                        await loadRecipeData(idParam: id)
                    }
                    .navigationTitle(recipe.strMeal)
                    .navigationBarTitleDisplayMode(.inline)
                
                Spacer()
            }
        }
    }
    
    func loadRecipeData(idParam: String) async {
        // guard let to check the url
        guard let url = URL(string: "https://themealdb.com/api/json/v1/1/lookup.php?i=" + idParam) else { return }
        
        do {
            // use try and await in case of an error or sleep
            let (data, _) = try await URLSession.shared.data(from: url)

            if let decodedResponse = try? JSONDecoder().decode(DessertRecipe.self, from: data) {
                dessertRecipe = decodedResponse.meals
                recipe = dessertRecipe[0]
                
                // combine ingredients and measurements
                ingredientsAndMeasurements = [(recipe.strIngredient1, recipe.strMeasure1), (recipe.strIngredient2, recipe.strMeasure2), (recipe.strIngredient3, recipe.strMeasure3), (recipe.strIngredient4, recipe.strMeasure4), (recipe.strIngredient5, recipe.strMeasure5), (recipe.strIngredient6, recipe.strMeasure6), (recipe.strIngredient7, recipe.strMeasure7), (recipe.strIngredient8, recipe.strMeasure8), (recipe.strIngredient9, recipe.strMeasure9), (recipe.strIngredient10, recipe.strMeasure10), (recipe.strIngredient11, recipe.strMeasure11), (recipe.strIngredient12, recipe.strMeasure12), (recipe.strIngredient13, recipe.strMeasure13), (recipe.strIngredient14, recipe.strMeasure14), (recipe.strIngredient15, recipe.strMeasure15), (recipe.strIngredient16, recipe.strMeasure16), (recipe.strIngredient17, recipe.strMeasure17), (recipe.strIngredient18, recipe.strMeasure18), (recipe.strIngredient19, recipe.strMeasure19), (recipe.strIngredient20, recipe.strMeasure20)]
            }
        } catch {
            print("Invalid data")
        }
    }
}


struct Recipe_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            RecipeView(id: "53049")
        }
    }
}
