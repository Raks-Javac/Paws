# Paws

A Flutter app that demonstrates how to create a dog image dashboard using the Dog API. This project is designed to show images of dogs based on different criteria, including random images by breed, images list by breed, random images by breed and sub-breed, and images list by breed and sub-breed.

## Table of Contents

1. [Getting Started](#getting-started)
2. [Project Structure](#project-structure)
3. [Dependencies](#dependencies)
4. [API Integration](#api-integration)
3. [UI Layer](#ui-layer)
4. [Unit Tests](#unit-tests)
<!-- 5. [End-to-End (E2E) Tests](#end-to-end-e2e-tests)
6. [Code Coverage](#code-coverage) -->

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
    /shared: for all round widgets, where widgets naming starts with "PawWidgets.." which makes it easy to get reusable widgets.
    /res: contains the app resources just like native development where the /res folder contains the styles, strings, assets and theme used in the app.

##  Dependencies


   - flutter: The Flutter SDK.
   - provider: For state management and view models.
   - http: For making HTTP requests to the Dog API.
   - flutter_screenutil: for responsive styling 
   - flutter_svg: for svgs and icon management in the app
   - lottie: for loading lottie animations
   - cached_network_image: for each loading of images and image loading optimization
   - shimmer: for loading animations
   - flutter_launcher_icons: for setting the app icon easily without having to go into the native folders


## API Integration


The network layer interacts with the Dog API to fetch dog images. API endpoints are defined in the DogAPI class in the lib/src/core/network/network_service.dart file and all the urls used in the app registered in AppUrls class 

    
## Unit Tests

The unit test for each class independently created is in the /test folder where each test is in their respective test || main folder E.g for network class test , (Its main folder is lib/src/core/network/network_service.dart while its test folder is test/src/core/network/network_service_test.dart)





