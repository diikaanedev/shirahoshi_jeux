import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartePlage extends StatefulWidget {
  const CartePlage({Key? key}) : super(key: key);

  @override
  _CartePlageState createState() => _CartePlageState();
}

class _CartePlageState extends State<CartePlage> {
  late Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      body: ListView(
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Container(
              height: size.height * .3,
              width: size.width * .9,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/3.jpg'),
                      fit: BoxFit.cover)),
            ),
          ),
          Container(
            height: size.height * .3,
            width: size.width * .9,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/icon-routes.png'),
                    fit: BoxFit.contain)),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Container(
              height: size.height * .3,
              width: size.width * .9,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/4.jpg'),
                      fit: BoxFit.cover)),
            ),
          ),
          Container(
            height: size.height * .3,
            width: size.width * .9,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/icon-routes.png'),
                    fit: BoxFit.contain)),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Container(
              height: size.height * .3,
              width: size.width * .9,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/6.jpg'),
                      fit: BoxFit.cover)),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.popAndPushNamed(context, "/home"),
        backgroundColor: Colors.pink,
        child: Icon(CupertinoIcons.house),
      ),
    );
  }
}
