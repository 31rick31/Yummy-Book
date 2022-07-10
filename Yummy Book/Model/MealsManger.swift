//
//  MealsManger.swift
//  Yummy Book
//
//  Created by Ricky Memije on 6/26/22.
//

import Foundation

class MealsManger {
    
    //MARK: - Static Variable
    static var mealIdInfo: MealIdInfo = MealIdInfo(id: "", title: "", instructions: "", thumb: "", ingredients: [], measurements: [])
    
    static var mealInfo: MealInfo = MealInfo(idMeal: "", strMeal: "", strInstructions: "", strMealThumb: "", strIngredient1: "", strIngredient2: "", strIngredient3: "", strIngredient4: "", strIngredient5: "", strIngredient6: "", strIngredient7: "", strIngredient8: "", strIngredient9: "", strIngredient10: "", strIngredient11: "", strIngredient12: "", strIngredient13: "", strIngredient14: "", strIngredient15: "", strMeasure1: "", strMeasure2: "", strMeasure3: "", strMeasure4: "", strMeasure5: "", strMeasure6: "", strMeasure7: "", strMeasure8: "", strMeasure9: "", strMeasure10: "", strMeasure11: "", strMeasure12: "", strMeasure13: "", strMeasure14: "", strMeasure15: "")
    
    //MARK: - First API call Function
    func fetchMeals(completion: @escaping(MealsModel) -> Void) {
        
        guard let url = URL(string: "https://www.themealdb.com/api/json/v1/1/filter.php?c=Dessert")
        else { return }
        
        let dataTask = URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {
                print("Error fetching meals: \(error.localizedDescription)")
            }
            
            // parsing JSON
            guard let jsonData = data else { return }
            
            let decoder = JSONDecoder()
            
            do {
                let decodeData = try decoder.decode(MealsModel.self, from: jsonData)
                completion(decodeData)
            } catch {
                print("Error decoding data")
            }
            
        }
        dataTask.resume()
    }
    
    //MARK: - Second API call Function
    
    func fetchMealInfo(mealId: String, completion: @escaping(Meal) -> Void) {
        
        guard let url = URL(string: "https://www.themealdb.com/api/json/v1/1/lookup.php?i=" + "\(mealId)")
        else { return }
        print(url)
        let semaphore = DispatchSemaphore (value: 0)
        
        
        let dataTask = URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {
                print("Error fetching meals info: \(error.localizedDescription)")
            }
            // parsing JSON
            guard let jsonData = data else { return }
            
            let decoder = JSONDecoder()
            
            do {
                let decodeData = try decoder.decode(Meal.self, from: jsonData)
                let meal = decodeData.meals
                
                
                for m in meal {
                    
                    let infoForMeal: MealInfo = MealInfo(idMeal: m.idMeal, strMeal: m.strMeal, strInstructions: m.strInstructions, strMealThumb: m.strMealThumb, strIngredient1: m.strIngredient1, strIngredient2: m.strIngredient2, strIngredient3: m.strIngredient3, strIngredient4: m.strIngredient4, strIngredient5: m.strIngredient5, strIngredient6: m.strIngredient6, strIngredient7: m.strIngredient7, strIngredient8: m.strIngredient8, strIngredient9: m.strIngredient9, strIngredient10: m.strIngredient10, strIngredient11: m.strIngredient11, strIngredient12: m.strIngredient12, strIngredient13: m.strIngredient13, strIngredient14: m.strIngredient14, strIngredient15: m.strIngredient15, strMeasure1: m.strMeasure1, strMeasure2: m.strMeasure2, strMeasure3: m.strMeasure3, strMeasure4: m.strMeasure4, strMeasure5: m.strMeasure5, strMeasure6: m.strMeasure6, strMeasure7: m.strMeasure7, strMeasure8: m.strMeasure8, strMeasure9: m.strMeasure9, strMeasure10: m.strMeasure10, strMeasure11: m.strMeasure11, strMeasure12: m.strMeasure12, strMeasure13: m.strMeasure13, strMeasure14: m.strMeasure14, strMeasure15: m.strMeasure15)
                    
                    
                    var ingredients: [String] = []
                    var measurements: [String] = []
                    
                    // Filtering any empty Strings from ingredients Array and adding ingredients to Array
                    if infoForMeal.strIngredient1!.count >= 1 {
                        ingredients.append(infoForMeal.strIngredient1 ?? "")
                    }
                    if infoForMeal.strIngredient2!.count >= 1 {
                        ingredients.append(infoForMeal.strIngredient2 ?? "")
                    }
                    if infoForMeal.strIngredient3!.count >= 1 {
                        ingredients.append(infoForMeal.strIngredient3 ?? "")
                    }
                    if infoForMeal.strIngredient4!.count >= 1 {
                        ingredients.append(infoForMeal.strIngredient4 ?? "")
                    }
                    if infoForMeal.strIngredient5!.count >= 1 {
                        ingredients.append(infoForMeal.strIngredient5 ?? "")
                    }
                    if infoForMeal.strIngredient6!.count >= 1 {
                        ingredients.append(infoForMeal.strIngredient6 ?? "")
                    }
                    if infoForMeal.strIngredient7!.count >= 1 {
                        ingredients.append(infoForMeal.strIngredient7 ?? "")
                    }
                    if infoForMeal.strIngredient8!.count >= 1 {
                        ingredients.append(infoForMeal.strIngredient8 ?? "")
                    }
                    if infoForMeal.strIngredient9!.count >= 1 {
                        ingredients.append(infoForMeal.strIngredient9 ?? "")
                    }
                    if infoForMeal.strIngredient10!.count >= 1 {
                        ingredients.append(infoForMeal.strIngredient10 ?? "")
                    }
                    if infoForMeal.strIngredient11!.count >= 1 {
                        ingredients.append(infoForMeal.strIngredient11 ?? "")
                    }
                    if infoForMeal.strIngredient12!.count >= 1 {
                        ingredients.append(infoForMeal.strIngredient12 ?? "")
                    }
                    if infoForMeal.strIngredient13!.count >= 1 {
                        ingredients.append(infoForMeal.strIngredient13 ?? "")
                    }
                    if infoForMeal.strIngredient14!.count >= 1 {
                        ingredients.append(infoForMeal.strIngredient14 ?? "")
                    }
                    if infoForMeal.strIngredient15!.count >= 1 {
                        ingredients.append(infoForMeal.strIngredient15 ?? "")
                    }

                    // Filtering any empty Strings from measurements Array and addin measurments to Array
                    if infoForMeal.strIngredient1!.count >= 1 {
                        measurements.append(infoForMeal.strMeasure1 ?? "")
                    }
                    if infoForMeal.strMeasure2!.count >= 1 {
                        measurements.append(infoForMeal.strMeasure2 ?? "")
                    }
                    if infoForMeal.strMeasure3!.count >= 1 {
                        measurements.append(infoForMeal.strMeasure3 ?? "")
                    }
                    if infoForMeal.strMeasure4!.count >= 1 {
                        measurements.append(infoForMeal.strMeasure4 ?? "")
                    }
                    if infoForMeal.strMeasure5!.count >= 1 {
                        measurements.append(infoForMeal.strMeasure5 ?? "")
                    }
                    if infoForMeal.strMeasure6!.count >= 1 {
                        measurements.append(infoForMeal.strMeasure6 ?? "")
                    }
                    if infoForMeal.strMeasure7!.count >= 1 {
                        measurements.append(infoForMeal.strMeasure7 ?? "")
                    }
                    if infoForMeal.strMeasure8!.count >= 1 {
                        measurements.append(infoForMeal.strMeasure8 ?? "")
                    }
                    if infoForMeal.strMeasure9!.count >= 1 {
                        measurements.append(infoForMeal.strMeasure9 ?? "")
                    }
                    if infoForMeal.strMeasure10!.count >= 1 {
                        measurements.append(infoForMeal.strMeasure10 ?? "")
                    }
                    if infoForMeal.strMeasure11!.count >= 1 {
                        measurements.append(infoForMeal.strMeasure11 ?? "")
                    }
                    if infoForMeal.strMeasure12!.count >= 1 {
                        measurements.append(infoForMeal.strMeasure12 ?? "")
                    }
                    if infoForMeal.strMeasure13!.count >= 1 {
                        measurements.append(infoForMeal.strMeasure13 ?? "")
                    }
                    if infoForMeal.strMeasure14!.count >= 1 {
                        measurements.append(infoForMeal.strMeasure14 ?? "")
                    }
                    if infoForMeal.strMeasure15!.count >= 1 {
                        measurements.append(infoForMeal.strMeasure15 ?? "")
                    }

                    
                    MealsManger.mealIdInfo = MealIdInfo(id: infoForMeal.idMeal, title: infoForMeal.strMeal, instructions: infoForMeal.strInstructions, thumb: infoForMeal.strMealThumb, ingredients: ingredients, measurements: measurements)
                    semaphore.signal()
                    
                    print("Meal Info: \(MealsManger.mealInfo)")
                    print("Meal ID Info: \(MealsManger.mealIdInfo)")
                    print("ing array: \(MealsManger.mealIdInfo.ingredients)")
                    print("mea array: \(MealsManger.mealIdInfo.measurements)")
                }
                
                completion(decodeData)
            } catch {
                print("Error decoding data")
                semaphore.signal()
            }
        }
        dataTask.resume()
        semaphore.wait()
        NotificationCenter.default.post(name: .itemLoaded, object: self)
    }
 
    
}
