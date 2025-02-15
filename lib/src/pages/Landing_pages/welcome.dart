import 'package:farmmate/src/pages/Landing_pages/buyer_pages/buyer_login.dart';
import 'package:farmmate/src/pages/Landing_pages/farmer_pages/Farmer_login.dart';
import 'package:flutter/material.dart';

class welcome extends StatefulWidget {
  const welcome({super.key});

  @override
  State<welcome> createState() => _welcomeState();
}

class _welcomeState extends State<welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 80),
              Text("Welcome to", style: TextStyle(fontSize: 30)),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Container(
                      height: 300,
                      width: 300,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/main.jpg"),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text("FarmMate",
                  style: TextStyle(
                    fontSize: 40,
                    color: Color.fromRGBO(51, 114, 51, 1.0),
                  )),
              Text("From Farm to Business", style: TextStyle(fontSize: 20)),
              Text("Sell Smarter, Grow Bigger!",
                  style: TextStyle(fontSize: 20)),
              SizedBox(height: 30),

              // Farmer Login Button
              SizedBox(
                width: 300,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => FarmerLogin()));
                  },
                  child: Text(
                    "Are you a Farmer?",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontFamily: 'Poppins-SemiBold'),
                  ),
                ),
              ),

              SizedBox(height: 20),

              // Buyer Login Button
              SizedBox(
                width: 300,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => BuyerLogin()));
                  },
                  child: Text(
                    "Want to buy from Farmers?",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontFamily: 'Poppins-SemiBold'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
