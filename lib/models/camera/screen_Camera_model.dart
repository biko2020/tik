// ignore_for_file: file_names

// import 'dart:io';
// import 'package:flutter/material.dart';
// // ignore: unused_import
// import 'package:geocoding/geocoding.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:tik/utilities/constants.dart';

// // ---- importer des fichiers ---------
// import '../../providers/storage_picture.dart';
// import '../../providers/storage_picture_location.dart';
// import '../location/get_location.dart';

// // Class pour Afficher la photo dans l'ecran de mobile

// class ScreenCamera extends StatelessWidget {
//   final String imagePath;

//   const ScreenCamera({Key? key, required this.imagePath}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Envoyer votre Réclamation'),
//         backgroundColor: Colors.redAccent,
//       ),
//       body: Center(
//         child: Column(children: <Widget>[
//           //Text(imagePath),
//           const SizedBox(height: 34.0),
//           Container(
//             // decoration: const BoxDecoration(
//             //   shape: BoxShape.circle,
//             //   color: Colors.redAccent,
//             // ),

//             // definir la marge du cadre
//             padding: const EdgeInsets.all(2.0),
//             margin: const EdgeInsets.all(2.0),
//             // color: Colors.redAccent,

//             // en recupere la taille de la fenetre, puis
//             // en definir la taille de l'image par rapport a l'ecran
//             width: MediaQuery.of(context).size.width / 1,
//             height: MediaQuery.of(context).size.height / 2,

//             // récuperer le fichier de l'image
//             child: Image.file(File(imagePath)),
//           ),
//           const SizedBox(height: 15.0),
//           OutlinedButton(
//               child: const Text('Envoyer la réclamation'),
//               onPressed: () async {
//                 // appel la methode storageImage to firebase a fin de stocker l'image

//                 storageImage(File(imagePath));

//                 // appel la methode getLocation afin de recuperer les itinéraires
//                 //-------------------------------------------------------------
//                 Position position = await getLocation();
//                 dynamic address = await getAddressLocation(position);
//                  // récuperer la date de réclamation
//                 DateTime now = DateTime.now();

//                 var place = address[0];
//                 var ville = address[1];
//                 var pays = address[2];
//                 var dateReclam = now,
                
//                 // la fonction addlocation sert a enregistrer le les itinéraires
//                 // dans la base de donnes firebaise store.
//                 addlocation('${position.latitude}', '${position.longitude}',
//                     place, ville, pays, imageName);

//                 //-------------------------------------------------------------
//               }),
//         ]),
//       ),
//     );
//   }
// }
