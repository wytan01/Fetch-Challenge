//
//  DessertRowView.swift
//  Fetch Challenge
//
//  Created by Weiyi Tan on 2/23/24.
//

import SwiftUI

struct DessertRowView: View {
    let item: Dessert
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: item.strMealThumb))  { phase in
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
            .frame(width: 100, height: 100)
            Text(item.strMeal)
                .font(.headline)
        }
    }
}

struct DessertRowView_Previews: PreviewProvider {
    static var previews: some View {
        DessertRowView(item: Dessert.example)
    }
}

