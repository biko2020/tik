import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// Create a CollectionReference called location that references the firestore collection

Future<void> addlocation(coords, place) {
  // Call the location's CollectionReference to add a new location
  CollectionReference location =
      FirebaseFirestore.instance.collection('location');

  return location

      //.doc('location' + DateTime.now().toString())
      .add({'coords': coords, 'place': place})
      .then((value) => debugPrint("add Location"))
      .catchError((error) => debugPrint("Failed to add location: $error"));
}
