import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jeux_v1/utils/coolors.dart';

class topBar extends StatefulWidget {
  const topBar({
    Key? key,
    required GlobalKey<ScaffoldState> scaffoldKey,
  })  : _scaffoldKey = scaffoldKey,
        super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey;

  @override
  _topBarState createState() => _topBarState();
}

class _topBarState extends State<topBar> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('gamers')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .snapshots(),
        builder: (context, snapshot) => !snapshot.hasData
            ? Container()
            : LayoutBuilder(
                builder: (context, constraints) => Row(
                  children: [
                    Container(
                      width: constraints.maxWidth * .4,
                      // color: jaune,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 8,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            "${snapshot.data!.get('nbre_point')}",
                            style: TextStyle(
                                fontSize: constraints.maxHeight * .2,
                                color: noir,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Container(
                      // width: constraints.maxWidth * .15,
                      child: Column(
                        children: [
                          Spacer(),
                          Icon(
                            CupertinoIcons.airplane,
                            size: constraints.maxHeight * .3,
                            color: jaune,
                          ),
                          Text(
                            "${snapshot.data!.get('nbre_pillage')}",
                            style: TextStyle(
                                fontSize: constraints.maxHeight * .2,
                                fontWeight: FontWeight.bold),
                          ),
                          Spacer(),
                        ],
                      ),
                    ),
                    Spacer(),
                    Container(
                      // width: constraints.maxWidth * .15,
                      child: Column(
                        children: [
                          Spacer(),
                          Icon(
                            CupertinoIcons.star_fill,
                            size: constraints.maxHeight * .3,
                            color: jaune,
                          ),
                          Text(
                            "${snapshot.data!.get('nbre_etoile')}",
                            style: TextStyle(
                                fontSize: constraints.maxHeight * .2,
                                fontWeight: FontWeight.bold),
                          ),
                          Spacer(),
                        ],
                      ),
                    ),
                    Spacer(),
                    Container(
                      // width: constraints.maxWidth * .15,
                      child: Column(
                        children: [
                          Spacer(),
                          Icon(
                            Icons.security_sharp,
                            size: constraints.maxHeight * .3,
                            color: bleu,
                          ),
                          Text(
                            "${snapshot.data!.get('nbre_protection')}",
                            style: TextStyle(
                                fontSize: constraints.maxHeight * .2,
                                fontWeight: FontWeight.bold),
                          ),
                          Spacer(),
                        ],
                      ),
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () =>
                          widget._scaffoldKey.currentState!.openEndDrawer(),
                      child: Container(
                        width: constraints.maxWidth * .15,
                        child: Center(
                          child: Icon(CupertinoIcons.home,
                              size: constraints.maxHeight * .4, color: jaune),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: constraints.maxWidth * .02,
                    )
                  ],
                ),
              ));
  }
}
