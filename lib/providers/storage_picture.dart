import 'dart:io';
import 'dart:async';

import 'package:firebase_storage/firebase_storage.dart';

// methode pour se connect a firebase a fin de stocker l'image

Future<void> storageImage(image) async {
  FirebaseStorage storage = FirebaseStorage.instance;

  Reference ref = storage.ref().child("db_tik" + DateTime.now().toString());
  UploadTask uploadTask = ref.putFile(File(image.path));
  uploadTask.then((res) {
    res.ref.getDownloadURL();
  });
}
