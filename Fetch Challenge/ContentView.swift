//
//  ContentView.swift
//  Fetch Challenge
//
//  Created by Weiyi Tan on 2/20/24.
//

import SwiftUI

struct ContentView: View {
    @State private var dessertList = [Dessert]()
    @State private var dessertRecipe = Recipe()
    
    // some View is opaque return type
    var body: some View {
        NavigationStack {
            List(dessertList, id: \.idMeal) { item in
                NavigationLink {
                    RecipeView(id: item.idMeal)
                } label: {
                    DessertRowView(item: item)
                }
            
            }
            .task {
                await loadDessertData()
            }
            .navigationTitle("Desserts")        }
    }
    
    func loadDessertData() async {
        // guard let to check the url
        guard let url = URL(string: "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert") else { return }
        
        do {
            // use try and await in case of an error or sleep
            let (data, _) = try await URLSession.shared.data(from: url)

            if let decodedResponse = try? JSONDecoder().decode(DessertList.self, from: data) {
                dessertList = decodedResponse.meals
                print(dessertList)
            }
        } catch {
            print("Invalid data")
        }
        
    }
    
    func loadRecipeData(id: String) async {
        // guard let to check the url
        guard let url = URL(string: "https://themealdb.com/api/json/v1/1/lookup.php?i=" + id) else { return }
        
        do {
            // use try and await in case of an error or sleep
            let (data, _) = try await URLSession.shared.data(from: url)

            if let decodedResponse = try? JSONDecoder().decode(DessertRecipe.self, from: data) {
                dessertRecipe = decodedResponse.meals
                print(dessertRecipe)
            }
        } catch {
            print("Invalid data")
        }
    }
}

#Preview {
    ContentView()
}
