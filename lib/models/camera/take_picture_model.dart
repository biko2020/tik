import 'dart:async';
import 'package:camera/camera.dart'; // utilisation du camera
import 'package:flutter/material.dart'; // widgets
import 'package:flutter/foundation.dart'; // pour if (kDebugMode)
import 'package:tik/main.dart';
import 'package:tik/utilities/constants.dart';

// ---- importer des fichiers ---------
import 'display_screen_model.dart';

// classe Prendre une photo

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
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            // revenir a la page main.dart
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const MyApp()));
          },
        ),
        title: const Text('Tik : Prendre une Photo'),
        backgroundColor: kVertMarocaine,
      ),
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
            // prendre une photo, puis obtenez l'emplacement
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
          } catch (e) {
            if (kDebugMode) {
              print(e);
            }
          }
        },
        child: const Icon(Icons.camera_alt),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
