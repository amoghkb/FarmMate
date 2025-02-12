import 'package:farmmate/src/pages/Landing_pages/farmer_login/Farmer_login.dart';
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
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 80,
          ),
          Text(
            "Welcome to",
            style: TextStyle(fontSize: 30),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                  height: 300,
                  width: 150,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/crop.jpg"),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                  height: 300,
                  width: 150,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/farmingWomen.jpg"),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "FarmMate",
            style: TextStyle(
                fontSize: 40, color: Color.fromRGBO(51, 114, 51, 1.0)),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "From Farm to Business",
            style: TextStyle(fontSize: 20, color: Color.fromRGBO(0, 0, 0, 1.0)),
          ),
          Text(
            "Sell Smarter, Grow Bigger!",
            style: TextStyle(fontSize: 20, color: Color.fromRGBO(0, 0, 0, 1.0)),
          ),
          SizedBox(
            height: 30,
          ),
          SizedBox(
            height: 40,
            width: 350,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FarmerLogin(),
                    ));
              },
              child: Text(
                "Are you a Farmer ?",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              style: ButtonStyle(
                  elevation: WidgetStatePropertyAll(11),
                  backgroundColor: WidgetStatePropertyAll(
                      Color.fromRGBO(153, 184, 60, 1.0))),
            ),
          ),
          SizedBox(height: 20),
          SizedBox(
            width: 350,
            height: 40,
            child: ElevatedButton(
              onPressed: () {},
              child: Text(
                "Want to buy from Farmers ?",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              style: ButtonStyle(
                  elevation: WidgetStatePropertyAll(11),
                  backgroundColor: WidgetStatePropertyAll(
                      Color.fromRGBO(153, 184, 60, 1.0))),
            ),
          ),
        ],
      ),
    ));
  }
}
