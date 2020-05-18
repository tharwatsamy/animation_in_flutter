import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: AnimationExample(),
      ),
    );
  }
}

class AnimationExample extends StatefulWidget {
  @override
  _AnimationExampleState createState() => _AnimationExampleState();
}

class _AnimationExampleState extends State<AnimationExample> {
  double _opacityLevel = .1;
  double height = 200;
  double width = 200;
  double radius = 20;
  Color color = Colors.black;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: AnimatedOpacity(
      duration: Duration(seconds: 2),
      opacity: _opacityLevel,
      child: GestureDetector(
        onTap: startAnimation,
        child: AnimatedContainer(
          duration: Duration(seconds: 2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(radius)),
            color: color,
          ),
          height: height,
          width: width,
        ),
      ),
    ));
  }

  void changeOpacity() {
    setState(() {
      _opacityLevel = 1;
    });
  }

  void startAnimation() {
    setState(() {
      height = Random().nextDouble() * 200;
      width = Random().nextDouble() * 200;
      radius = Random().nextDouble() * 100;
      color = Color(0xFF000000 * Random().nextInt(0xFFFFFFFF));
    });
  }
}
