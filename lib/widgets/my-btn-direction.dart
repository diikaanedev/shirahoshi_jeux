import 'package:flutter/material.dart';
import 'package:jeux_v1/utils/coolors.dart';

class MyBtnDirection extends StatelessWidget {
  final child;
  final function;
  static bool clikBtn = false;
  const MyBtnDirection({Key? key, this.child, this.function}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      onTapUp: (details) {
        clikBtn = false;
      },
      onTapDown: (details) {
        clikBtn = true;
        function();
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: EdgeInsets.all(8),
          child: child,
          color: bleu,
        ),
      ),
    );
  }
}


// JoystickView(
//                                     backgroundColor: bleu,
//                                     innerCircleColor: bleu,
//                                     // interval: Duration(seconds: 0),
//                                     onDirectionChanged: (degrees, distance) =>
//                                         move(degrees, distance),
//                                     size: constraints.maxHeight * .4,
//                                     opacity: 1,
//                                     showArrows: false,
//                                   )),


// if (0.0 < d && d < 90.0) {
//       if (joueurX > 1) {
//         setState(() {
//           joueurY += .001;
//           joueurX = 1;
//         });
//       } else {
//         setState(() {
//           joueurY += .001;
//           joueurX -= .001;
//         });
//       }
//       if (joueurY > 1) {
//         setState(() {
//           joueurY = 1;
//           joueurX += .001;
//         });
//       } else {
//         setState(() {
//           joueurY += .001;
//           joueurX -= .001;
//         });
//       }
//     } else if (90 < d && d < 180.0) {
//       if (joueurX > 1) {
//         setState(() {
//           joueurY -= .001;
//           joueurX = 1;
//         });
//       } else {
//         setState(() {
//           joueurY -= .001;
//           joueurX += .001;
//         });
//       }
//       if (joueurY > 1) {
//         setState(() {
//           joueurY = 1;
//           joueurX -= .001;
//         });
//       } else {
//         setState(() {
//           joueurY -= .001;
//           joueurX += .001;
//         });
//       }
//     } else if (180 < d && d < 270.0) {
//       if (joueurX > 1) {
//         setState(() {
//           joueurY -= .001;
//           joueurX = 1;
//         });
//       } else {
//         setState(() {
//           joueurY -= .001;
//           joueurX -= .001;
//         });
//       }
//       if (joueurY > 1) {
//         setState(() {
//           joueurY = 1;
//           joueurX -= .001;
//         });
//       } else {
//         setState(() {
//           joueurY -= .001;
//           joueurX -= .001;
//         });
//       }
//     } else if (270 < d && d < 360.0) {
//       if (joueurX < -1) {
//         setState(() {
//           joueurY -= .001;
//           joueurX = -1;
//         });
//       } else {
//         setState(() {
//           joueurY -= .001;
//           joueurX += .001;
//         });
//       }
//       if (joueurY > 1) {
//         setState(() {
//           joueurY -= .001;
//           joueurX = 1;
//         });
//       } else {
//         setState(() {
//           joueurY -= .001;
//           joueurX += .001;
//         });
//       }
//     }


// GestureDetector(
//                                                 onTap: () => setState(() {
//                                                   left -= .01;
//                                                 }),
//                                                 onTapUp: (details) {
//                                                   Timer.periodic(
//                                                       Duration(
//                                                           milliseconds: 200),
//                                                       (t) {
//                                                     left -= .01;
//                                                   });
//                                                 },
//                                                 onTapDown: (d) {
//                                                   // Timer.periodic(
//                                                   //     Duration(milliseconds: 200),
//                                                   //     (t) {
//                                                   //   left = left - .01;
//                                                   // });
//                                                 },
//                                                 child: Container(
//                                                   color: rouge,
//                                                   child: Center(
//                                                     child: Icon(CupertinoIcons
//                                                         .arrow_left),
//                                                   ),
//                                                   height:
//                                                       constraints.maxHeight *
//                                                           .15,
//                                                 ),
//                                               ),