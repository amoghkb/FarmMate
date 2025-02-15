import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farmmate/src/pages/Landing_pages/welcome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'FarmerCropDetail.dart';

class FarmerHomescreen extends StatefulWidget {
  const FarmerHomescreen({super.key});

  @override
  State<FarmerHomescreen> createState() => _FarmerHomescreenState();
}

class _FarmerHomescreenState extends State<FarmerHomescreen> {
  List<Map<String, dynamic>> crops = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchCrops();
  }

  Future<void> fetchCrops() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        showSnackBar("User not logged in", Colors.red);
        setState(() => isLoading = false);
        return;
      }

      print("Current User: ${user.email}");

      var cropSnapshot = await FirebaseFirestore.instance
          .collection("CropMain")
          .where("FarmerUID", isEqualTo: user.uid)
          .get();

      List<Map<String, dynamic>> fetchedCrops = cropSnapshot.docs.map((doc) {
        return {
          'id': doc.id, // Add document ID for update & delete functions
          'product': doc['Product'],
          'rating': doc['CropRating'],
          'costPerKg': doc['CostPerKg'],
          'availability': doc['Availability'],
          'cropType': doc['Croptype'],
          'harvestDate': doc['HarvestDate'],
          'expiryDate': doc['ExpiryDate'],
          'phoneNumber': doc['PhoneNumber'],
          'FarmerName': doc['FarmerName'],
          'uploadDate': doc['CropUploadedDate'],
          "PriceType": doc["PriceType"],
          "Location": doc["Location"],
        };
      }).toList();

      // Sorting manually in Dart (descending order)
      fetchedCrops.sort((a, b) {
        DateTime dateA = _parseDate(a['uploadDate']);
        DateTime dateB = _parseDate(b['uploadDate']);
        return dateB.compareTo(dateA);
      });

      setState(() {
        crops = fetchedCrops;
        isLoading = false;
      });
    } on FirebaseException catch (e) {
      showSnackBar(e.message.toString(), Colors.red);
      setState(() => isLoading = false);
    }
  }

  void updateCrop(String docId, Map<String, dynamic> updatedData) async {
    try {
      await FirebaseFirestore.instance
          .collection("CropMain")
          .doc(docId)
          .update(updatedData);
      showSnackBar(
        "Crop updated successfully!",
        Color.fromRGBO(51, 114, 51, 1.0),
      );
      fetchCrops();
    } catch (e) {
      showSnackBar("Failed to update crop!", Colors.red);
    }
  }

  Future deleteCrop(String docId) async {
    try {
      await FirebaseFirestore.instance
          .collection("CropMain")
          .doc(docId)
          .delete();
      showSnackBar(
        "Crop deleted successfully!",
        Color.fromRGBO(51, 114, 51, 1.0),
      );
      fetchCrops();
    } catch (e) {
      showSnackBar("Failed to delete crop!", Colors.red);
    }
  }

  // Function to parse date string into DateTime
  DateTime _parseDate(String dateString) {
    try {
      return DateFormat("dd-MM-yyyy").parse(dateString);
    } catch (e) {
      return DateTime(2000, 1, 1); // Default old date if parsing fails
    }
  }

  void showSnackBar(String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, style: TextStyle(color: Colors.white)),
        backgroundColor: color,
      ),
    );
  }

  void showUpdateDialog(String docId, Map<String, dynamic> crop) {
    TextEditingController productController =
        TextEditingController(text: crop['product']);
    TextEditingController costController =
        TextEditingController(text: crop['costPerKg']);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Update Crop"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: productController,
              decoration: InputDecoration(labelText: "Product Name"),
            ),
            TextField(
              controller: costController,
              decoration: InputDecoration(labelText: "Cost Per Kg"),
              keyboardType: TextInputType.number,
            ),
          ],
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                "Cancel",
                style: TextStyle(
                    color: Color.fromRGBO(51, 114, 51, 1.0),
                    fontFamily: "Poppins-SemiBold"),
              )),
          ElevatedButton(
            onPressed: () {
              updateCrop(docId, {
                'Product': productController.text,
                'CostPerKg': costController.text,
              });
              Navigator.pop(context);
            },
            child: Text(
              "Update",
              style: TextStyle(
                  color: Colors.white, fontFamily: "Poppins-SemiBold"),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Farmer DashBoard",
          style: TextStyle(
            fontSize: 20,
            fontFamily: "Poppins-SemiBold",
            color: Color.fromRGBO(51, 114, 51, 1.0),
          ),
        ),
        centerTitle: true,
        leading: Builder(
          builder: (context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Icon(Icons.person),
              color: Color.fromRGBO(51, 114, 51, 1.0),
            );
          },
        ),
        actions: [
          IconButton(
              onPressed: () async {
                await fetchCrops();
              },
              icon: Icon(
                Icons.refresh,
                color: Color.fromRGBO(51, 114, 51, 1.0),
              ))
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
                padding: EdgeInsets.all(0),
                child: Container(
                  color: Color.fromRGBO(51, 114, 51, 1.0),
                  child: Center(
                    child: Text(
                      "Hello FarmMate",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Poppins-SemiBold',
                          fontSize: 20),
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
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : crops.isEmpty
              ? Center(child: Text("No crops available"))
              : ListView.builder(
                  itemCount: crops.length,
                  itemBuilder: (context, index) {
                    final crop = crops[index];
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  Farmercropdetailcrop(crop: crop),
                            ));
                      },
                      child: Card(
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        elevation: 5,
                        child: ListTile(
                          contentPadding: EdgeInsets.all(10),
                          title: Text(
                            crop['product'],
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Rating: ${crop['rating']}"),
                              Text("Farmer: ${crop['farmerName']}"),
                              Text("Cost Per Kg: ${crop['costPerKg']}"),
                              Text("Uploaded: ${crop['uploadDate']}"),
                            ],
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                onPressed: () {
                                  showUpdateDialog(crop["id"], crop);
                                },
                                icon: Icon(
                                  Icons.edit,
                                  color: Color.fromRGBO(51, 114, 51, 1.0),
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  deleteCrop(crop["id"]);
                                },
                                icon: Icon(Icons.delete, color: Colors.red),
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
}
