Recipe App
This is a recipe app that displays a list of recipes fetched from a remote API. The app adheres to modern Swift best practices and showcases efficient use of concurrency, caching, and error handling.


Steps to Run the App
Clone the Repository:

bash
Copy code
git clone <repository-url>
cd RecipeApp
Open the Project: Open RecipesApp.xcodeproj in Xcode.

Build and Run:

Select an iOS simulator or device.
Click on Run (or Cmd + R) to build and launch the app.
Test the App:

Run the unit tests with Cmd + U.

Focus Areas

1. Swift Concurrency

Used async/await for all asynchronous operations, such as fetching recipes and loading images.
Ensured clean and readable code by structuring concurrency with Task and MainActor.

2. Caching

Implemented a custom image caching system using FileManager for disk caching and NSCache for in-memory caching.
Optimized network usage by only loading images when they are displayed.

3. Error Handling

Gracefully handled malformed or empty recipe data with user-friendly error messages or empty states.

4. Scalable Architecture

Followed the MVVM design pattern to ensure a clean separation of concerns.
Built reusable components, making the app easy to extend or maintain.

5. Clean UI

Designed a simple and intuitive single-screen interface.
Included features like pull-to-refresh and responsive layouts for a better user experience.

Time Spent

Total Time: ~6–8 hours

Architecture and Setup: 1.5 hours

API Integration and Data Parsing: 2 hours

Image Caching Implementation: 1.5 hours

UI Design and Development: 1.5 hours

Testing: 1 hour

Trade-offs and Decisions

No Third-Party Libraries:

Choose not to use popular third-party libraries for networking (e.g., Alamofire) or image caching (e.g., SDWebImage) to meet the requirement. This increased the implementation effort but ensured full control over the solution.

UI Simplicity:

Focused on delivering a functional and clean interface rather than adding advanced animations or complex layouts due to time constraints.

Unit Testing Coverage:

Prioritized testing for core logic (e.g., data fetching and caching) but did not implement UI or integration tests.

Weakest Part of the Project

UI/UX Customization: The UI could be further enhanced with animations, accessibility features, and better visual feedback.

Image Caching Granularity: While functional, the image caching system could be optimized for better performance with large datasets or frequent updates.

Additional Information

Constraints Encountered:

Debugging async/await with Swift’s concurrency model in a disk caching scenario required extra attention to avoid deadlocks and ensure thread safety.

Potential Enhancements:

Add detailed recipe pages when a recipe is tapped.
Implement offline support by caching recipe data as well as images.


Thank you for reviewing the project! If you have any questions or suggestions, feel free to reach out.
