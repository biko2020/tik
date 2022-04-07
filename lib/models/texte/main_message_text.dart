import 'dart:async';

import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';
import 'write_message_text.dart';

Future<void> ecrire() async {
  runApp(
    const MaterialApp(
      home: WriteMessage(),
    ),
  );
}
