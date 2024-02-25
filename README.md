# Fetch Challenge
## Instructions
Please write a native iOS app that allows users to browse recipes using the following API: https://themealdb.com/api.php

1. There are 2 endpoints that your app should utilize:
    - https://themealdb.com/api/json/v1/1/filter.php?c=Dessert for fetching the list of meals in the Dessert category.
    - https://themealdb.com/api/json/v1/1/lookup.php?i=MEAL_ID for fetching the meal details by its ID.

2. The user should be shown the list of meals in the Dessert category, sorted alphabetically.

3. When the user selects a meal, they should be taken to a detailed view that includes:
    - Meal name
    - Instructions
    - Ingredients/measurements

4. Please read the following guidelines carefully before starting the coding
challenge:
    - Be sure to filter out any null or empty values from the API before displaying them.
    - UI/UX design is not what you’re being evaluated on, but the app should be user friendly and should take basic app design principles into account.
    - Project should compile using the latest version of Xcode.

## Disclaimer
I am not fluent in SwiftUI as I normally use UI Kit when coding in Swift. However, I wanted to try out Swift UI since it was preferred over UI Kit for this challenge and I wanted to challenge myself. As such, I followed many tutorials/Stack Overflow posts and tried to list most of the resources I have used below. 

## Resources
- https://www.hackingwithswift.com/quick-start/swiftui/swiftui-tutorial-building-a-complete-project
- https://stackoverflow.com/questions/63876702/how-do-i-use-text-in-swiftui-to-display-an-array-of-tuple-values
