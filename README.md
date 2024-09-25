# kib_challenge

# Currency-Converter-App

## Table of Contents

1. [Project Overview](#project-overview)
2. [Instructions on How to Build the Project](#instructions-on-how-to-build-the-project)
3. [Environment Variables](#environment-variables)
4. [App Architecture and Design Pattern](#app-architecture-and-design-pattern)
    - [Chosen Design Pattern](#chosen-design-pattern)
    - [Justification](#justification)
5. [Image Loader Library](#image-loader-library)
    - [Chosen Image Loader](#chosen-image-loader)
    - [Justification](#justification)
6. [Database Used](#database-used)
    - [Chosen Database](#chosen-database)
    - [Justification](#justification)

--- 

## Project Overview

The **Currency Converter App** is a Flutter application that allows users to convert between
currencies and view historical exchange rate data. The app provides the following key features:

1. A list of supported currencies with their respective country flags. The data is fetched via an
   API and stored locally in a database after the first request for future use.
2. Historical exchange rate data between two selected currencies for the past 7 days.
3. A currency converter where users can select two currencies and input an amount to convert between
   them.

The app uses an `.env` file to securely store the API access key, ensuring sensitive information is
not exposed directly in the codebase.

The app ensures data persistence through a local database and provides a smooth, user-friendly
experience by minimizing API calls after initial data retrieval.


---

## Instructions on How to Build the Project

### Prerequisites

Ensure the following requirements are met:

- **Flutter SDK** (version 3.0.0 or higher)
- **Dart SDK**
- **Android Studio** or **Visual Studio Code** with Flutter extension installed
- A connected Android/iOS device or emulator

### Installation Steps

1. Clone this repository:
   ```bash
   git clone https://github.com/username/currency_converter_app.git
   cd currency_converter_app

2. Install the necessary dependencies
   ```bash
   flutter pub get

3. Run the app on a connected device or emulator:
   For Android or iOS:
   ```bash
   flutter run


---

## environment-variables

- This project uses a .env file to store sensitive information like the API access key. To run this
  project, you will need to create a .env file in the root directory with the following content:
  ```makefile
  ACCESS_KEY=your_access_key_here
  API_KEY=your_api_key_here

---

## app-architecture-and-design-pattern

#### chosen-design-pattern

- This app uses the BLoC (Business Logic Component) design pattern.

### justification

- The BLoC pattern was chosen because:

    * It separates business logic from the UI, leading to a cleaner and more maintainable codebase.
    * The unidirectional data flow makes the app easier to debug and test.
    * It helps manage state in a reactive way, which is ideal for a Flutter application where
      different UI components need to respond to changes in data seamlessly.

- In this app, BLoC is responsible for handling the currency conversion logic and fetching data from
  the API, while the UI simply reacts to the changes emitted by the BLoC.

---

## image-loader-library

### Chosen Image Loader

- The app uses cached_network_image to handle image loading and caching.

### justification

- cached_network_image was chosen because:

    * It provides efficient image caching, reducing the number of network calls, which improves the
      app's performance.
    * It offers robust error handling and placeholder images for scenarios where the image cannot be
      loaded.
    * The library integrates smoothly with Flutter and is easy to implement.

- This is particularly useful in a currency converter app where we may need to display flags or
  currency logos from remote sources.

---

## database-used

### Chosen Database

- The app uses Hive as the local database solution.

### justification

- Hive was chosen because:

    * It is lightweight and fast, which is essential for mobile apps with limited resources.
    * It supports key-value pair storage, making it easy to store and retrieve data such as
      recent conversions or cached exchange rates.
    * Hive is fully offline-capable, ensuring that the app can still function even when there is
      no network connection.

- Additionally, Hive’s simplicity in integrating with Flutter, without needing external
  dependencies, makes it the perfect choice for this project.