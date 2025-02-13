import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FarmerSignup extends StatefulWidget {
  const FarmerSignup({super.key});

  @override
  State<FarmerSignup> createState() => _FarmerSignupState();
}

class _FarmerSignupState extends State<FarmerSignup> {
  final TextEditingController farmerEmailSignUpController =
      TextEditingController();
  final TextEditingController farmerPasswordSignUpController =
      TextEditingController();
  final GlobalKey<FormState> farmerSignupGkey = GlobalKey<FormState>();

  Future<void> farmerSignUpWithEmailAndPass() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: farmerEmailSignUpController.text.trim(),
              password: farmerPasswordSignUpController.text.trim());

      if (userCredential.user != null) {
        String userId = userCredential.user!.uid;

        await FirebaseFirestore.instance.collection("users").doc(userId).set({
          "email": farmerEmailSignUpController.text.trim(),
          "role": "farmer",
        });

        print("User registered with role: farmer (UserID: $userId)");

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Farmer registered successfully!")),
        );
      }
    } on FirebaseAuthException catch (e) {
      print("Firebase Auth Error: ${e.message}");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.message.toString())),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Farmer SignUp",
            style: TextStyle(fontSize: 20, fontFamily: "Poppins-SemiBold")),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_outlined),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: farmerSignupGkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Email Address"),
              const SizedBox(height: 10),
              TextFormField(
                controller: farmerEmailSignUpController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter Email";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              const Text("Password"),
              const SizedBox(height: 10),
              TextFormField(
                controller: farmerPasswordSignUpController,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter Password";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 40,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    if (farmerSignupGkey.currentState!.validate()) {
                      await farmerSignUpWithEmailAndPass();
                    }
                  },
                  child: const Text("Sign Up",
                      style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
