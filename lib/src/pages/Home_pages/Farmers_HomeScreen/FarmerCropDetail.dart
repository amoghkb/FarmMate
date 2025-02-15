import 'package:flutter/material.dart';

class Farmercropdetailcrop extends StatefulWidget {
  final Map<String, dynamic> crop; // Accept crop details

  const Farmercropdetailcrop({super.key, required this.crop});

  @override
  State<Farmercropdetailcrop> createState() => _FarmercropdetailcropState();
}

class _FarmercropdetailcropState extends State<Farmercropdetailcrop> {
  @override
  Widget build(BuildContext context) {
    // Debugging: Print the entire crop map to check the contents
    print(widget.crop);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.crop['product'] ?? "Crop Details",
          style: TextStyle(color: Colors.white, fontFamily: "Poppins-SemiBold"),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_outlined,
              color: Color.fromRGBO(255, 255, 255, 1.0),
            )),
        backgroundColor: Color.fromRGBO(51, 114, 51, 1.0),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: ListView(
              children: [
                _detailRow("Product Name :", widget.crop['product'] ?? "N/A"),
                _detailRow(
                    "Rating:", widget.crop['rating']?.toString() ?? "N/A"),
                _detailRow("Availability:",
                    widget.crop['availability']?.toString() ?? "N/A"),
                _detailRow("Cost Per Kg :",
                    widget.crop['costPerKg']?.toString() ?? "N/A"),
                _detailRow("Price is :", widget.crop['PriceType'] ?? "N/A"),
                _detailRow(
                    "Phone Number :", widget.crop['phoneNumber'] ?? "N/A"),
                _detailRow(
                    "Harvest Date :", widget.crop['harvestDate'] ?? "N/A"),
                _detailRow("Expiry Date :", widget.crop['expiryDate'] ?? "N/A"),
                _detailRow(
                    "Uploaded Date :", widget.crop['uploadDate'] ?? "N/A"),
                _detailRow("Location :", widget.crop['Location'] ?? "N/A"),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _detailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              label,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(fontSize: 16),
              overflow: TextOverflow.ellipsis, // Prevent overflow
              maxLines: 9, // Ensure it does not take up more than one line
            ),
          ),
        ],
      ),
    );
  }
}
