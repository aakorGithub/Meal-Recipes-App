import SwiftUI

struct MealsListView: View {
    @StateObject private var viewModel = MealsListViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.meals) { meal in
                NavigationLink(destination: MealDetailView(mealID: meal.idMeal)) {
                    Text(meal.strMeal)
                }
            }
            .navigationTitle("Dessert Meals")
            .onAppear {
                Task {
                    await viewModel.fetchMeals()
                }
            }
        }
    }
}

class MealsListViewModel: ObservableObject {
    @Published var meals: [Meal] = []

    private let mealService = MealService()

    func fetchMeals() async {
        do {
            let meals = try await mealService.fetchDessertMeals()
            DispatchQueue.main.async {
                self.meals = meals
            }
        } catch {
            print("Error fetching meals: \(error)")
        }
    }
}
