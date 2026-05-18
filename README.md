# Travel & Event Planner

### Flutter Apprentice — Final Project

Travel & Event Planner is a Flutter application for planning trips and events with friends.  
The project is built using the concepts from **Flutter Apprentice, 4th Edition**.

The app includes authentication, trip management, place search, collaborative planning, theme settings, local storage, Firebase integration, and clean navigation.

---

## Project Overview

This application allows users to:

- Register and log in using Firebase Authentication
- Create and manage trips
- View trip details
- Search for places and attractions
- Open map-related place information
- Invite collaborators to a trip
- Store trip data locally using Drift / SQLite
- Use Firebase Firestore for collaborative data
- Switch between light and dark themes
- Navigate between screens using go_router

---

## Features

| Feature | Flutter Apprentice Chapter | Technology |
|--------|----------------------------|------------|
| Authentication | Chapter 16 | Firebase Auth |
| Firestore collaboration | Chapter 16 | Cloud Firestore |
| Trip management | Chapter 15 | Drift / SQLite |
| Local database | Chapter 15 | Drift |
| Networking | Chapter 12 | Chopper |
| Place search | Chapter 12 | Google Places API |
| JSON models | Chapter 11 | Freezed + json_serializable |
| Navigation | Chapters 8-9 | go_router |
| State management | Chapter 13 | Riverpod |
| Theme settings | Chapter 10 | SharedPreferences |
| Search UI | Chapter 5 | ListView / GridView |
| Sliver UI | Chapter 6 | CustomScrollView, SliverAppBar, SliverList, SliverGrid |
| Maps | Additional feature | google_maps_flutter |

---

## Team Responsibilities

| Participant | Responsibility |
|------------|----------------|
| Nurai | Architecture, Riverpod state management, go_router navigation, JSON models |
| Ayaulym | Networking with Chopper, local database with Drift / SQLite, repositories |
| Ulnaz | Firebase Auth, Firestore, main UI screens, Slivers |
| Moldir | Search UI, Maps, Settings, README |

---

## Technologies Used

- Flutter
- Dart
- Firebase Core
- Firebase Authentication
- Cloud Firestore
- Riverpod
- go_router
- Chopper
- Drift
- SQLite
- SharedPreferences
- Freezed
- json_serializable
- Google Maps Flutter
- Google Places API

---

## Project Architecture

The project follows **Clean Architecture**.

The code is separated into:

- `presentation` — UI screens and widgets
- `domain` — models and abstract repositories
- `data` — repository implementations, API services, database logic
- `core` — shared constants and theme files
- `app` — app setup and routing

This structure keeps business logic away from the UI and makes the project easier to maintain.

---

## Folder Structure

```text
lib/
├── main.dart
├── firebase_options.dart
├── app/
│   ├── app.dart
│   └── router/
│       └── app_router.dart
├── core/
│   ├── constants/
│   │   └── api_constants.dart
│   └── theme/
│       ├── app_theme.dart
│       └── theme_provider.dart
├── features/
│   ├── auth/
│   │   ├── data/
│   │   │   └── auth_repository_impl.dart
│   │   ├── domain/
│   │   │   └── auth_repository.dart
│   │   └── presentation/
│   │       ├── login_screen.dart
│   │       └── auth_provider.dart
│   ├── trips/
│   │   ├── data/
│   │   │   ├── local/
│   │   │   │   └── app_database.dart
│   │   │   └── trip_repository_impl.dart
│   │   ├── domain/
│   │   │   ├── trip_model.dart
│   │   │   └── trip_repository.dart
│   │   └── presentation/
│   │       ├── home_screen.dart
│   │       ├── trip_detail_screen.dart
│   │       └── trips_provider.dart
│   ├── places/
│   │   ├── data/
│   │   │   ├── places_api_service.dart
│   │   │   ├── places_repository_impl.dart
│   │   │   └── spoonacular_converter.dart
│   │   ├── domain/
│   │   │   ├── place_model.dart
│   │   │   └── places_repository.dart
│   │   └── presentation/
│   │       ├── places_provider.dart
│   │       ├── search_screen.dart
│   │       └── map_screen.dart
│   └── collaborative/
│       ├── data/
│       │   └── firestore_repo_impl.dart
│       ├── domain/
│       │   └── collab_repository.dart
│       └── presentation/
│           ├── collab_provider.dart
│           └── collab_screen.dart
Main Screens
Login Screen

The login screen allows users to:

Sign in with email and password
Register a new account
Navigate to the home screen after successful authentication

Technology used:

Firebase Auth
Riverpod
TextField
FilledButton
Home Screen

The home screen displays the user's trips.

Main features:

Trip list
Add new trip dialog
Delete trip action
Theme toggle
Logout button
Navigation to trip details

Flutter widgets used:

Scaffold
CustomScrollView
SliverAppBar
SliverList
SliverGrid
SliverToBoxAdapter
FloatingActionButton
Trip Detail Screen

The trip detail screen displays detailed information about a selected trip.

Main features:

Trip title
Destination
Date
Members
Budget
Planned schedule
Search places action
Collaboration action

Flutter widgets used:

CustomScrollView
SliverAppBar
FlexibleSpaceBar
SliverList
SliverGrid
SliverToBoxAdapter
Card
ListTile
Search Screen

The search screen allows users to search for places.

Main features:

Search input
Place results
Loading state
Error state
Empty state
Grid/List based result layout

Technology used:

Chopper
Google Places API
Riverpod FutureProvider.family
GridView
ListView
Collaboration Screen

The collaboration screen allows users to manage trip collaborators.

Main features:

Add collaborator by email
View collaborator list
Remove collaborator
Real-time updates from Firestore

Technology used:

Cloud Firestore
Riverpod StreamProvider
ListView
Map Screen

The map screen displays place location information.

Technology used:

google_maps_flutter
GoogleMap
Marker
CameraPosition
Firebase Setup

This project uses Firebase for authentication and collaborative data.

Required Firebase services

Enable the following services in Firebase Console:

Firebase Authentication
Email/Password sign-in method
Cloud Firestore
Firebase CLI setup

Install Firebase CLI:

npm install -g firebase-tools

Login to Firebase:

firebase login

Activate FlutterFire CLI:

dart pub global activate flutterfire_cli

Configure Firebase:

flutterfire configure --project=travel-planner-94220

This command generates:

lib/firebase_options.dart

Do not edit firebase_options.dart manually.

Google Places API Setup

The project uses Google Places API for place search.

Open:

lib/core/constants/api_constants.dart

Add your API key:

class ApiConstants {
  static const String googleApiKey = 'YOUR_GOOGLE_PLACES_API_KEY';
  static const String baseUrl = 'https://maps.googleapis.com/maps/api/';
}

Important:

Replace YOUR_GOOGLE_PLACES_API_KEY with a real API key.
The key should be created in Google Cloud Console.
Google Places API must be enabled for the key.
Installation and Running
1. Clone the repository
git clone https://github.com/mollesskin/travel_planner.git
2. Open the project folder
cd travel_planner
3. Install dependencies
flutter pub get
4. Configure Firebase
flutterfire configure --project=YOUR_FIREBASE_PROJECT_ID
5. Add Google Places API key

Open:

lib/core/constants/api_constants.dart

Then add your Google Places API key.

6. Generate required files

Run:

dart run build_runner build --delete-conflicting-outputs

This command generates files for:

Freezed models
JSON serialization
Chopper API service
Drift database

Generated files include:

trip_model.freezed.dart
trip_model.g.dart
place_model.freezed.dart
place_model.g.dart
places_api_service.chopper.dart
app_database.g.dart
7. Run the app
flutter run

If multiple devices are available, choose Chrome, Windows, Android emulator, or another supported device.

Build Commands

Install dependencies:

flutter pub get

Generate code:

dart run build_runner build --delete-conflicting-outputs

Watch code generation:

dart run build_runner watch --delete-conflicting-outputs

Run the project:

flutter run

Clean project:

flutter clean

Analyze code:

flutter analyze

Run tests:

flutter test
Android Configuration

For Firebase support, Android minimum SDK should be at least 21.

Open:

android/app/build.gradle

Check:

android {
    defaultConfig {
        minSdk 21
        targetSdk 34
        multiDexEnabled true
    }
}
State Management

The project uses Riverpod.

Main Riverpod patterns:

Provider
StateProvider
StateNotifierProvider
StreamProvider
FutureProvider.family

Examples:

final tripsAsync = ref.watch(tripsStreamProvider);
ref.read(tripsNotifierProvider.notifier).addTrip(title, destination);
final isDark = ref.watch(themeProvider);
Navigation

The project uses go_router for declarative navigation.

Main routes:

Route	Screen
/login	Login Screen
/home	Home Screen
/home/trip/:tripId	Trip Detail Screen
/home/trip/:tripId/search	Search Screen
/home/trip/:tripId/collab	Collaboration Screen

Navigation examples:

context.go('/home');
context.go('/home/trip/${trip.id}');
context.push('/home/trip/$tripId/search');
context.push('/home/trip/$tripId/collab');
Local Database

The project uses Drift with SQLite for local trip storage.

Main database file:

lib/features/trips/data/local/app_database.dart

Main tables:

Trips
TripEvents

The database supports:

Insert trip
Update trip
Delete trip
Watch all trips as a stream
Store planned events for trips
Networking

The project uses Chopper for API networking.

Main API service:

lib/features/places/data/places_api_service.dart

Main repository:

lib/features/places/data/places_repository_impl.dart

The networking layer supports:

Searching places
Getting place details
Converting API response into app models
Authentication

Firebase Authentication is used for user login and registration.

Main files:

lib/features/auth/domain/auth_repository.dart
lib/features/auth/data/auth_repository_impl.dart
lib/features/auth/presentation/login_screen.dart

Supported actions:

Login
Register
Logout
Get current user ID
Listen to auth state changes
Firestore Collaboration

Cloud Firestore is used for collaborative trip planning.

Main files:

lib/features/collaborative/data/firestore_repo_impl.dart
lib/features/collaborative/domain/collab_repository.dart
lib/features/collaborative/presentation/collab_screen.dart
lib/features/collaborative/presentation/collab_provider.dart

Supported actions:

Add collaborator
Remove collaborator
Watch collaborators in real time
Theme Settings

The app supports light and dark themes.

Technology used:

SharedPreferences
Riverpod StateNotifierProvider

Main files:

lib/core/theme/app_theme.dart
lib/core/theme/theme_provider.dart

The selected theme is saved locally and restored when the app starts again.

Code Generation

This project uses generated files.

Code generation is required for:

Freezed models
JSON serialization
Chopper API client
Drift database

Run this command after editing models, API services, or database files:

dart run build_runner build --delete-conflicting-outputs
Linting

The project uses Flutter lints.

Main file:

analysis_options.yaml

Recommended lint rules:

include: package:flutter_lints/flutter.yaml

linter:
  rules:
    - prefer_const_constructors
    - prefer_const_literals_to_create_immutables
    - avoid_print
    - use_key_in_widget_constructors
    - avoid_unnecessary_containers
    - prefer_final_locals
    - unnecessary_const
Git Workflow

Recommended workflow:

git checkout -b feature/participant-name

After changes:

git add .
git commit -m "your commit message"
git push origin feature/participant-name

Then open a Pull Request and merge into main.

Suggested Commit Messages

Participant 1:

git commit -m "feat(p1): setup clean architecture and go_router routes"
git commit -m "feat(p1): add riverpod providers and shared prefs theme"
git commit -m "feat(p1): add freezed models and json serialization"

Participant 2:

git commit -m "feat(p2): add chopper places api service"
git commit -m "feat(p2): add drift schema and local database"
git commit -m "feat(p2): add trip repository implementation"

Participant 3:

git commit -m "feat(p3): add firebase auth and login screen"
git commit -m "feat(p3): add home screen and stream provider"
git commit -m "feat(p3): add trip detail screen with slivers"
git commit -m "feat(p3): add firestore collaboration support"

Participant 4:

git commit -m "feat(p4): add search screen with gridview"
git commit -m "feat(p4): add maps integration"
git commit -m "feat(p4): add settings with shared preferences"
git commit -m "docs(p4): add README and demo video link"
Demo Video

Demo video link:

LINK_TO_VIDEO

Replace LINK_TO_VIDEO with the final screen-recording video link.

The demo should show:

Login or registration
Home screen
Creating a trip
Opening trip details
Search screen
Collaboration screen
Theme toggle
Logout
Grading Criteria
Criterion	Requirement	Weight
Functionality	Firebase, Drift, Chopper working; routes load real data	40%
Code Quality	Clean Architecture, Riverpod correctly used, linting passes, no logic in UI	30%
UX / UI	Slivers, GridView, loading/error states, responsive layout	20%
Documentation	README with setup steps and screen-recording demo	10%
Troubleshooting
Problem: Generated files are missing

Run:

dart run build_runner build --delete-conflicting-outputs
Problem: Firebase does not work

Check:

lib/firebase_options.dart exists
Firebase project is configured
Email/Password authentication is enabled
Firestore database is created
Android minSdk is at least 21
Problem: Google Places search does not work

Check:

API key is added in api_constants.dart
Google Places API is enabled
Billing is enabled in Google Cloud Console if required
Internet connection is available
Problem: App does not run after dependency changes

Run:

flutter clean
flutter pub get
flutter run
Problem: Route does not open

Check routes in:

lib/app/router/app_router.dart

Main routes should include:

/login
/home
/home/trip/:tripId
/home/trip/:tripId/search
/home/trip/:tripId/collab
Final Checklist

Before submission, check that:

 Project runs without compile errors
 Firebase is configured
 Login works
 Registration works
 Logout works
 Home screen opens
 Trips can be created
 Trips can be deleted
 Trip detail screen opens
 Slivers are used
 Search screen opens
 Collaboration screen opens
 Theme toggle works
 Generated files are created
 README is complete
 Demo video link is added
Authors

Team of 4.

Nurai — Architecture, State Management, Navigation, Models
Ayaulym — Networking, Local Database, Repositories
Ulnaz — Firebase, Main UI Screens, Slivers
Moldir — Search UI, Maps, Settings, README
License

This project was created for educational purposes as a Flutter Apprentice final project.

A few resources to get you started if this is your first Flutter project:

- [Learn Flutter](https://docs.flutter.dev/get-started/learn-flutter)
- [Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Flutter learning resources](https://docs.flutter.dev/reference/learning-resources)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
