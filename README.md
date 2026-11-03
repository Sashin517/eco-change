# EcoChange - Smart Waste Management System

## 🎯 Overview

A gamified, cross-platform mobile application designed to modernize urban waste and e-waste collection. EcoChange bridges the gap between citizens and waste management authorities through real-time truck tracking, interactive disposal guides, automated complaint ticketing, and a token-reward system to incentivize eco-friendly habits. Built with Flutter, Dart, and powered by Firebase.

---

## 📦 Project Architecture

### 1. Core Application (`/lib`)
- `main.dart` - Application entry point, initializing Firebase and global Providers.
- `colors.dart` - Centralized design system and theme palette.
- `firebase_options.dart` - Auto-generated FlutterFire configuration.

### 2. UI & Views (`/lib/pages`)
- `home.dart` - Main navigation wrapper (BottomNavigationBar).
- `start.dart` - Dynamic user dashboard with Eco-goals, progress rings, and live notifications.
- `location-picker.dart` & `status.dart` - OpenStreetMap integrations for live tracking and bin mapping.
- `complaint.dart` - User ticketing interface for reporting missed trucks or bin issues.

### 3. Business Logic & Services (`/lib/services`)
- `auth.dart` - Firebase Authentication service handling login/signup flows.
- `database.dart` - Cloud Firestore service managing real-time streams for user data, complaints, and notices.

### 4. Data Models (`/lib/models`)
- `user.dart`, `complaint.dart`, `notice.dart` - Strongly typed Dart classes for Firestore document mapping.

---

## 🚀 How to Run Locally

You need the [Flutter SDK](https://docs.flutter.dev/get-started/install) installed, plus an emulator (Android/iOS) or a physical device.

### 🗄️ Firebase Setup

Firebase configuration files containing API keys are normally ignored by Git. To run this project locally, link your own Firebase project:

1. Create a project in the [Firebase Console](https://console.firebase.google.com/).
2. Enable **Authentication** (Email/Password) and **Cloud Firestore**.
3. Install the CLIs and generate the configuration:

```bash
npm install -g firebase-tools
dart pub global activate flutterfire_cli
firebase login
flutterfire configure
```

4. Place the native config files (if not generated automatically):
   - **Android**: `google-services.json` → `android/app/`
   - **iOS**: `GoogleService-Info.plist` → `ios/Runner/`

> **Note:** The repository includes a development `firebase_options.dart`, but native configuration files are required for a full build.

### Step 1: Install Dependencies

```bash
cd eco_change
flutter pub get
```

### Step 2: Run the Application

Make sure your emulator is running or your phone is connected with USB Debugging enabled, then:

```bash
flutter run
```

Press `r` in the terminal to hot-reload changes during development.

---

## 🔄 Complete User Flow

### 1. Authentication
- User opens the app and is greeted by a clean login/signup interface.
- Secure email/password authentication is processed via Firebase Auth.
- A unique "Eco ID" is generated for new users.

### 2. Dashboard & Gamification
- The Home view pulls live data via Provider streams.
- Users view their "7 Days Eco Goal" and track waste disposal weight through an animated circular progress indicator.

### 3. Live Mapping & Geolocation
- Using `geolocator` and `flutter_map`, the app checks the user's current Plus Code and coordinates.
- Users can view real-time locations of garbage trucks and nearby disposal bins on an interactive OpenStreetMap.

### 4. Rewards & Feedback
- **Redeem:** Users convert earned Eco-coins into discount coupons (e.g., Cargills, Keells).
- **Complaints:** Users can file specific tickets (Truck, Bin, Coupon) with descriptions, updating Firestore instantly.

---

## 🎨 Key Features

### ✅ Cross-Platform Architecture
A single, unified Dart codebase compiles natively to both iOS and Android, ensuring consistent UI/UX across devices.

### ✅ Real-Time Cloud Synchronization
Leverages Cloud Firestore and Provider state management to instantly reflect point updates, complaint status changes, and administrative notices without manual refreshing.

### ✅ Interactive Open-Source Mapping
Implements `flutter_map` with OpenStreetMap tiles, bypassing expensive Google Maps API costs while delivering high-performance geospatial tracking.

### ✅ Modern, Gamified UI
Built with a custom design system using `font_awesome_flutter` and `percent_indicator` to create an engaging, visually rewarding experience for citizens.

---

## 🔧 Tech Stack Reference

- **Frontend Framework:** Flutter, Dart
- **State Management:** Provider (`MultiProvider`, `StreamProvider`)
- **Backend & Database:** Firebase Auth, Cloud Firestore (NoSQL)
- **Mapping & Location:** `flutter_map` (OpenStreetMap), `geolocator`, `geocoding`, `latlong2`
- **UI Components:** `font_awesome_flutter`, `fluttertoast`, `percent_indicator`

---

## 🚨 Common Issues & Solutions

### Issue: "Missing google-services.json" during Android build
**Solution:** Download `google-services.json` from the Firebase Console (Project Settings > General) and place it at `eco_change/android/app/google-services.json`.

### Issue: `[core/no-app] No Firebase App '[DEFAULT]' has been created`
**Solution:** Make sure `main.dart` initializes Firebase before `runApp`:

```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}
```

### Issue: "Location permissions are denied"
**Solution:** The app requires location services to map trucks. Go to Settings > Apps > EcoChange > Permissions and allow Location access.

### Issue: Podfile out of date (iOS build failure)
**Solution:** On a Mac, update your CocoaPods dependencies:

```bash
cd ios
pod repo update
pod install
```

---

## 📈 Future Enhancements

1. **IoT Hardware Integration**
   Connect the app to smart bins with weight sensors to automatically update the user's "Waste Weight" and distribute Eco-coins via Bluetooth/Wi-Fi.

2. **Push Notifications**
   Implement Firebase Cloud Messaging (FCM) to alert users when a scheduled garbage truck is within a 1 km radius.

3. **Advanced Routing for Drivers**
   Create a secondary "Driver View" app that optimizes collection routes based on real-time bin capacity data.

---

## 📄 License

Created by Sashin Deemantha. All rights reserved.
