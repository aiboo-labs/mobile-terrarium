# Mobile Terrarium - Tamagotchi App

A Flutter-based Tamagotchi application where users feed and care for a virtual pet.

## Project Structure

The `lib/` folder follows Clean Architecture with clear separation of concerns:

| Folder | Purpose |
|--------|---------|
| **main.dart** | App entry point and setup |
| **models/** | Data models (Pet, PetState, etc.) |
| **providers/** | State management and business logic (PetProvider) |
| **screens/** | Full-screen UI components (HomeScreen) |
| **widgets/** | Reusable UI components |
| **services/** | External services (API, database, storage) |
| **constants/** | App-wide constants and configuration |
| **utils/** | Helper functions and utilities |


## Getting Started

```bash
# Run the app
flutter run

# Build release
flutter build apk
```

For more Flutter resources, visit [flutter.dev](https://flutter.dev/)


