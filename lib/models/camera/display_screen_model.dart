import 'package:flutter/material.dart';
import 'package:tik/main.dart';

// ---- importer des fichiers ---------
import 'package:tik/utilities/constants.dart';
import 'package:tik/models/camera/show_picture_model.dart';

// Class pour Afficher la photo dans l'ecran de mobile

class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;

  const DisplayPictureScreen({Key? key, required this.imagePath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        // le conteneur prendra 45% de la taille de l'ecarn
        children: <Widget>[
          Container(
            height: size.height * .30,
            decoration: const BoxDecoration(
              color: kVertMarocaine,
              // image: DecorationImage(
              //   alignment: Alignment.centerLeft,
              //   // image d'accueil
              //   image: AssetImage(""),
              //),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      alignment: Alignment.center,
                      height: 73,
                      width: 73,
                      child: Image.asset("assets/logos/logo.png"),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),

                      // --- logo
                      // child: const Text(
                      //   "Tik",
                      //   style: TextStyle(
                      //     color: kVertMarocaine,
                      //     fontWeight: FontWeight.bold,
                      //     fontSize: 25.0,
                      //   ),
                      // ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          alignment: Alignment.topLeft,
                          child: IconButton(
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Colors.black,
                            ),
                            onPressed: () {
                              // revenir a la page main.dart
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const MyApp()));
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 0.5,
                  ),
                  const Text(
                      "Fait nous savoir s'il y a des anomalies dans le services public sur votre ville",
                      style: TextStyle(fontSize: 18, color: Colors.white)),
                  Center(
                    child: Column(children: <Widget>[
                      //Text(imagePath),
                      const SizedBox(height: 34.0),
                      Container(
                        // definir la marge du cadre
                        padding: const EdgeInsets.all(2.0),
                        margin: const EdgeInsets.all(2.0),
                        color: kVertMarocaine,

                        // en recupere la taille de la fenetre, puis
                        // en definir la taille de l'image par rapport a l'ecran
                        width: MediaQuery.of(context).size.width / 1.2,
                        height: MediaQuery.of(context).size.height / 1.5,

                        child: ShowPicture(
                          imagePath: imagePath,
                        ),
                      ),
                    ]),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
