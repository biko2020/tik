import 'dart:io';
import 'dart:async';

//import '../models/camera/take_picture_model.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;

Future<void> connect(image) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  FirebaseStorage storage = FirebaseStorage.instance;

  Reference ref = storage.ref().child("db_tik" + DateTime.now().toString());
  UploadTask uploadTask = ref.putFile(File(image.path));
  uploadTask.then((res) {
    res.ref.getDownloadURL();
  });
}
