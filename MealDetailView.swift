import SwiftUI

struct MealDetailView: View {
    let mealID: String
    @StateObject private var viewModel = MealDetailViewModel()

    var body: some View {
        VStack {
            if let mealDetail = viewModel.mealDetail {
                Text(mealDetail.strMeal)
                    .font(.largeTitle)
                    .padding()
                if let imageUrl = mealDetail.strMealThumb, let url = URL(string: imageUrl) {
                    AsyncImage(url: url)
                        .aspectRatio(contentMode: .fit)
                }
                Text("Ingredients")
                    .font(.headline)
                    .padding(.top)
                ForEach(mealDetail.ingredients, id: \.self) { ingredient in
                    Text(ingredient)
                }
                Text("Instructions")
                    .font(.headline)
                    .padding(.top)
                Text(mealDetail.strInstructions)
                    .padding()
            } else {
                ProgressView("Loading...")
            }
        }
        .navigationTitle("Meal Detail")
        .task {
            await viewModel.fetchMealDetail(id: mealID)
        }
    }
}

class MealDetailViewModel: ObservableObject {
    @Published var mealDetail: MealDetail?

    private let mealService = MealService()

    func fetchMealDetail(id: String) async {
        do {
            let detail = try await mealService.fetchMealDetail(id: id)
            DispatchQueue.main.async {
                self.mealDetail = detail
            }
        } catch {
            print("Error fetching meal detail: \(error)")
        }
    }
}
