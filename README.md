# BasketballShot
3D Basketball Shot Chart Viewer

Documentation & Guidelines
This document outlines the architectural foundation and best practices for developing the 3D Basketball Shot Chart Viewer. The system is designed with a modular, layered architecture to ensure clarity, maintainability, and efficient collaboration.

1. Architecture Layers & Responsibilities
The system is organized into distinct layers, each with a specific responsibility in the flow of data and presentation.

1.1. View Layer

Responsibilities:

Displays the UI elements that the user interacts with.
Renders real-time shot data, including shot trajectories and player movements.
Handles user input, such as tapping or rotating the court.

Key Tasks:

Rendering: Updates the UI with data received from the ViewModel.
User Input: Captures user gestures and triggers corresponding actions in the ViewModel.

1.2. ViewModel Layer

Responsibilities:

Acts as the bridge between the Data Layer (Model) and the View Layer.
Processes and exposes live data from the Data Layer for the View to display.
Manages the business logic, such as calculating animations and reacting to user input.

Key Tasks:

Data Transformation: Formats raw data into a usable structure for the View.

Real-time Updates: Publishes updates to the View based on incoming data.

Error Handling: Manages issues with data fetching and provides fallback options.

1.3. Data Layer (Model)

Responsibilities:

Fetches data from the backend (real-time shots, player stats, etc.).

Parses and structures raw data into our internal data models.

Handles data persistence and caching.

Key Tasks:

Network Communication: Connects to the backend to fetch live shot data.

Data Parsing: Converts raw data (e.g., JSON) into structured data models.

Data Caching: Stores data locally to minimize network requests.

1.4 UI Layer

The UI Layer presents the visual elements of the app that the user interacts with, displaying both static and dynamic content.

Updates the UI dynamically based on real-time data from the ViewModel and Rendering Layer.

1.4.1 Rendering Layer

Responsibilities:

Handles the 3D graphical rendering of all visual elements in the app, including the basketball court, player models, and shot trajectories.

Key Tasks:

3D Rendering: Renders the court, players, and shots in a 3D space using SceneKit.

Animation: Manages animations for shots, player movements, and other dynamic visual elements.

Camera Control: Adjusts the camera angle and zoom based on user interactions and data inputs.

1.4.2 View Layer

Responsibilities:

Displays static and dynamic content such as player statistics, shot data, visual representations of the basketball court, etc. while updating in real-time based on data from the ViewModel and Rendering Layer.

Key Tasks:

Renders static elements like the court layout and player avatars.
Dynamically update view eg: update View as new shot data and player positions arrive from the ViewModel.
Handles user gestures (e.g., tapping, rotating the view) and passes them to the ViewModel for further action.
Manages views like the SceneCourt, PlayersListView, and ShotChartView, which are populated with real-time data.

2. Data Flow and Interaction

The Data Layer fetches live shot data and passes it to the ViewModel.
The ViewModel processes the data and exposes it to the Rendering Layer via the Animation Coordinator.
The Rendering Layer visualizes the court and animations based on the data provided.

3. Performance Considerations & Fallbacks

60fps Rendering: The app is optimized for a smooth 60fps experience by minimizing draw calls, using GPU-friendly textures, and disabling physics for static elements.

Fallbacks for Low-End Devices:

Simplified Textures: Uses lower-resolution textures.

Reduced Effects: Disables particle effects to reduce GPU load.

Lower Frame Rates: Can drop to 30fps to maintain stability.

Reduced Complexity: Limits the number of animated objects to improve performance.

4. Testing Guidelines

Unit Tests: Implement unit tests to verify the data fetching logic, ViewModel updates, and utility functions.

UI Tests: Use UI tests to ensure that the user interface updates correctly with new data.

Mock Data: Use mock data to simulate backend responses and test real-time data handling.

5. Developer Guidelines

Code Style:
Follow standard Swift conventions (camelCase for variables, PascalCase for classes).
Use clear and descriptive names for variables, functions, and classes.
Break down complex logic into smaller, reusable functions.

Branching Strategy:
main: Stable code ready for production.

development: All new features and fixes are merged here first.

feature/<branch-name>: Create a feature branch for each task.

Commit Message Format:

Use a descriptive format, like:

[Feature] Implemented player movement animation
[Fix] Fixed bug in data parsing for shot model

