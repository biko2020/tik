// import 'dart:io';
import 'dart:async';

import '/../providers/storage_img.dart';

import 'package:camera/camera.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

import 'display_screen_model.dart';

//FirebaseFirestore firestore = FirebaseFirestore.instance;

// classe pour Prendre une photo

// Créer a StatefulWidget avec State class.
class TakePicture extends StatefulWidget {
  const TakePicture({
    Key? key,
    required this.camera,
  }) : super(key: key);
// Ajoutez une variable à la classe State pour stocker le CameraController.
  final CameraDescription camera;

  @override
  _TakePictureState createState() => _TakePictureState();
}

class _TakePictureState extends State<TakePicture> {
// Ajoutez les variables pour stocker les données renvoyé par CameraController.initialize().
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  //FirebaseStorage storage = FirebaseStorage.instance;

// créer la methode initState() afin de creer et initialiser le controlleur

  @override
  void initState() {
    super.initState();
    //Créer le controlleur pour afficher la sortie actuelle de la caméra,
    _controller = CameraController(
      //sélectionner le camera de la liste
      widget.camera,
      // selectionner le type de résolution a utiliser
      ResolutionPreset.medium,
    );

    // initialiser le controlleur
    _initializeControllerFuture = _controller.initialize();
  }

  // Supprimer le contrôleur.
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Prendre une Photo')),
      body:
          // Nous utilisons FutureBuilder pour s'assuré que le contrôleur a fini de s'initialiser.
          FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            //Si le processus est terminé, affichez l'aperçu. return CameraPreview(_controller);
            return CameraPreview(_controller);
          } else {
            // sinon afficher l'icon de chragement
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          try {
            // s'assure l'initialisation du camera
            await _initializeControllerFuture;
            // Essayez de prendre une photo, puis obtenez l'emplacement
            final image = await _controller.takePicture();
            // afficher la photo dans un nouveau ecran.
            await Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => DisplayPictureScreen(
                  // affecter le chemain au variable imagePath.
                  imagePath: image.path,
                ),
                
              ),
            );

             /////////////// refrence pour firebase ////////////////
             ///
            connect(image);
           
            // Reference ref =
            //     storage.ref().child("db_tik" + DateTime.now().toString());
            // UploadTask uploadTask = ref.putFile(File(image.path));
            // uploadTask.then((res) {
            //   res.ref.getDownloadURL();
            // });
            ///////////////// -------------------- ////////////////

            print("Mu image Path:");
            print(image.path);
          } catch (e) {
            print(e);
          }
         
        },
        child: const Icon(Icons.camera_alt),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
