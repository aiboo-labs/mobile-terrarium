# Mobile Terrarium - Tamagotchi App

A Flutter-based Tamagotchi application where users feed and care for a virtual pet.

## Project Structure

The `lib/` folder is organized following Clean Architecture principles with clear separation of concerns:

### 📁 **main.dart**
- **Purpose:** Entry point of the application
- **Contains:** `MyApp` widget with app configuration and theme setup
- **Responsibility:** Initialize the app, set up Provider, and define routes
- **Note:** Should only contain app-level setup, NOT UI logic or widgets

### 📁 **models/**
- **Purpose:** Data models that represent business logic entities
- **Contains:** `Pet` class, `PetState` enum, etc.
- **Responsibility:** Define the structure and properties of your data
- **Example:** `Pet` has properties like `hunger`, `id`, `name`, etc.
- **Rule:** Models are **pure data** - no business logic methods that modify state

### 📁 **providers/**
- **Purpose:** State management and business logic layer
- **Contains:** `PetProvider` (extends `ChangeNotifier`)
- **Responsibility:** 
  - Manage the pet's state
  - Handle user actions (e.g., `feedPet()`)
  - Run game loops (e.g., hunger timer)
  - Notify UI of state changes
- **Pattern:** Uses Provider package for reactive state management

### 📁 **screens/**
- **Purpose:** Full-screen UI components
- **Contains:** `HomeScreen`, and other main screens
- **Responsibility:** 
  - Build the UI layout
  - Listen to provider changes
  - Handle user interactions
  - Display data from the provider
- **Example:** `HomeScreen` displays hunger level, timer, and feed button

### 📁 **widgets/**
- **Purpose:** Reusable UI components
- **Contains:** Smaller, composable widgets used across screens
- **Responsibility:** Encapsulate specific UI functionality
- **Example:** Could contain `PetAvatar`, `HungerBar`, `FeedButton`, etc.
- **Use when:** A UI piece is used multiple times or needs to be isolated

### 📁 **services/**
- **Purpose:** External services and integrations
- **Contains:** API calls, database operations, local storage, etc.
- **Responsibility:** Handle data persistence, network calls, third-party services
- **Currently Empty:** Will be used for features like saving/loading pet data

### 📁 **constants/**
- **Purpose:** App-wide constants and configuration
- **Contains:** Colors, strings, timeouts, magic numbers, etc.
- **Responsibility:** Single source of truth for hardcoded values
- **Example:** `const HUNGER_INCREASE_INTERVAL = 10`

### 📁 **utils/**
- **Purpose:** Helper functions and utilities
- **Contains:** Extension methods, formatters, validators, etc.
- **Responsibility:** Provide reusable utility functions
- **Example:** Could contain date formatting, hunger level calculations, etc.


## Getting Started

```bash
# Run the app
flutter run

# Build release
flutter build apk
```

For more Flutter resources, visit [flutter.dev](https://flutter.dev/)

