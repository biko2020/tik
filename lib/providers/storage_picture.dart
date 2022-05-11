import 'dart:io';
import 'dart:async';
import 'package:tik/utilities/constants.dart'; // fichier des var globale
import 'package:firebase_storage/firebase_storage.dart';

// methode pour se connect a firebase a fin de stocker l'image

Future<void> storageImage(image) async {
  FirebaseStorage storage = FirebaseStorage.instance;
  Reference ref = storage.ref().child("db_tik" + DateTime.now().toString());
  UploadTask uploadTask = ref.putFile(File(image.path));
  imageName = ref.fullPath;
  ; // stocker le nom de l'image sur une variable global
  uploadTask.then((res) {
    res.ref.getDownloadURL();
  });
}
