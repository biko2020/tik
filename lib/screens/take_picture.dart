import 'package:flutter/material.dart';

class TakePicture extends StatelessWidget {
  const TakePicture({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.pink,
      child: const Text('Prendre une photo'),
    );
  }
}
