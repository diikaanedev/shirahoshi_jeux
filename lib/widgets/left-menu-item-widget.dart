import 'package:flutter/material.dart';

class LeftMenuItemWidget extends StatelessWidget {
  final Function fn;
  final String title;
  final IconData icon;
  const LeftMenuItemWidget(
      {Key? key, required this.fn, required this.title, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => fn(),
      child: LayoutBuilder(
        builder: (context, constraints) => Row(
          children: [
            SizedBox(
              width: constraints.maxWidth * .1,
            ),
            Icon(
              icon,
              size: constraints.maxHeight,
            ),
            SizedBox(
              width: constraints.maxWidth * .05,
            ),
            Text(
              '$title',
              style: TextStyle(
                  fontSize: constraints.maxHeight * .4,
                  fontWeight: FontWeight.bold),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
