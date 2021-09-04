import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:jeux_v1/pages/history-1-suivant.dart';
import 'package:jeux_v1/pages/history-1.dart';
import 'package:jeux_v1/pages/home-screen.dart';
import 'package:jeux_v1/pages/maps-plage.dart';
import 'package:jeux_v1/pages/play.dart';
import 'package:jeux_v1/pages/welcome-screen.dart';
import 'package:jeux_v1/utils/coolors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setEnabledSystemUIOverlays([]);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: 'Poppins',
          backgroundColor: bleu,
          primaryColor: bleu,
          accentColor: blanc),
      initialRoute: '/',
      routes: {
        '/': (context) => WelcomeScreen(),
        '/home': (context) => StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) =>
                snapshot.hasData ? HomeScreen() : History()),
        '/play': (context) => PlayScreen(),
        '/maps': (context) => CartePlage(),
        // '/histoire-1': (context) => History1Suivant(),
      },
    );
  }
}
