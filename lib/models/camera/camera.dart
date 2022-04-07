// import 'dart:async';
// import 'dart:io';

// import 'package:camera/camera.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';

// import 'package:geolocator/geolocator.dart';

// // ---- importer des fichiers ---------
// import '../../providers/storage_picture.dart';
// import '../../providers/storage_picture_location.dart';
// import '../location/get_location.dart';
// import '../../main.dart';

// Future<void> mainCamera() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();

//   final cameras = await availableCameras();
//   final firstCamera = cameras.first;

//   runApp(
//     MaterialApp(
//       //  // revenir a la class TakePicture
//       home: TakePicture(
//         // Passer la variable camera au class TakePicture.
//         camera: firstCamera,
//       ),
//     ),
//   );
// }

// // classe Prendre une photo

// // Créer a StatefulWidget avec State class.
// class TakePicture extends StatefulWidget {
//   const TakePicture({
//     Key? key,
//     required this.camera,
//   }) : super(key: key);
// // Ajoutez une variable à la classe State pour stocker le CameraController.
//   final CameraDescription camera;

//   @override
//   _TakePictureState createState() => _TakePictureState();
// }

// class _TakePictureState extends State<TakePicture> {
// // Ajoutez les variables pour stocker les données renvoyé par CameraController.initialize().
//   late CameraController _controller;
//   late Future<void> _initializeControllerFuture;

// // créer la methode initState() afin de creer et initialiser le controlleur

//   @override
//   void initState() {
//     super.initState();
//     //Créer le controlleur pour afficher la sortie actuelle de la caméra,
//     _controller = CameraController(
//       //sélectionner le camera de la liste
//       widget.camera,
//       // selectionner le type de résolution a utiliser
//       ResolutionPreset.medium,
//     );

//     // initialiser le controlleur
//     _initializeControllerFuture = _controller.initialize();
//   }

//   // Supprimer le contrôleur.
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//           leading: IconButton(
//             icon: const Icon(Icons.arrow_back, color: Colors.black),
//             onPressed: () {
//               // revenir a la page main.dart
//               Navigator.push(context,
//                   MaterialPageRoute(builder: (context) => const MyApp()));
//             },
//           ),
//           title: const Text('Prendre une Photo')),
//       body:
//           // Nous utilisons FutureBuilder pour s'assuré que le contrôleur a fini de s'initialiser.
//           FutureBuilder<void>(
//         future: _initializeControllerFuture,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.done) {
//             //Si le processus est terminé, affichez l'aperçu. return CameraPreview(_controller);
//             return CameraPreview(_controller);
//           } else {
//             // sinon afficher l'icon de chragement
//             return const Center(child: CircularProgressIndicator());
//           }
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () async {
//           try {
//             // s'assure l'initialisation du camera
//             await _initializeControllerFuture;
//             // Essayez de prendre une photo, puis obtenez l'emplacement
//             final image = await _controller.takePicture();
//             // afficher la photo dans un nouveau ecran.
//             await Navigator.of(context).push(
//               MaterialPageRoute(
//                 builder: (context) => DisplayPictureScreen(
//                   // affecter le chemain au variable imagePath.
//                   imagePath: image.path,
//                 ),
//               ),
//             );
//           } catch (e) {
//             if (kDebugMode) {
//               print(e);
//             }
//           }
//         },
//         child: const Icon(Icons.camera_alt),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//     );
//   }
// }

// class DisplayPictureScreen extends StatelessWidget {
//   final String imagePath;

//   const DisplayPictureScreen({Key? key, required this.imagePath})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Afficher la photo'),
//         backgroundColor: Colors.redAccent,
//       ),
//       body: Center(
//         child: Column(children: <Widget>[
//           Text(imagePath),
//           Container(
//             width: MediaQuery.of(context).size.width / 2,
//             height: MediaQuery.of(context).size.height / 2,
//             child: Image.file(File(imagePath)),
//             padding: const EdgeInsets.all(8.0),
//             margin: const EdgeInsets.all(8.0),
//             color: Colors.redAccent,
//           ),
//           OutlinedButton(
//               child: const Text('send Iamge'),
//               onPressed: () async {
//                 // appel la methode storageImage to firebase a fin de stocker l'image

//                 storageImage(File(imagePath));

//                 // appel la methode getLocation afin de recuperer les itinéraires
//                 //-------------------------------------------------------------
//                 Position position = await getLocation();
//                 dynamic address = await getAddressLocation(position);

//                 // la fonction asslocation sert a enregistrer le les itinéraires
//                 // dans la base de donnes firebaise store.
//                 addlocation(
//                     '${position.latitude},${position.longitude}', address);

//                 //-------------------------------------------------------------
//               }),
//         ]),
//       ),
//     );
//   }
// }
