import 'dart:async';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jeux_v1/utils/coolors.dart';
import 'package:jeux_v1/widgets/bouteille-widget.dart';
import 'package:jeux_v1/widgets/joueur.dart';
import 'package:jeux_v1/widgets/my-btn-direction.dart';
import 'package:control_pad/control_pad.dart';
import 'package:joystick/joystick.dart';

class PlayScreen extends StatefulWidget {
  const PlayScreen({Key? key}) : super(key: key);

  @override
  _PlayScreenState createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  late Size size;

  late double joueurX = -1;

  late double joueurY = 0;

  String direction = 'r';

  Random r = new Random();

  List pts = [];

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);

    super.initState();
  }

  void moveRight() {
    direction = 'r';
    print(joueurX);

    Timer.periodic(Duration(milliseconds: 50), (t) {
      if (MyBtnDirection.clikBtn) {
        setState(() {
          joueurX += .001;
        });
      } else {
        t.cancel();
      }
    });

    if (joueurX < 1) {
      setState(() {
        joueurX += .002;
      });
    } else {
      setState(() {
        joueurX = 1;
      });
    }
  }

  void moveLeft() {
    direction = 'l';
    print(joueurX);
    Timer.periodic(Duration(milliseconds: 50), (t) {
      if (MyBtnDirection.clikBtn) {
        setState(() {
          joueurX -= .002;
        });
      } else {
        t.cancel();
      }
    });
    if (joueurX > -1) {
      setState(() {
        joueurX -= .002;
      });
    } else {
      setState(() {
        joueurX = -1;
      });
    }
  }

  void moveUp() {
    Timer.periodic(Duration(milliseconds: 50), (t) {
      if (MyBtnDirection.clikBtn) {
        setState(() {
          joueurY -= .002;
        });
      } else {
        t.cancel();
      }
    });
    setState(() {
      joueurY -= .002;
    });
  }

  void moveDown() {
    Timer.periodic(Duration(milliseconds: 50), (t) {
      if (MyBtnDirection.clikBtn) {
        setState(() {
          joueurY += .002;
        });
      } else {
        t.cancel();
      }
    });
    setState(() {
      joueurY += .002;
    });
  }

  void move(double d, i) {
    print("$d,$joueurY");
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
            color: blanc,
            image:
                DecorationImage(image: AssetImage('assets/images/bg-1.jpg'))),
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return StreamBuilder<DocumentSnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('gamers')
                  .doc(FirebaseAuth.instance.currentUser!.uid)
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Container();
                } else {
                  return Column(
                    children: [
                      Container(
                        height: constraints.maxHeight * .1,
                        child: Row(
                          children: [
                            SizedBox(
                              width: constraints.maxWidth * .05,
                            ),
                            Text(
                              "${snapshot.data!.get('nbre_point')}",
                              style: TextStyle(
                                  fontSize: constraints.maxHeight * .04,
                                  color: Colors.pink,
                                  fontWeight: FontWeight.bold),
                            ),
                            Spacer(),
                            Text(
                              'Plage n° ${snapshot.data!.get('niveau')}',
                              style: TextStyle(
                                  fontSize: constraints.maxHeight * .05,
                                  color: Colors.pink,
                                  fontWeight: FontWeight.bold),
                            ),
                            Spacer(),
                          ],
                        ),
                      ),
                      Container(
                        height: constraints.maxHeight * .9,
                        width: constraints.maxWidth,
                        color: bleu,
                        child: LayoutBuilder(
                          builder: (context, constraints) => Stack(
                            children: [
                              Container(
                                height: constraints.maxHeight,
                                width: constraints.maxWidth,
                                color: blanc,
                              ),
                              Container(
                                child: AnimatedContainer(
                                    alignment: Alignment(joueurX, joueurY),
                                    duration: Duration(seconds: 0),
                                    child: JoueurWidget(
                                      direction: direction,
                                    )),
                              ),
                              Container(
                                child: BouteilleWidget(),
                                alignment: Alignment(0, 1),
                              ),
                              Positioned(
                                  bottom: constraints.maxHeight * 0.05,
                                  left: constraints.maxWidth * 0.05,
                                  child: Container(
                                    height: constraints.maxHeight * .4,
                                    width: constraints.maxWidth * .25,
                                    // color: jaune,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                            child: Container(
                                          // color: rouge,
                                          child: Column(
                                            children: [
                                              Spacer(),
                                              MyBtnDirection(
                                                child: Icon(
                                                  CupertinoIcons.arrow_left,
                                                  color: blanc,
                                                ),
                                                function: moveLeft,
                                              ),
                                              Spacer()
                                            ],
                                          ),
                                        )),
                                        Expanded(
                                            child: Container(
                                          // color: noir,
                                          child: Column(
                                            children: [
                                              MyBtnDirection(
                                                child: Icon(
                                                  CupertinoIcons.up_arrow,
                                                  color: blanc,
                                                ),
                                                function: moveUp,
                                              ),
                                              Spacer(),
                                              MyBtnDirection(
                                                child: Icon(
                                                  CupertinoIcons.down_arrow,
                                                  color: blanc,
                                                ),
                                                function: moveDown,
                                              ),
                                            ],
                                          ),
                                        )),
                                        Expanded(
                                            child: Container(
                                          // color: bleu,
                                          child: Column(
                                            children: [
                                              Spacer(),
                                              MyBtnDirection(
                                                child: Icon(
                                                  CupertinoIcons.arrow_right,
                                                  color: blanc,
                                                ),
                                                function: moveRight,
                                              ),
                                              Spacer()
                                            ],
                                          ),
                                        )),
                                      ],
                                    ),
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                }
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => null,
        backgroundColor: jaune,
        child: Icon(CupertinoIcons.hand_draw),
      ),
    );
  }

  List<Widget> getAllRubish(int nbr) {
    List<Widget> l = [];

    for (var i = 0; i < nbr; i++) {
      l.add(
        Container(
          child: BouteilleWidget(),
          alignment: Alignment(r.nextDouble(), r.nextDouble()),
        ),
      );
    }

    return l;
  }
}
