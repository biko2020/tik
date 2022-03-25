import 'package:flutter/material.dart';

class WriteText extends StatelessWidget {
  const WriteText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue[100],
      child: const Text('Ecrire un message'),
    );
  }
}
