import 'package:flutter/material.dart';
import '../models/camera/main_camera_model.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    //WidgetsFlutterBinding.ensureInitialized();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tik photo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            OutlinedButton(
              child: const Text(' Start camera'),
              onPressed: () => {
                //appel la methode main() depuis le fichier main_camera_model
                main(),
              },
            ),
          ],
        ),
      ),
    );
  }
}
