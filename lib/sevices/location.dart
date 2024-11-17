import 'package:geolocator/geolocator.dart';

class Location {
  double longitude = 0.0;
  double latitude = 0.0;

  Future<void> getCurrentLocation() async {
    try {
      LocationPermission permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        print('Location permission denied');
      } else if (permission == LocationPermission.deniedForever) {
        print('Location permission denied forever');
      } else {
        Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.low);

        longitude = position.longitude;
        latitude = position.latitude;
      }
    } catch (e) {
      print('Error getting location: $e');
      // Handle the error, e.g., display an error message to the user
    }
  }
}
