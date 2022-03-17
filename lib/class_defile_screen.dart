import 'package:flutter/material.dart';

class ClassdeFilescreen extends StatefulWidget {
  const ClassdeFilescreen({Key? key}) : super(key: key);

  @override
  State<ClassdeFilescreen> createState() => _ClassdeFilescreenState();
}

class _ClassdeFilescreenState extends State<ClassdeFilescreen> {
  PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            children: [
              //TakePicture(),
              //WriteText(),
              Container(
                color: Colors.blue,
              ),
              Container(
                color: Colors.yellow,
              ),
              Container(
                color: Colors.green,
              ),
            ],
          ),
          Container(
            alignment: Alignment(0, 0.75),
            child: SmoothPageIndicator(controller: _controller, count: 3),
          ),
        ],
      ),
    );
  }
}
