import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:jeux_v1/pages/history-1-suivant.dart';
import 'package:jeux_v1/utils/coolors.dart';
import 'package:page_transition/page_transition.dart';

class History extends StatefulWidget {
  const History({Key? key}) : super(key: key);

  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  late Size size;

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
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
            color: blanc,
          ),
          Positioned(
              top: size.height * .5,
              left: size.width * .1,
              child: Container(
                height: size.height * .4,
                width: size.width * .2,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            'assets/images/histoire-shirahoshi.gif'))),
              )),
          Positioned(
              top: size.height * .05,
              left: size.width * .2,
              child: Container(
                  height: size.height * .6,
                  width: size.width * .8,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/histoire-cloud.png'),
                          fit: BoxFit.fill)))),
          Positioned(
              top: size.height * .05,
              left: size.width * .3,
              child: Container(
                height: size.height * .6,
                width: size.width * .6,
                // color: jaune,
                child: Center(
                  child: Text(
                    'Par force tu écoute histoire de ce promesse sinon tw pa avoir \n25 points d\'énergie.',
                    textAlign: TextAlign.center,
                  ),
                ),
              )),
          Positioned(
              bottom: size.height * .1,
              right: size.width * .05,
              child: Container(
                height: size.height * .1,
                width: size.width * .4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                        width: size.width * .1,
                        height: size.height * .1,
                        decoration: BoxDecoration(
                            color: rouge,
                            borderRadius: BorderRadius.circular(8)),
                        child: Center(
                            child: Text(
                          'Skip',
                          style: TextStyle(
                              fontSize: size.height * .03, color: blanc),
                        ))),
                    GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        PageTransition(
                            child: History1Suivant(),
                            duration: Duration(milliseconds: 1000),
                            reverseDuration: Duration(milliseconds: 1000),
                            childCurrent: History(),
                            type: PageTransitionType.leftToRightJoined),
                      ),
                      child: Container(
                        width: size.width * .1,
                        height: size.height * .1,
                        decoration: BoxDecoration(
                            color: vert,
                            borderRadius: BorderRadius.circular(8)),
                        child: Center(
                          child: Text(
                            'Suivant',
                            style: TextStyle(
                                fontSize: size.height * .03, color: blanc),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
