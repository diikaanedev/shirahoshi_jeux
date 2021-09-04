import 'package:flutter/material.dart';

class JoueurWidget extends StatelessWidget {
  final direction;

  static bool clicknobayibtn = false;

  const JoueurWidget({Key? key, this.direction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return direction == 'r'
        ? Image.asset(
            'assets/images/perso.png',
            height: 100,
            width: 100,
          )
        : Transform(
            transform: Matrix4.rotationY(0),
            child: Image.asset(
              'assets/images/perso.png',
              height: 100,
              width: 100,
            ));
  }
}
