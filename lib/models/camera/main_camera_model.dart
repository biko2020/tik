import 'dart:async';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';

// importer les fichiers de l'application
import 'take_picture_model.dart';

class MainCamera extends StatefulWidget {
  const MainCamera({Key? key}) : super(key: key);

  @override
  State<MainCamera> createState() => _MainCameraState();
}

@override
class _MainCameraState extends State<MainCamera> {
  // declareation des variables global pour la classe TakePicture
  // on FutureBuilder<void> in widget
  dynamic relaodCameras, relaodfirstCamera;

  Future<void> tikCamera() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();

    final cameras = await availableCameras();
    final firstCamera = cameras.first;

    relaodCameras = cameras;
    relaodfirstCamera = cameras.first;

    runApp(
      MaterialApp(
        //  // revenir a la class TakePicture
        home: TakePicture(
          // Passer la variable camera au class TakePicture.
          camera: firstCamera,
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      tikCamera();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<void>(
          future: tikCamera(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              // rappel de la classe TakePicture
              return (TakePicture(camera: relaodfirstCamera));
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
