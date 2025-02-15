import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../Landing_pages/welcome.dart';
import 'BuyerCropDetails.dart';

class BuyerMainHome extends StatefulWidget {
  const BuyerMainHome({super.key});

  @override
  State<BuyerMainHome> createState() => _BuyerMainHomeState();
}

class _BuyerMainHomeState extends State<BuyerMainHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Buyer Dashboard",
          style: TextStyle(
            fontFamily: 'Poppins-SemiBold',
            color: Color.fromRGBO(51, 114, 51, 1.0),
          ),
        ),
        titleSpacing: 0,
        leading: Builder(
          builder: (context) {
            return IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: Icon(
                  Icons.home,
                  color: Color.fromRGBO(51, 114, 51, 1.0),
                ));
          },
        ),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
                padding: EdgeInsets.all(0),
                child: Container(
                  color: Color.fromRGBO(51, 114, 51, 1.0),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Hello FarmMate",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Poppins-SemiBold',
                              fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                )),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => welcome(),
                      ),
                      (route) => false,
                    );
                  },
                  child: Text(
                    "Logout",
                    style: TextStyle(
                        color: Colors.white, fontFamily: 'Poppins-SemiBold'),
                  )),
            )
          ],
        ),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('CropMain').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text("Something Went Wrong"));
          } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text("No crops available"));
          } else {
            var cropDocs = snapshot.data!.docs;
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                  childAspectRatio: 0.8,
                ),
                itemCount: cropDocs.length,
                itemBuilder: (context, index) {
                  var crop = cropDocs[index].data() as Map<String, dynamic>;

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              CropDetailsPage(cropDetails: crop),
                        ),
                      );
                    },
                    child: Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 20),
                            Text(
                              crop["Product"] ?? "Unknown Product",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Color.fromRGBO(51, 114, 51, 1.0),
                              ),
                            ),
                            Text(
                              "CostPerKg: ₹${crop["CostPerKg"] ?? "N/A"}",
                              style: const TextStyle(color: Colors.black),
                            ),
                            Text(
                              "CropRating: ₹${crop["CropRating"] ?? "N/A"}",
                              style: const TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
