# USG Hackathon Mobile

Welcome to our MUSG Hackathon Mobile project, a cutting-edge Flutter application designed to deliver a seamless and intuitive user experience. This project is part of the USG APEK Hackathon, showcasing innovative solutions and engaging interfaces.

## Table of Contents

- [Introduction](#introduction)
- [Project Structure](#project-structure)
- [Getting Started](#getting-started)
- [Dependencies](#dependencies)


## Introduction

This mobile app is crafted with the goal of solving life insurance and telecommunication industry provlems. Utilizing Flutter, it offers cross-platform compatibility, ensuring a broad reach.

## Project Structure

The project is structured for scalability, maintainability, and ease of navigation. Here's an overview of the `lib/` directory, which houses the core of our application:

- lib/
- ├── src/
- │   ├── app/
- │   │   ├── provider/ - State management and business logic.
- │   │   └── view/ - UI components for views and pages.
- │   │
- │   ├── core/
- │   │   ├── constants/ - Defines constants including colors, text styles, and configurations.
- │   │   └── utils/ - Utility functions and helpers.
- │   │
- │   └── features/ - Modular features of the app, each encapsulating a specific functionality.
- │
- └── main.dart - Entry point of the application.



### Key Directories:

- **`app/`**: Contains the UI and business logic separation. It includes providers for state management and views for the application's screens.
- **`core/`**: Holds core functionalities, constants for UI consistency, and utility functions for common tasks.
- **`features/`**: Feature-specific code is organized here, promoting modularity and ease of feature toggling.

## Getting Started

To get a local copy up and running, follow these simple steps:

1. Clone the repo
   ```sh
   git clone https://github.com/USG-APEK-Hackathon/Mobile.git

2. cd Mobile - go to root directory of project

3. flutter pub get - Install dependecies

4. flutter run - Run the project (Any emulator, Simulator or connected debug Device needed.)

Dependencies
This project leverages the following key dependencies:

Flutter - The UI toolkit for building natively compiled applications.
Dio - A powerful HTTP client for Dart.
Riverpod - State management solution that's easy to understand and scalable.

### Dependencies
This project leverages the following key dependencies:
- Flutter - The UI toolkit for building natively compiled applications.
- Dio - A powerful HTTP client for Dart.
- Riverpod - State management solution that's easy to understand and scalable.
- AutoRoute - Make Navigation 2.0 faster and Easy with Code Generation






