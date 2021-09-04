import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jeux_v1/widgets/left-menu-item-widget.dart';

class LeftMenuWidget extends StatefulWidget {
  const LeftMenuWidget({Key? key}) : super(key: key);

  @override
  _LeftMenuWidgetState createState() => _LeftMenuWidgetState();
}

class _LeftMenuWidgetState extends State<LeftMenuWidget> {
  late Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width * .8,
      child: LayoutBuilder(
        builder: (context, constraints) => Row(
          children: [
            Container(
              width: constraints.maxWidth * .25,
              // color: Colors.brown,
              child: Column(
                children: [
                  SizedBox(height: constraints.maxHeight * .05),
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      width: constraints.maxWidth * .2,
                      height: constraints.maxHeight * .05,
                      color: Colors.red,
                      child: Icon(CupertinoIcons.arrow_down_right_square),
                      // child: RotatedBox(
                      //   quarterTurns: 1,
                      //   child: Image.network(
                      //       'https://c8.alamy.com/zoomsfr/9/3c3cbde92440431583047aa8722cd6e4/2c5dkjj.jpg'),
                      // ),
                    ),
                  )
                ],
              ),
            ),
            Spacer(),
            Container(
              color: Colors.brown[100],
              width: constraints.maxWidth * .75,
              child: Column(
                children: [
                  SizedBox(
                    height: constraints.maxHeight * .04,
                  ),
                  Container(
                    child: Column(
                      children: [
                        Container(
                            height: constraints.maxHeight * .05,
                            width: constraints.maxWidth * .75,
                            child: LeftMenuItemWidget(
                              fn: () => print('here'),
                              icon: CupertinoIcons.play_arrow,
                              title: 'play',
                            )),
                        SizedBox(
                          height: constraints.maxHeight * .01,
                        ),
                        Container(
                          height: 1,
                          color: Colors.brown,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: constraints.maxHeight * .02,
                  ),
                  Container(
                    child: Column(
                      children: [
                        Container(
                            height: constraints.maxHeight * .05,
                            width: constraints.maxWidth * .75,
                            child: LeftMenuItemWidget(
                              fn: () => print('here'),
                              icon: CupertinoIcons.placemark,
                              title: 'Plages',
                            )),
                        SizedBox(
                          height: constraints.maxHeight * .01,
                        ),
                        Container(
                          height: 1,
                          color: Colors.brown,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: constraints.maxHeight * .02,
                  ),
                  Container(
                    child: Column(
                      children: [
                        Container(
                            height: constraints.maxHeight * .05,
                            width: constraints.maxWidth * .75,
                            child: LeftMenuItemWidget(
                              fn: () => print('here'),
                              icon: CupertinoIcons.money_pound_circle,
                              title: 'Points/Tours',
                            )),
                        SizedBox(
                          height: constraints.maxHeight * .01,
                        ),
                        Container(
                          height: 1,
                          color: Colors.brown,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: constraints.maxHeight * .02,
                  ),
                  Container(
                    child: Column(
                      children: [
                        Container(
                            height: constraints.maxHeight * .05,
                            width: constraints.maxWidth * .75,
                            child: LeftMenuItemWidget(
                              fn: () => print('here'),
                              icon: CupertinoIcons.rays,
                              title: 'Bonus du Jour',
                            )),
                        SizedBox(
                          height: constraints.maxHeight * .01,
                        ),
                        Container(
                          height: 1,
                          color: Colors.brown,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: constraints.maxHeight * .02,
                  ),
                  Container(
                    child: Column(
                      children: [
                        Container(
                            height: constraints.maxHeight * .05,
                            width: constraints.maxWidth * .75,
                            child: LeftMenuItemWidget(
                              fn: () => print('here'),
                              icon: CupertinoIcons.shopping_cart,
                              title: 'Boutiques',
                            )),
                        SizedBox(
                          height: constraints.maxHeight * .01,
                        ),
                        Container(
                          height: 1,
                          color: Colors.brown,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: constraints.maxHeight * .02,
                  ),
                  Container(
                    child: Column(
                      children: [
                        Container(
                          height: constraints.maxHeight * .05,
                          width: constraints.maxWidth * .75,
                          child: LeftMenuItemWidget(
                            fn: () => print('here'),
                            icon: CupertinoIcons.gift,
                            title: 'Cadeaux',
                          ),
                        ),
                        SizedBox(
                          height: constraints.maxHeight * .01,
                        ),
                        Container(
                          height: 1,
                          color: Colors.brown,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: constraints.maxHeight * .02,
                  ),
                  Container(
                    child: Column(
                      children: [
                        Container(
                          height: constraints.maxHeight * .05,
                          width: constraints.maxWidth * .75,
                          child: LeftMenuItemWidget(
                            fn: () => print('here'),
                            icon: CupertinoIcons.map_fill,
                            title: 'Cartes',
                          ),
                        ),
                        SizedBox(
                          height: constraints.maxHeight * .01,
                        ),
                        Container(
                          height: 1,
                          color: Colors.brown,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: constraints.maxHeight * .02,
                  ),
                  Container(
                    child: Column(
                      children: [
                        Container(
                          height: constraints.maxHeight * .05,
                          width: constraints.maxWidth * .75,
                          child: LeftMenuItemWidget(
                            fn: () => print('here'),
                            icon: CupertinoIcons.command,
                            title: 'Classements',
                          ),
                        ),
                        SizedBox(
                          height: constraints.maxHeight * .01,
                        ),
                        Container(
                          height: 1,
                          color: Colors.brown,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: constraints.maxHeight * .02,
                  ),
                  Container(
                    child: Column(
                      children: [
                        Container(
                          height: constraints.maxHeight * .05,
                          width: constraints.maxWidth * .75,
                          child: LeftMenuItemWidget(
                            fn: () => print('here'),
                            icon: CupertinoIcons.person_3_fill,
                            title: 'Communautés',
                          ),
                        ),
                        SizedBox(
                          height: constraints.maxHeight * .01,
                        ),
                        Container(
                          height: 1,
                          color: Colors.brown,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: constraints.maxHeight * .02,
                  ),
                  Container(
                    child: Column(
                      children: [
                        Container(
                          height: constraints.maxHeight * .05,
                          width: constraints.maxWidth * .75,
                          child: LeftMenuItemWidget(
                            fn: () => print('here'),
                            icon: Icons.share,
                            title: 'Partager',
                          ),
                        ),
                        SizedBox(
                          height: constraints.maxHeight * .01,
                        ),
                        Container(
                          height: 1,
                          color: Colors.brown,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: constraints.maxHeight * .02,
                  ),
                  Container(
                    child: Column(
                      children: [
                        Container(
                          height: constraints.maxHeight * .05,
                          width: constraints.maxWidth * .75,
                          child: LeftMenuItemWidget(
                            fn: () => print('here'),
                            icon: Icons.help,
                            title: 'Faq sur plastik',
                          ),
                        ),
                        SizedBox(
                          height: constraints.maxHeight * .01,
                        ),
                        Container(
                          height: 1,
                          color: Colors.brown,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: constraints.maxHeight * .02,
                  ),
                  Container(
                    child: Column(
                      children: [
                        Container(
                          height: constraints.maxHeight * .05,
                          width: constraints.maxWidth * .75,
                          child: LeftMenuItemWidget(
                            fn: () => print('here'),
                            icon: Icons.settings,
                            title: 'Reglage',
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
