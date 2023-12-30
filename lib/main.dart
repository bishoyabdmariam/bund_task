import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Presentation/Screens/HomeScreen.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static double screenWidth = 0.0;
  static double screenHeight = 0.0;
  @override
  Widget build(BuildContext context) {

    // it's not clear in documentation about is the app is enabled to use in landscape mode or not so I prevent it
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return  const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
