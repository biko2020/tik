import 'package:flutter/material.dart';

import '../../main.dart';

class WriteMessage extends StatefulWidget {
  const WriteMessage({Key? key}) : super(key: key);

  @override
  State<WriteMessage> createState() => _WriteMessageState();
}

class _WriteMessageState extends State<WriteMessage> {
  TextEditingController textarea = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const MyApp()));
          },
        ),
        title: const Text('Tik:Réclamation Par Message.'),
        //centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 42.0),
            TextField(
              controller: textarea,
              keyboardType: TextInputType.multiline,
              maxLines: 4,
              decoration: const InputDecoration(
                hintText: "Ecrire Votre Réclamation",
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.redAccent),
                ),
              ),
            ),
            const SizedBox(
              height: 32.0,
            ),
            ElevatedButton(
              onPressed: () {
                debugPrint(textarea.text);
              },
              child: const Text("Envoiyer votre réclamation"),
            ),
          ],
        ),
      ),
    );
  }
}
