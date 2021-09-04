import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jeux_v1/pages/home-screen.dart';
import 'package:jeux_v1/utils/coolors.dart';
import 'dart:ui' as ui;

import 'package:page_transition/page_transition.dart';

class CreateAndConnectedScreen extends StatefulWidget {
  const CreateAndConnectedScreen({Key? key}) : super(key: key);

  @override
  _CreateAndConnectedScreenState createState() =>
      _CreateAndConnectedScreenState();
}

class _CreateAndConnectedScreenState extends State<CreateAndConnectedScreen> {
  late Size size;

  TextEditingController pseudo = TextEditingController();

  @override
  void initState() {
    SystemChrome.restoreSystemUIOverlays();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: size.height,
            width: size.width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/9.jpg'),
                    fit: BoxFit.cover)),
          ),
          BackdropFilter(
            filter: ui.ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            child: Container(
              height: size.height,
              width: size.width,
              // decoration: BoxDecoration(color: blanc.withOpacity(.05)),
            ),
          ),
          Positioned(
              top: size.height * .1,
              child: Container(
                height: size.height * .2,
                width: size.width,
                decoration: BoxDecoration(
                    // color: jaune,
                    image: DecorationImage(
                        image: AssetImage('assets/images/log-shirahoshi.png'),
                        fit: BoxFit.cover)),
              )),
          Positioned(
              top: size.height * .4,
              child: Container(
                height: size.height * .6,
                width: size.width,
                child: Column(
                  children: [
                    Container(
                      height: size.height * .07,
                      // color: jaune,
                      child: LayoutBuilder(
                        builder: (context, constraints) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: TextField(
                            cursorColor: jaune,
                            controller: pseudo,
                            style: TextStyle(
                                fontSize: constraints.maxHeight * .3,
                                color: jaune),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                labelText: 'Entrez votre pseudo',
                                labelStyle: TextStyle(
                                    fontSize: constraints.maxHeight * .2,
                                    color: jaune),
                                icon: Icon(
                                  CupertinoIcons.person,
                                  size: constraints.maxHeight * .6,
                                  color: jaune,
                                )),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: .5,
                      color: jaune,
                    ),
                    SizedBox(
                      height: size.height * .1,
                    ),
                    GestureDetector(
                      onTap: () {
                        if (pseudo.text.trim().length > 0) {
                          FirebaseAuth.instance
                              .signInAnonymously()
                              .then((user) {
                            FirebaseFirestore.instance
                                .collection('gamers')
                                .doc(user.user!.uid)
                                .set(
                                    {"pseudo": pseudo.text, "avatar": ""}).then(
                              (value) => Navigator.push(
                                  context,
                                  PageTransition(
                                      child: HomeScreen(),
                                      duration: Duration(milliseconds: 1000),
                                      reverseDuration:
                                          Duration(milliseconds: 1000),
                                      childCurrent: CreateAndConnectedScreen(),
                                      type: PageTransitionType
                                          .rightToLeftJoined)),
                            );
                          });
                        }
                      },
                      child: Container(
                        height: size.height * .07,
                        width: size.width * .5,
                        child: Center(
                          child: Text(
                            'Se connecter',
                            style: TextStyle(
                                color: blanc, fontSize: size.height * .02),
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: vert,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * .1,
                    ),
                    Container(
                      height: size.height * .07,
                      width: size.width * .9,
                      child: Row(
                        children: [
                          Container(
                            width: size.width * .3,
                            height: size.height * .05,
                            child: Icon(
                              Icons.facebook_rounded,
                              color: blanc,
                              size: size.height * .05,
                            ),
                          ),
                          Container(
                            width: size.width * .6,

                            // color: jaune,
                            child: Text(
                              'Se connecter avec Facebook',
                              style: TextStyle(
                                  color: blanc, fontSize: size.height * .015),
                            ),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2),
                        color: bleuFacebokk,
                      ),
                    ),
                    SizedBox(
                      height: size.height * .02,
                    ),
                    Container(
                      height: size.height * .07,
                      width: size.width * .9,
                      child: Row(
                        children: [
                          Container(
                            width: size.width * .3,
                            height: size.height * .05,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/google-logo.jpg'))),
                          ),
                          Container(
                            width: size.width * .6,

                            // color: jaune,
                            child: Text(
                              'Se connecter avec Google',
                              style: TextStyle(
                                  color: bleuFacebokk,
                                  fontSize: size.height * .015),
                            ),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2),
                        color: blanc,
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
