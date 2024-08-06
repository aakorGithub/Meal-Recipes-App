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
    // Add additional ingredient and measurement fields up to 20 as needed

    // Combine ingredients and measurements into a readable format
    var ingredients: [String] {
        var results: [String] = []
        if let ingredient1 = strIngredient1, let measure1 = strMeasure1, !ingredient1.isEmpty, !measure1.isEmpty {
            results.append("\(measure1) \(ingredient1)")
        }
        // Repeat for additional ingredients/measurements
        return results
    }
}
