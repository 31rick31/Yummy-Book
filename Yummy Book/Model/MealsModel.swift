//
//  MealsModel.swift
//  Yummy Book
//
//  Created by Ricky Memije on 6/25/22.
//

import Foundation

struct MealsModel: Codable {
    
    let meals: [Meals]
    
}


struct Meals: Codable {
    
    let strMeal: String?
    let strMealThumb: String?
    let idMeal: String?
    
}
