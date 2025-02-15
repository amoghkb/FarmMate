import 'package:flutter/material.dart';

class CropDetailsPage extends StatelessWidget {
  final Map<String, dynamic> cropDetails;

  const CropDetailsPage({super.key, required this.cropDetails});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(51, 114, 51, 1.0),
        title: Text(
          cropDetails["Product"] ?? "Crop Details",
          style: TextStyle(color: Colors.white, fontFamily: 'Poppins-SemiBold'),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 6,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                detailRow("Product", cropDetails["Product"]),
                detailRow("Availability", "${cropDetails["Availability"]}"),
                detailRow("Cost Per Kg", "₹${cropDetails["CostPerKg"]}"),
                detailRow("Crop Rating", cropDetails["CropRating"]),
                detailRow("Crop Type", cropDetails["Croptype"]),
                detailRow("Uploaded Date", cropDetails["CropUploadedDate"]),
                detailRow("Harvest Date", cropDetails["HarvestDate"]),
                detailRow("Expiry Date", cropDetails["ExpiryDate"]),
                detailRow("Price Type", cropDetails["PriceType"]),
                detailRow("Location", cropDetails["Location"]),
                detailRow("Phone Number", cropDetails["PhoneNumber"]),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget detailRow(String title, String? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Text(
            "$title: ",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          Expanded(
            child: Text(
              value ?? "N/A",
              style: const TextStyle(fontSize: 16),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
