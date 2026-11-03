# EcoChange - Smart Waste Management System

## 🎯 Overview

A gamified, cross-platform mobile application designed to modernize urban waste and e-waste collection. EcoChange bridges the gap between citizens and waste management authorities through real-time truck tracking, interactive disposal guides, automated complaint ticketing, and a token-reward system to incentivize eco-friendly habits. Built with Flutter, Dart, and powered by Firebase.

## 📦 Project Architecture

### 1. **Core Application (`/lib`)**
- `main.dart` - Application entry point, initializing Firebase and global Providers.
- `colors.dart` - Centralized design system and theme palette.
- `firebase_options.dart` - Auto-generated FlutterFire configuration.

### 2. **UI & Views (`/lib/pages`)**
- `home.dart` - Main navigation wrapper (BottomNavigationBar).
- `start.dart` - Dynamic user dashboard with Eco-goals, progress rings, and live notifications.
- `location-picker.dart` & `status.dart` - OpenStreetMap integrations for live tracking and bin mapping.
- `complaint.dart` - User ticketing interface for reporting missed trucks or bin issues.

### 3. **Business Logic & Services (`/lib/services`)**
- `auth.dart` - Firebase Authentication service handling login/signup flows.
- `database.dart` - Cloud Firestore service managing real-time streams for user data, complaints, and notices.

### 4. **Data Models (`/lib/models`)**
- `user.dart`, `complaint.dart`, `notice.dart` - Strongly typed Dart classes for Firestore document mapping.

---

## 🚀 How to Run Locally

To run this application, you need the Flutter SDK installed on your machine along with an emulator (Android/iOS) or a connected physical device.

### 🗄️ Firebase Setup

The Firebase configuration files containing sensitive API keys are normally ignored by Git. To run this project locally, ensure you have the required Firebase credential files linked to your environment.

1. **Android**: Ensure `google-services.json` is placed inside the `android/app/` directory.
2. **iOS**: Ensure `GoogleService-Info.plist` is placed inside the `ios/Runner/` directory.
*(Note: The current repository includes a development `firebase_options.dart`, but native configuration files are required for full build compilation).*

### Step 1: Install Dependencies

1. Open a terminal and navigate to the project root folder:
   
```bash
   cd eco_change
