import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

//definir l'alias

// fonction qui recupere lantitude, langitude de localisation.
Future<Position> getLocation() async {
  bool serviceEnabled;
  LocationPermission permission;
  // Testez si les services de localisation sont activés..
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // Si les services de localisation ne sont pas activés,
    // demander aux utilisateurs d'activer les services de localisation.

    return Future.error('Les services de localisation sont désactivés.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // si les autorisations sont refusées, redemande les permissions (c'est aussi là que
      // devrait RequestPermission d'Android retourne vrai.
      return Future.error('Les autorisations de localisation sont refusées.');
    }
  }
  if (permission == LocationPermission.deniedForever) {
    // Les autorisations sont refusées.
    return Future.error(
        'Les autorisations de localisation sont définitivement refusées.');
  }
  // les autorisations sont accordées
  return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high);
}

// la fonction getAddressLocation recupere l'adresse de localisation
Future getAddressLocation(Position position) async {
  List<Placemark> placemarks =
      await placemarkFromCoordinates(position.latitude, position.longitude);
  //print(placemarks);
  Placemark place = placemarks[0];
  //dynamic address = [];
  //address = [place.street, place.locality, place.country];
  String address = '${place.street},${place.locality},${place.country}';

  return address;

  //'${place.street},${place.subLocality},${place.locality},${place.postalCode},${place.country}';
}
