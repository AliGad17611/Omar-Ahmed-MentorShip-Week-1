# Smart Ahwa Manager
[![Ask DeepWiki](https://devin.ai/assets/askdeepwiki.png)](https://deepwiki.com/AliGad17611/Omar-Ahmed-MentorShip-Week-1)

A command-line application built with Dart for managing orders and generating reports for a coffee shop (an "Ahwa"). This project demonstrates principles of clean architecture, separating business logic from the user interface.

## Features

*   **Add New Orders:** Create new orders for customers, selecting from a predefined list of drinks.
*   **View Pending Orders:** Display a list of all orders that are currently in a 'Pending' state.
*   **Complete Orders:** Mark a pending order as 'Completed'.
*   **Cancel Orders:** Mark a pending order as 'Cancelled'.
*   **Generate Daily Reports:** A comprehensive report that includes:
    *   Order summary (total, completed, pending, cancelled).
    *   Total daily revenue from completed orders.
    *   Average order value.
    *   The most popular (most ordered) drink.
*   **Interactive CLI:** A simple, menu-driven command-line interface.

## Getting Started

### Prerequisites

*   [Dart SDK](https://dart.dev/get-dart) installed on your system.

### Running the Application

1.  **Clone the repository:**
    ```sh
    git clone https://github.com/aligad17611/omar-ahmed-mentorship-week-1.git
    cd omar-ahmed-mentorship-week-1
    ```

2.  **Get dependencies:**
    ```sh
    dart pub get
    ```

3.  **Run the application:**
    ```sh
    dart run bin/smart_ahwa_manger.dart
    ```

You will be greeted with a welcome message and a menu of available services.

## Project Structure

The project is organized to promote a clean separation of concerns:

-   `bin/smart_ahwa_manger.dart`: The main entry point of the application. It initializes and wires up all the necessary services and starts the main CLI loop.
-   `lib/`: Contains all the core application logic.
    -   `cli/`: Handles all command-line input and output. These files are responsible for presenting information to the user and capturing their responses.
    -   `interfaces/`: Defines the abstract classes (contracts) that decouple the core logic from the UI implementation. For example, `OrderInput` defines *how* to get order data, while `CliOrderInput` implements it for the command line.
    -   `models/`: Contains the data structures for the application, such as `Order`, `Drink`, and `OrderStatus`.
    -   `services/`: Encapsulates the business logic.
        -   `order_service.dart`: A singleton service that acts as the single source of truth for all order data.
        -   `report_service.dart`: Logic for calculating statistics and generating report data.
        -   `services.dart`: Defines the main user-facing services (e.g., `AddNewOrderService`) that the user can select from the main menu.

## Core Concepts

### Service-Oriented Design

Each primary action a user can take is encapsulated within a `Service` class (e.g., `AddNewOrderService`, `ShowReportService`). These services are managed in `bin/smart_ahwa_manger.dart` and presented to the user through the `WelcomeCli`. When a user selects an option, the `execute()` method of the corresponding service is called.

### Order Management

The `OrderService` uses a singleton pattern to ensure there's only one instance managing the list of all orders throughout the application's lifecycle. It provides methods to add orders and properties to retrieve lists of orders filtered by their status (Pending, Completed, Cancelled).

### Reporting

The `ReportService` consumes data from the `OrderService` to perform calculations. It computes total revenue, counts orders by status, and determines the most popular drink by analyzing the completed orders. This data is then formatted for display by `CliReportOutput`.
