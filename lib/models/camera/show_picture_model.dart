import 'dart:io';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

// ---- importer des fichiers ---------
import '../../providers/storage_picture.dart';
import '../../providers/storage_picture_location.dart';
import '../location/get_location.dart';

class ShowPicture extends StatelessWidget {
  final String imagePath;

  const ShowPicture({Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          //Text(imagePath),
          // récuperer le fichier de l'image
          Image.file(File(imagePath)),
          const SizedBox(height: 5.0),
          OutlinedButton(
              child: const Text('Envoyer votre réclamation'),
              onPressed: () async {
                // appel la methode storageImage to firebase a fin de stocker l'image
                storageImage(File(imagePath));

                // appel la methode getLocation afin de recuperer les itinéraires
                //-------------------------------------------------------------
                Position position = await getLocation();
                dynamic address = await getAddressLocation(position);

                List<String> result = address.split(',');

                var place = result[0];
                var ville = result[1];
                var pays = result[2];

                //var street = address[0];
                // la fonction asslocation sert a enregistrer le les itinéraires
                // dans la base de donnes firebaise store.
                addlocation('${position.latitude}', '${position.longitude}',
                    place, ville, pays);

                //-------------------------------------------------------------
              }),
        ],
      ),
    );
  }
}