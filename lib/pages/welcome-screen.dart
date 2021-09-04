import 'dart:async';

import 'package:flutter/material.dart';
import 'package:jeux_v1/utils/coolors.dart';
import 'dart:ui' as ui;

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  late Size size;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5), () {
      Navigator.popAndPushNamed(context, '/home');
    });
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return Scaffold(
      body: InkWell(
        onTap: null,
        child: Stack(
          children: [
            Container(
              height: size.height,
              width: size.width,
              decoration: BoxDecoration(
                  color: noir,
                  image: DecorationImage(
                      image: AssetImage('assets/images/9.jpg'),
                      fit: BoxFit.cover)),
            ),
            BackdropFilter(
              filter: ui.ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: Container(
                height: size.height,
                width: size.width,
              ),
            ),
            Positioned(
              top: size.height * .07,
              left: size.width * .1,
              child: Container(
                child: Image(
                  image: AssetImage('assets/images/logo.png'),
                  width: size.width * .8,
                  height: size.height * .6,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Positioned(
                top: size.height * .6,
                child: Container(
                  height: size.height * .2,
                  width: size.width,
                  child: Center(
                      child: Text(
                    'Shirahosi \nGame',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 28,
                        color: blanc,
                        fontFamily: 'Press_Start_2P'),
                  )),
                )),
            Positioned(
                bottom: size.height * .1,
                child: Container(
                  height: size.height * .05,
                  width: size.width,
                  child: Row(
                    children: [
                      Spacer(),
                      // Container(
                      //   height: size.height * .005,
                      //   width: size.width * .8,
                      //   child: LinearProgressIndicator(
                      //     color: bleu,
                      //     backgroundColor: blanc,
                      //   ),
                      // ),
                      CircularProgressIndicator(
                        color: blanc,
                      ),
                      Spacer(),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
