import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class BuyerSignup extends StatefulWidget {
  const BuyerSignup({super.key});

  @override
  State<BuyerSignup> createState() => _BuyerSignupState();
}

class _BuyerSignupState extends State<BuyerSignup> {
  final TextEditingController buyerEmailSignUpController =
      TextEditingController();
  final TextEditingController buyerPasswordSignUpController =
      TextEditingController();
  final GlobalKey<FormState> buyerSignupGkey = GlobalKey<FormState>();

  Future<void> buyerSignUpWithEmailAndPass() async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: buyerEmailSignUpController.text.trim(),
        password: buyerPasswordSignUpController.text.trim(),
      );

      if (userCredential.user != null) {
        String userId = userCredential.user!.uid;

        await FirebaseFirestore.instance.collection("users").doc(userId).set({
          "email": buyerEmailSignUpController.text.trim(),
          "role": "buyer",
        });

        print("User registered with role: buyer (UserID: $userId)");

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Buyer registered successfully!")),
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
        title: const Text("Buyer SignUp",
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
          key: buyerSignupGkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Email Address"),
              const SizedBox(height: 10),
              TextFormField(
                controller: buyerEmailSignUpController,
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
                controller: buyerPasswordSignUpController,
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
                    if (buyerSignupGkey.currentState!.validate()) {
                      await buyerSignUpWithEmailAndPass();
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
