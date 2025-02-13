import 'package:farmmate/src/pages/Landing_pages/buyer_pages/buyer_signup.dart';
import 'package:flutter/material.dart';

class BuyerLogin extends StatefulWidget {
  const BuyerLogin({super.key});

  @override
  State<BuyerLogin> createState() => _BuyerLoginState();
}

class _BuyerLoginState extends State<BuyerLogin> {
  final BuyerEmailLoginController = TextEditingController();

  final BuyerPasswordLoginController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "Buyer LogIn",
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
                  controller: BuyerEmailLoginController,
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
                  controller: BuyerPasswordLoginController,
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
                    "LogIn",
                    style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1.0),
                    ),
                  ))),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Dont have an Account? "),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BuyerSignup(),
                      ));
                },
                child: Text(
                  "Sign Up",
                  style: TextStyle(color: Color.fromRGBO(51, 114, 51, 1.0)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
