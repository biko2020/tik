import 'dart:io';
import 'package:flutter/material.dart';

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
          Text("$imagePath"),
          Container(
            width: MediaQuery.of(context).size.width / 2,
            height: MediaQuery.of(context).size.height / 2,
            child: Image.file(File(imagePath)),
          ),
        ]),
      ),
    );
  }
}
