import 'package:flutter/material.dart';
import 'package:tik/models/texte/write_message_text.dart';
import 'package:tik/utilities/themes.dart';

// importer les fichies de l'application.
import '../models/camera/main_camera_model.dart';
import '../models/texte/main_message_text.dart';

// Home :page d'accueil

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    //WidgetsFlutterBinding.ensureInitialized();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tik'),
        backgroundColor: Colors.redAccent,
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_4_rounded),
            onPressed: () {
              // Method pour changer le theme
              currentTheme.toggleTheme();
            },
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            OutlinedButton(
              child: const Text(' Start camera'),
              onPressed: () {
                //appel la classe MainCamera() depuis le fichier main_camera_model.dart

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MainCamera()));
              },
            ),
            const SizedBox(
              height: 32.0,
            ),
            OutlinedButton(
              child: const Text('Ecrire un Text'),
              onPressed: () {
                // appel la classe WriteMessage depuis le fichier main_message_text
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const WriteMessage()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
