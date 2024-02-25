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
                
                if (recipe.strIngredient1 != nil && recipe.strMeasure1 != nil) {
                    ingredientsAndMeasurements.append((recipe.strIngredient1!, recipe.strMeasure1!))
                }
                if (recipe.strIngredient2 != nil && recipe.strMeasure2 != nil) {
                    ingredientsAndMeasurements.append((recipe.strIngredient2!, recipe.strMeasure2!))
                }
                if (recipe.strIngredient3 != nil && recipe.strMeasure3 != nil) {
                    ingredientsAndMeasurements.append((recipe.strIngredient3!, recipe.strMeasure3!))
                }
                if (recipe.strIngredient4 != nil && recipe.strMeasure4 != nil) {
                    ingredientsAndMeasurements.append((recipe.strIngredient4!, recipe.strMeasure4!))
                }
                if (recipe.strIngredient5 != nil && recipe.strMeasure5 != nil) {
                    ingredientsAndMeasurements.append((recipe.strIngredient5!, recipe.strMeasure5!))
                }
                if (recipe.strIngredient6 != nil && recipe.strMeasure6 != nil) {
                    ingredientsAndMeasurements.append((recipe.strIngredient6!, recipe.strMeasure6!))
                }
                if (recipe.strIngredient7 != nil && recipe.strMeasure7 != nil) {
                    ingredientsAndMeasurements.append((recipe.strIngredient7!, recipe.strMeasure7!))
                }
                if (recipe.strIngredient8 != nil && recipe.strMeasure8 != nil) {
                    ingredientsAndMeasurements.append((recipe.strIngredient8!, recipe.strMeasure8!))
                }
                if (recipe.strIngredient9 != nil && recipe.strMeasure9 != nil) {
                    ingredientsAndMeasurements.append((recipe.strIngredient9!, recipe.strMeasure9!))
                }
                if (recipe.strIngredient10 != nil && recipe.strMeasure10 != nil) {
                    ingredientsAndMeasurements.append((recipe.strIngredient10!, recipe.strMeasure10!))
                }
                if (recipe.strIngredient11 != nil && recipe.strMeasure11 != nil) {
                    ingredientsAndMeasurements.append((recipe.strIngredient11!, recipe.strMeasure11!))
                }
                if (recipe.strIngredient12 != nil && recipe.strMeasure12 != nil) {
                    ingredientsAndMeasurements.append((recipe.strIngredient12!, recipe.strMeasure12!))
                }
                if (recipe.strIngredient13 != nil && recipe.strMeasure13 != nil) {
                    ingredientsAndMeasurements.append((recipe.strIngredient13!, recipe.strMeasure13!))
                }
                if (recipe.strIngredient14 != nil && recipe.strMeasure14 != nil) {
                    ingredientsAndMeasurements.append((recipe.strIngredient14!, recipe.strMeasure14!))
                }
                if (recipe.strIngredient15 != nil && recipe.strMeasure15 != nil) {
                    ingredientsAndMeasurements.append((recipe.strIngredient15!, recipe.strMeasure15!))
                }
                if (recipe.strIngredient16 != nil && recipe.strMeasure16 != nil) {
                    ingredientsAndMeasurements.append((recipe.strIngredient16!, recipe.strMeasure16!))
                }
                if (recipe.strIngredient17 != nil && recipe.strMeasure17 != nil) {
                    ingredientsAndMeasurements.append((recipe.strIngredient17!, recipe.strMeasure17!))
                }
                if (recipe.strIngredient18 != nil && recipe.strMeasure18 != nil) {
                    ingredientsAndMeasurements.append((recipe.strIngredient18!, recipe.strMeasure18!))
                }
                if (recipe.strIngredient19 != nil && recipe.strMeasure19 != nil) {
                    ingredientsAndMeasurements.append((recipe.strIngredient19!, recipe.strMeasure19!))
                }
                if (recipe.strIngredient20 != nil && recipe.strMeasure20 != nil) {
                    ingredientsAndMeasurements.append((recipe.strIngredient20!, recipe.strMeasure20!))
                }
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
