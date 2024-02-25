//
//  DessertRecipe.swift
//  Fetch Challenge
//
//  Created by Weiyi Tan on 2/23/24.
//

import SwiftUI

// var names has to be EXACTLY the same as the ones in returned JSON

struct DessertRecipe: Codable {
    var meals: [Recipe]
}

struct Recipe: Codable {
    var idMeal : String
    var strMeal : String
    var strInstructions : String
    var strMealThumb : String
    
    // ingredients
    var strIngredient1: String? = ""
    var strIngredient2: String? = ""
    var strIngredient3: String? = ""
    var strIngredient4: String? = ""
    var strIngredient5: String? = ""
    var strIngredient6: String? = ""
    var strIngredient7: String? = ""
    var strIngredient8: String? = ""
    var strIngredient9: String? = ""
    var strIngredient10: String? = ""
    var strIngredient11: String? = ""
    var strIngredient12: String? = ""
    var strIngredient13: String? = ""
    var strIngredient14: String? = ""
    var strIngredient15: String? = ""
    var strIngredient16: String? = ""
    var strIngredient17: String? = ""
    var strIngredient18: String? = ""
    var strIngredient19: String? = ""
    var strIngredient20: String? = ""
    
    
    // measurements
    var strMeasure1: String? = ""
    var strMeasure2: String? = ""
    var strMeasure3: String? = ""
    var strMeasure4: String? = ""
    var strMeasure5: String? = ""
    var strMeasure6: String? = ""
    var strMeasure7: String? = ""
    var strMeasure8: String? = ""
    var strMeasure9: String? = ""
    var strMeasure10: String? = ""
    var strMeasure11: String? = ""
    var strMeasure12: String? = ""
    var strMeasure13: String? = ""
    var strMeasure14: String? = ""
    var strMeasure15: String? = ""
    var strMeasure16: String? = ""
    var strMeasure17: String? = ""
    var strMeasure18: String? = ""
    var strMeasure19: String? = ""
    var strMeasure20: String? = ""
    
    
    
    #if DEBUG
      static let defaultRecipe = Recipe(idMeal: "", strMeal: "", strInstructions: "", strMealThumb: "", strIngredient1: "", strIngredient2: "", strIngredient3: "", strIngredient4: "", strIngredient5: "", strIngredient6: "", strIngredient7: "", strIngredient8: "", strIngredient9: "", strIngredient10: "", strIngredient11: "", strIngredient12: "", strIngredient13: "", strIngredient14: "", strIngredient15: "", strIngredient16: "", strIngredient17: "", strIngredient18: "", strIngredient19: "", strIngredient20: "", strMeasure1: "", strMeasure2: "", strMeasure3: "", strMeasure4: "", strMeasure5: "", strMeasure6: "", strMeasure7: "", strMeasure8: "", strMeasure9: "", strMeasure10: "", strMeasure11: "", strMeasure12: "", strMeasure13: "", strMeasure14: "", strMeasure15: "", strMeasure16: "", strMeasure17: "", strMeasure18: "", strMeasure19: "", strMeasure20: "")
      #endif
}
