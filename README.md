# Farm Mate App - Components & Features

**Farm Mate** is a Flutter-based mobile app designed to connect farmers with businesses, enabling them to sell crops directly to buyers. Below is a breakdown of the various components and features used in the app:

---

## 1. **Flutter SDK**

Flutter is the primary framework used for building the app. It provides a fast and efficient way to develop natively compiled applications for mobile, web, and desktop from a single codebase.

- **Why Flutter?**  
  Flutter allows for cross-platform development, enabling the app to run on both Android and iOS with a single codebase.
  
---

## 2. **Firebase Integration**

Firebase is used for backend services in **Farm Mate**. It provides real-time databases, authentication, cloud storage, and other services that make it easier to develop the app.

- **firebase_core**: Initializes Firebase for use within the app.
- **firebase_auth**: Handles user authentication, allowing users (farmers and businesses) to sign up, log in, and manage accounts securely.
- **cloud_firestore**: Used for real-time cloud data storage, enabling farmers and buyers to interact with data that updates in real-time.

---





---

## 3. **Geolocation Services**

The app leverages location-based features to connect farmers and businesses based on proximity.

- **geolocator**: Used to get the current location of the device. This is essential for showing farmers' locations to businesses and vice versa.
- **geocoding**: Converts geographic coordinates (latitude, longitude) into human-readable addresses. This helps in displaying location information.

---

## 4. **Weather Updates with Animations**

**Farm Mate** integrates real-time weather updates to help farmers check the weather conditions for their area.

- **weather_animation**: This package fetches weather data and provides animated weather effects, such as sunny or rainy weather. The animations enhance the user experience by visually representing the weather conditions, such as displaying clouds for sunny weather or rain animations for rainy weather.

---

## Features

### 1. **Farmer Dashboard**
The **Farmer Dashboard** provides farmers with a comprehensive interface to manage their crops. Farmers can:
- **Add crops**: Input information about their crops, including the type, quantity, and price.
- **View crop availability**: See their crops listed in a view that businesses can browse.
- **Manage listings**: Update or delete their crop listings as needed.

### 2. **Buyer Dashboard**
The **Buyer Dashboard** is designed for businesses (buyers) to browse available crops. Buyers can:
- **View available crops**: Browse a list of crops from different farmers.
- **Make purchases**: Contact the farmer or place orders for crops.

### 3. **User Authentication**
The app uses **Firebase Authentication** to securely manage user logins. Both farmers and businesses can:
- **Create an account**: Sign up using email and password.
- **Login**: Log in with their credentials to access their respective dashboards.
- **Logout**: Sign out from the app to protect their account.


### 4. **Geolocation Features**
The app uses the **Geolocator** and **Geocoding** packages to provide:
- **Location-based services**: Farmers can provide their location for business buyers to view, making it easier to connect based on geographical proximity.
- **Location tracking**: The app tracks user locations to show relevant crop listings nearby.

### 5. **Weather Updates**
- **Weather Animations**: The app integrates weather updates with the **weather_animation** package. Users can see weather information and forecasts, which is helpful for farmers to know about conditions that might affect their crops.

---

## Full-Stack Features

- **Backend**: Firebase is used for user authentication, real-time data storage, and retrieval of crop listings. It also handles storing and managing user data for both farmers and businesses.
- **Frontend**: The app is built using Flutter, which provides a responsive and visually appealing interface that runs seamlessly on both iOS and Android devices.
- **Real-Time Updates**: Crop data is synchronized in real time across all devices using Firebase Firestore. Any updates made by farmers are immediately reflected in the buyer’s dashboard.

---


<img src="https://github.com/user-attachments/assets/3eeb57e6-6ca3-429d-8393-603353da3d64" width="200"/>
<img src="https://github.com/user-attachments/assets/931cfd77-4b2e-456f-8008-c2e51df4e881" width="200"/>
<img src="https://github.com/user-attachments/assets/d52d4176-b2f0-40b3-8a3f-fe0e5efc588f" width="200"/>
<img src="https://github.com/user-attachments/assets/18d93caa-1dc3-4884-9ff0-7368e214906c" width="200"/>
<img src="https://github.com/user-attachments/assets/7ee20d3c-9305-44b5-8787-90e000b66977" width="200"/>
<img src="https://github.com/user-attachments/assets/c697c1d2-e079-49e4-85c2-1edcb6e884aa" width="200"/>
<img src="https://github.com/user-attachments/assets/6e27f605-ebd0-4580-9a77-69fee9242a04" width="200"/>
<img src="https://github.com/user-attachments/assets/d0f696a2-e08b-4e39-a740-154d7f7bae0e" width="200"/>
<img src="https://github.com/user-attachments/assets/3e66924c-3f8c-4f03-bf75-89ad3296711e" width="200"/>
<img src="https://github.com/user-attachments/assets/290dabde-7cb4-4e26-871f-db778df92b06" width="200"/>
<img src="https://github.com/user-attachments/assets/8a5bc440-c4ec-4160-a462-cada68f5450e" width="200"/>
<img src="https://github.com/user-attachments/assets/f7c35e79-ab2a-4592-be32-2cc74dc5f3fe" width="200"/>
<img src="https://github.com/user-attachments/assets/e87efdc4-f7d9-4815-8897-aae5feef0c61" width="200"/>

























---
## **Installation Guide**
### **Prerequisites**
Ensure you have the following installed:
- **Flutter** (Version 3.5.4 or higher)
- **Dart SDK**
- **Android Studio** or **Visual Studio Code**
- **Xcode** (for iOS development on macOS)
- **Git**
- **Firebase Account**

[Flutter Installation Guide](https://flutter.dev/docs/get-started/install)

### **Step 1: Clone the Repository**
```bash
git clone https://github.com/yourusername/farmmate.git
cd farmmate
```

### **Step 2: Install Dependencies**
```bash
flutter pub get
```

### **Step 3: Set Up Weather API**
1. Sign up for an API key at [OpenWeatherMap](https://openweathermap.org/).
2. Navigate to `lib/ApiKey.dart` and replace the placeholder:
```dart
const String apiKey = 'YOUR_API_KEY_HERE';
```

---
## **Firebase Setup**
### **Overview**
The *Farm Mate* app uses Firebase for:
1. **User Authentication**
2. **Firestore Database**

### **Firebase Authentication**
#### **Setup in Firebase Console**
1. Go to the **Firebase Console**.
2. Navigate to the **Authentication** tab.
3. Enable **Email/Password Authentication**.

#### **Dependencies**
```yaml
dependencies:
  firebase_auth: ^3.3.4
```

#### **Initialization**
```dart
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
```

#### **Sign Up Function**
```dart
Future<User?> signUp(String email, String password) async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    return userCredential.user;
  } catch (e) {
    print("Error: $e");
    return null;
  }
}
```

#### **Login Function**
```dart
Future<User?> signIn(String email, String password) async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    return userCredential.user;
  } catch (e) {
    print("Error: $e");
    return null;
  }
}
```

---
## **Firestore Database**
### **Setup in Firebase Console**
1. Go to **Firestore Database** in Firebase Console.
2. Create collections: `farmers`, `buyers`, `crops`.

### **Dependencies**
```yaml
dependencies:
  cloud_firestore: ^3.1.5
```

### **Add User Data (Farmers/Buyers)**
```dart
FirebaseFirestore firestore = FirebaseFirestore.instance;

Future<void> addUserData(String userId, String collection, Map<String, dynamic> data) async {
  try {
    await firestore.collection(collection).doc(userId).set(data);
  } catch (e) {
    print("Error: $e");
  }
}
```

### **Add Crop Data**
```dart
Future<void> addCropData(String cropId, Map<String, dynamic> cropData) async {
  try {
    await firestore.collection('crops').doc(cropId).set(cropData);
  } catch (e) {
    print("Error: $e");
  }
}
```

### **Fetch Crop Data**
```dart
Future<QuerySnapshot> getCrops() async {
  return await firestore.collection('crops').get();
}
```


---
## **Contributing**
1. Fork the repository.
2. Create a new branch (`git checkout -b feature-branch`).
3. Commit your changes (`git commit -m 'Add new feature'`).
4. Push to the branch (`git push origin feature-branch`).
5. Open a pull request.

---
## **License**
This project is licensed under the MIT License.

---
## **Contact**
For queries or collaborations, contact **amoghreddykb1@gmail.com**.

---
### **Happy Coding! 🚀**
