import 'package:flutter/material.dart';

class BuyerSignup extends StatefulWidget {
  const BuyerSignup({super.key});

  @override
  State<BuyerSignup> createState() => _BuyerSignupState();
}

class _BuyerSignupState extends State<BuyerSignup> {
  final BuyerEmailSignUpController = TextEditingController();
  final BuyerPasswordSignUpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "Buyer SignUp",
            style: TextStyle(
                fontSize: 20,
                fontFamily: "Poppins-SemiBold",
                color: Color.fromRGBO(0, 0, 0, 1.0)),
          ),
          centerTitle: true,
          leading: Builder(
            builder: (context) {
              return IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_outlined,
                    color: Color.fromRGBO(0, 0, 0, 1.0),
                  ));
            },
          )),
      body: Column(
        children: [
          Form(
              child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 23.0),
                    child: Text("Email Address"),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, left: 20, right: 20),
                child: TextFormField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(width: 1, color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                          width: 1, color: Color.fromRGBO(51, 114, 51, 1.0)),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(width: 1, color: Colors.red),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter Email";
                    } else {
                      return null;
                    }
                  },
                  controller: BuyerEmailSignUpController,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 23.0),
                    child: Text("Password"),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, left: 20, right: 20),
                child: TextFormField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(width: 1, color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                          width: 1, color: Color.fromRGBO(51, 114, 51, 1.0)),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(width: 1, color: Colors.red),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter Password";
                    } else {
                      return null;
                    }
                  },
                  controller: BuyerPasswordSignUpController,
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          )),
          SizedBox(
              height: 40,
              width: 350,
              child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1.0),
                    ),
                  ))),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
