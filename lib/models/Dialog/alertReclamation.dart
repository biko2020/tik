import 'package:flutter/material.dart';

import '../../main.dart';

showAlertDialog(BuildContext context) {
  //creer le boutton
  Widget okButton = TextButton(
    child: const Text("ok"),
    onPressed: () {
      // revenir a la page main.dart
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const MyApp()));
    },
  );

  //creer la boite de dialogue
  AlertDialog alert = AlertDialog(
    title: const Text(
      "Réclamation",
      style: TextStyle(color: Colors.red),
    ),
    content:
        const Text("Votre réclamation a été adresser au service concerner!"),
        
    actions: [
      okButton,
    ],
  );

  //afficher la boite de dialogue
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
