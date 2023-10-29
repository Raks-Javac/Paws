# Paws

A Flutter app that demonstrates how to create a dog image dashboard using the Dog API. This project is designed to show images of dogs based on different criteria, including random images by breed, images list by breed, random images by breed and sub-breed, and images list by breed and sub-breed.

## Table of Contents

1. [Getting Started](#getting-started)
2. [Project Structure](#project-structure)
3. [Dependencies](#dependencies)
4. [API Integration](#api-integration)
5. [Repository Layer](#repository-layer)
6. [View Model (Provider)](#view-model-provider)
7. [UI Layer](#ui-layer)
8. [Unit Tests](#unit-tests)
9. [End-to-End (E2E) Tests](#end-to-end-e2e-tests)
10. [Code Coverage](#code-coverage)

## Getting Started

1. **Clone the Repository:**

   ```bash
   git clone https://github.com/yourusername/dog_dashboard_app.git
   cd dog_dashboard_app

2. **Install Dependencies:**

   ```
   flutter pub get

3. **Run the App:**

   ```
   flutter run
   
## Project Structure


The project follows a structured architecture that includes different layers:

    /network: Handles API requests using the http package.
    /repository: Manages data access, interacting with the network layer.
    /data: Contains the data models
    /controller: Provides data to the UI and manages app state using the provider package.
    /presenter || /presentation: Contains the UI components and the main view where it contains a subfolder "/widgets" for widgets only related to that feature