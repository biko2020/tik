import 'dart:io';
import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;

// methode pour se connect a firebase a fin de stocker l'image

Future<void> storageImage(image) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  FirebaseStorage storage = FirebaseStorage.instance;

  Reference ref = storage.ref().child("db_tik" + DateTime.now().toString());
  UploadTask uploadTask = ref.putFile(File(image.path));
  uploadTask.then((res) {
    res.ref.getDownloadURL();
  });
}

Future<void> storageImageLocation(imagelocation) async {}
