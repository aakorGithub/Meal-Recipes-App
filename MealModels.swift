import Foundation

struct Meal: Identifiable, Codable {
    let idMeal: String
    let strMeal: String
    let strMealThumb: String?

    var id: String { idMeal }
}

struct MealDetail: Codable {
    let idMeal: String
    let strMeal: String
    let strInstructions: String
    let strMealThumb: String?
    let strIngredient1: String?
    let strMeasure1: String?
  
    var ingredients: [String] {
        var results: [String] = []
        if let ingredient1 = strIngredient1, let measure1 = strMeasure1, !ingredient1.isEmpty, !measure1.isEmpty {
            results.append("\(measure1) \(ingredient1)")
        }
       
        return results
    }
}
