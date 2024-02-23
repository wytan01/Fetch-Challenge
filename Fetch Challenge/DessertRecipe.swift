//
//  DessertRecipe.swift
//  Fetch Challenge
//
//  Created by Weiyi Tan on 2/23/24.
//

import SwiftUI

// var names has to be EXACTLY the same as the ones in returned JSON

struct DessertRecipe: Codable {
    var meals: Recipe
}

struct Recipe: Codable {
    var idMeal : String
    // ingredients/measurements
    
    var strMeal : String
    var strInstructions : String
    var strMealThumb : String
    
    #if DEBUG
      static let example = Dessert(idMeal: "53049", strMeal: "Apam Balik", strMealThumb: "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg")
      #endif
}
