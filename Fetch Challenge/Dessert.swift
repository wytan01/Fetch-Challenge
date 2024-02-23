//
//  Dessert.swift
//  Fetch Challenge
//
//  Created by Weiyi Tan on 2/23/24.
//

import SwiftUI

// var names has to be EXACTLY the same as the ones in returned JSON

struct DessertList: Codable {
    var meals: [Dessert]
}

struct Dessert: Codable {
    var idMeal : String
    var strMeal : String
    var strMealThumb : String
    
    #if DEBUG
      static let example = Dessert(idMeal: "1", strMeal: "Apam Balik", strMealThumb: "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg")
      #endif
}
