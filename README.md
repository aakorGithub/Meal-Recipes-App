# Meal Recipe App

Meal Recipe is a SwiftUI application that allows users to browse and view details of dessert recipes fetched from TheMealDB API.

## Features

- Browse a list of dessert meals.
- View detailed information about each meal, including ingredients and instructions.
- Display meal images fetched from the web.

## Technologies Used

- Swift
- SwiftUI
- Combine
- TheMealDB API

## Files and Structure

### `FetchRecipesApp.swift`

This file contains the main entry point of the SwiftUI application. It sets up the initial view of the app.

### `MealsListView.swift`

This file contains the `MealsListView` struct and the `MealsListViewModel` class. It displays a list of dessert meals and handles fetching the meal data.

### `MealDetailView.swift`

This file contains the `MealDetailView` struct and the `MealDetailViewModel` class. It displays detailed information about a selected meal, including its ingredients and instructions.

### `MealService.swift`

This file contains the `MealService` class, which handles network requests to fetch meal data from TheMealDB API.

### `MealModels.swift`

This file contains the data models used in the application, including `Meal` and `MealDetail`.

## How to Run

1. Clone the repository.
2. Open the project in Xcode.
3. Build and run the project on your preferred simulator or device.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgements

- [TheMealDB](https://www.themealdb.com) for providing the API for meal data.
