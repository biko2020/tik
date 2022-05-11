import 'dart:io';
import 'dart:async';
import 'package:tik/utilities/constants.dart'; // fichier des var globale
import 'package:firebase_storage/firebase_storage.dart';

// methode pour se connect a firebase a fin de stocker l'image



Future<void> storageImage(image) async {
  // stocker le nom de l'image sur une variable global;
 imageName = ("tik" + DateTime.now().toString());
  FirebaseStorage storage = FirebaseStorage.instance;

  //Reference ref = storage.ref().child("tik" + DateTime.now().toString());
  Reference ref = storage.ref('images/' + imageName);
  UploadTask uploadTask = ref.putFile(File(image.path));

  uploadTask.then((res) {
    res.ref.getDownloadURL();
  });
}
