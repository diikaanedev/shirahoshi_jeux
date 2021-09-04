import 'dart:async';

import 'package:flutter/widgets.dart';
// import 'package:flutter_spinning_wheel/flutter_spinning_wheel.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';

class RoulletteWidget extends StatefulWidget {
  const RoulletteWidget({Key? key}) : super(key: key);

  @override
  _RoulletteWidgetState createState() => _RoulletteWidgetState();
}

class _RoulletteWidgetState extends State<RoulletteWidget> {
  @override
  Widget build(BuildContext context) {
    StreamController<int> controller = StreamController<int>();

    return Container(
      child: FortuneWheel(
        selected: controller.stream,
        physics: CircularPanPhysics(
          duration: Duration(seconds: 1),
          curve: Curves.decelerate,
        ),
        items: [
          FortuneItem(child: Text('Han Solo')),
          FortuneItem(child: Text('Yoda')),
          FortuneItem(child: Text('Obi-Wan Kenobi')),
          FortuneItem(child: Text('Yoda')),
          FortuneItem(child: Text('Obi-Wan Kenobi')),
        ],
      ),
    );
  }
}
