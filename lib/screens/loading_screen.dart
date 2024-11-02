import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

Future<void> getLocation() async {
  LocationPermission permission = await Geolocator.requestPermission();

  if (permission == LocationPermission.denied) 
 {
    // Handle the case where the user denied permissions   

    print('Location permission denied');
  } else if (permission == LocationPermission.deniedForever) {
    // Handle the case where the user permanently denied permissions
    print('Location permission denied forever');
  } else {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);

    print(position);
  }
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            //Get the current location
            getLocation();
          },
          child: Text('Get Location'),
        ),
      ),
    );
  }
}
