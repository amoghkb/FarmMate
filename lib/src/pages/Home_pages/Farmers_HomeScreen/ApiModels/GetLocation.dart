import 'package:geolocator/geolocator.dart';

class GetLocation {
  static Future<Position> GetCurrentCordinartes() async {
    bool isLocationEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isLocationEnabled) {
      print("Ask User To Switch On Location");
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        print("Location Permission Denied");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      print("User Need to Give permistion from app settings");
    }

    return await Geolocator.getCurrentPosition();
  }
}
