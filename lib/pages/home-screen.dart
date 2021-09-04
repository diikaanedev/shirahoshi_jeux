import 'dart:async';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:jeux_v1/utils/coolors.dart';
import 'package:jeux_v1/widgets/left-menu-widget.dart';
import 'package:jeux_v1/widgets/top-bar.dart';
// ignore: unused_import
import 'package:zoom_widget/zoom_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:ui' as ui;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // ignore: close_sinks
  StreamController<int> controller = StreamController<int>();

  late Size size;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  Random random = new Random();

  final gain = <String>[
    'Pas de Gain', //0
    'Niveau valide', //1
    'Pas de Gain', //2
    'Pillage plastik', //3
    'Pas de Gain', // 4
    'protection plastik', // 5
    'Pas de Gain', //6
    'Gain énergie', //7
    'Pas de Gain', //8
    'Gain Box' //9
  ];

  @override
  void initState() {
    SystemChrome.restoreSystemUIOverlays();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    SharedPreferences.getInstance().then((prefs) {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return Scaffold(
      key: _scaffoldKey,
      endDrawer: LeftMenuWidget(),
      body: StreamBuilder<DocumentSnapshot>(
          stream: FirebaseFirestore.instance
              .collection('gamers')
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .snapshots(),
          builder: (context, snapshot) => !snapshot.hasData
              ? Container()
              : Stack(
                  children: [
                    // Image(
                    //   image: AssetImage('assets/images/1.jpg'),
                    //   width: size.width,
                    //   height: size.height,
                    //   fit: BoxFit.cover,
                    // ),

                    // Container(
                    //   color: Colors.white,
                    // ),
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
                        top: size.height * .03,
                        left: size.width * .01,
                        child: Container(
                          height: size.height * .07,
                          width: size.width,
                          child: topBar(scaffoldKey: _scaffoldKey),
                        )),
                    Positioned(
                        child: Container(
                      height: size.height,
                      width: size.width,
                      child: Center(
                        child: Container(
                          height: size.height,
                          width: size.width * .9,
                          child: FortuneWheel(
                            selected: controller.stream,
                            onFling: () => print('onFling'),
                            animateFirst: false,
                            // onAnimationStart: () async {},
                            onAnimationEnd: () async {},
                            physics: CircularPanPhysics(
                              duration: Duration(seconds: 1),
                              curve: Curves.decelerate,
                            ),
                            items: [
                              for (var item in gain)
                                FortuneItem(
                                    style: FortuneItemStyle(
                                        color: item == 'Pas de Gain'
                                            ? bleu
                                            : jaune,
                                        borderColor: bleu,
                                        borderWidth: .5),
                                    child: Container(
                                      child: Text(
                                        item,
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: item == 'Pas de Gain'
                                              ? blanc
                                              : bleu,
                                        ),
                                      ),
                                    ))
                            ],
                          ),
                        ),
                      ),
                    )),
                    Positioned(
                        top: size.height * .75,
                        left: size.width * .05,
                        child: Container(
                            height: 10,
                            width: size.width * .9,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: jaune,
                            ),
                            child:
                                LayoutBuilder(builder: (context, constraints) {
                              double i =
                                  snapshot.data!.get("nbre_energie") / 10;
                              if (i > 1) {
                                i = 1;
                              }
                              return Row(
                                children: [
                                  Container(
                                    width: constraints.maxWidth * i,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(8),
                                          bottomLeft: Radius.circular(8)),
                                      color: bleu,
                                    ),
                                  )
                                ],
                              );
                            }))),
                    Positioned(
                        top: size.height * .76,
                        child: Container(
                          height: size.height * .05,
                          width: size.width,
                          child: Center(
                            child: Text(
                                "${snapshot.data!.get('nbre_energie')} / 10"),
                          ),
                        )),

                    Positioned(
                        top: size.height * .81,
                        left: size.width * .3,
                        child: GestureDetector(
                          onTap: () => snapshot.data!.get("nbre_energie") <= 0
                              ? null
                              : jourRoue(
                                  snapshot.data!.get("nbre_energie") as int,
                                  snapshot.data!.get("niveau") as int,
                                  snapshot.data!.get("nbre_pillage") as int,
                                  snapshot.data!.get("nbre_protection") as int,
                                  snapshot.data!.get("gain_box") as int,
                                ),
                          child: Container(
                            height: size.height * .05,
                            width: size.width * .4,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.blue),
                            child: Center(
                                child: Text(
                              'Jouer',
                              style: TextStyle(
                                  fontSize: size.height * .03,
                                  color: Colors.white),
                            )),
                          ),
                        )),
                    Positioned(
                        bottom: size.height * .02,
                        left: size.width * .2,
                        child: GestureDetector(
                          onTap: () => Navigator.pushNamed(context, "/play"),
                          child: Container(
                            height: size.height * .07,
                            width: size.width * .6,
                            child: Center(
                                child: Text(
                              'Go Plage',
                              style: TextStyle(
                                  fontSize: size.height * .03,
                                  color: Colors.white),
                            )),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.red),
                          ),
                        ))
                  ],
                )),
    );
  }

  // double _generateRandomVelocity() => (Random().nextDouble() * 6000) + 2000;

  getPointOfRubish(int niveaux) {}
  void jourRoue(
    int nbr_energie,
    int niveau,
    int pillage,
    int protection,
    int gain_box,
  ) async {
    var random = new Random();
    int j = random.nextInt(10);
    controller.sink.add(j);

    switch (j) {
      case 1:
        FirebaseFirestore.instance
            .collection('gamers')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .update({"niveau": niveau + 1});
        break;
      case 3:
        FirebaseFirestore.instance
            .collection('gamers')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .update({"nbre_pillage": pillage + 1});
        break;
      case 5:
        FirebaseFirestore.instance
            .collection('gamers')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .update({"nbre_protection": protection + 1});
        break;
      case 7:
        FirebaseFirestore.instance
            .collection('gamers')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .update({"nbre_energie": nbr_energie + 5});
        break;
      case 9:
        FirebaseFirestore.instance
            .collection('gamers')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .update({"gain_box": gain_box + 1});
        break;
      default:
        FirebaseFirestore.instance
            .collection('gamers')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .update({"nbre_energie": nbr_energie - 1});
        break;
    }
  }
}
