import 'package:flutter/material.dart';

class BouteilleWidget extends StatelessWidget {
  const BouteilleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/icon_bouteille.png',
      height: 50,
      width: 50,
    );
  }
}
