import 'package:cloud_firestore/cloud_firestore.dart';

// Create a CollectionReference called location that references the firestore collection
CollectionReference location =
    FirebaseFirestore.instance.collection('location');

Future<void> addlocation(latitude, longitude, name) {
  // Call the location's CollectionReference to add a new location

  return location

      //.doc('location' + DateTime.now().toString())
      .add({'latitude': latitude, 'longitude': longitude, 'name': name})
      .then((value) => print("add Location"))
      .catchError((error) => print("Failed to add location: $error"));
}
