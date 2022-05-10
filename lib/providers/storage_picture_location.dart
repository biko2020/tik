import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// insatancer lacollection de location

Future<void> addlocation(latitude, longitude, place, ville, pays) {
  CollectionReference location =
      FirebaseFirestore.instance.collection('location');

  return location

      //.doc('location' + DateTime.now().toString())
      .add({
        'latitude': latitude,
        'longitude': longitude,
        'place': place,
        'ville': ville,
        'pays': pays
      })
      .then((value) => debugPrint("add Location"))
      .catchError((error) => debugPrint("Failed to add location: $error"));
}
