import 'dart:io';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

// ---- importer des fichiers ---------
import '../../providers/storage_picture.dart';
import '../../providers/storage_picture_location.dart';
import '../location/get_location.dart';

// Class pour Afficher la photo dans l'ecran de mobile

class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;

  const DisplayPictureScreen({Key? key, required this.imagePath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Afficher la photo')),
      body: Center(
        child: Column(children: <Widget>[
          Text(imagePath),
          Container(
            width: MediaQuery.of(context).size.width / 2,
            height: MediaQuery.of(context).size.height / 2,
            child: Image.file(File(imagePath)),
            padding: const EdgeInsets.all(8.0),
            margin: const EdgeInsets.all(8.0),
            color: Colors.redAccent,
          ),
          OutlinedButton(
              child: const Text('send Iamge'),
              onPressed: () async {
                // appel la methode storageImage to firebase a fin de stocker l'image

                storageImage(File(imagePath));

                // appel la methode addLocation pour enregistrer les itineraires de la photo
                //-------------------------------------------------------------
                Position position = await getLocation();
                addlocation('${position.latitude},${position.longitude}',
                    "location name");

                // pp = p.altitude,

                //-------------------------------------------------------------
              }),
        ]),
      ),
    );
  }
}

// var p = UserLoction(p.lanti);

// class UserLoction {
//   //late Position lanti;
//   String lanti;

//   UserLoction(this.lanti);

//   getLocation() async {
//     //Position position = await Geolocator.getCurrentPosition(
//     //   desiredAccuracy: LocationAccuracy.high);
//     String position = "40.712784";
//     p.lanti = position;
//   }
// }
