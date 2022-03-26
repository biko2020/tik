import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';

Future<void> getLocation() async {
  Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high);
  if (kDebugMode) {
    print(position);
  }
}
