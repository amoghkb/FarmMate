import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farmmate/firebase_options.dart';
import 'package:farmmate/src/pages/Home_pages/Buyer_HomeScreen/Buyer_Main_Home.dart';
import 'package:farmmate/src/pages/Home_pages/Farmers_HomeScreen/Farmers_Main_Home.dart';
import 'package:farmmate/src/pages/Landing_pages/welcome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const FarmMateApp());
}

class FarmMateApp extends StatelessWidget {
  const FarmMateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
              color: Color.fromRGBO(0, 0, 0, 1.0),
              fontFamily: "Poppins-SemiBold"),
          bodySmall: TextStyle(
              fontSize: 12,
              color: Color.fromRGBO(255, 255, 255, 1.0),
              fontFamily: "Poppins-SemiBold"),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            elevation: const MaterialStatePropertyAll(11),
            backgroundColor: const MaterialStatePropertyAll(
                Color.fromRGBO(51, 114, 51, 1.0)),
          ),
        ),
      ),
      home: const SplashScreen(), // Start with SplashScreen
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    User? user = FirebaseAuth.instance.currentUser; // Get logged-in user

    if (user == null) {
      // No user logged in, go directly to Welcome screen
      Future.delayed(Duration.zero, () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const welcome()),
        );
      });
      return;
    }

    try {
      // Fetch user role from Firestore
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection("users")
          .doc(user.uid)
          .get();

      if (!userDoc.exists) {
        // If user does not exist in Firestore, go to Welcome screen
        Future.delayed(Duration.zero, () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const welcome()),
          );
        });
        return;
      }

      // Get user role
      Map<String, dynamic>? userData =
          userDoc.data() as Map<String, dynamic>? ?? {};
      String? userType = userData['role'];

      // Navigate to the correct screen based on role
      Future.delayed(Duration.zero, () {
        if (userType == "farmer") {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => FarmersMainHome()),
          );
        } else if (userType == "buyer") {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => BuyerMainHome()),
          );
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const welcome()),
          );
        }
      });
    } catch (e) {
      print("Error fetching user data: $e");
      Future.delayed(Duration.zero, () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const welcome()),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SizedBox(), // No loading bar, just an empty screen
    );
  }
}
