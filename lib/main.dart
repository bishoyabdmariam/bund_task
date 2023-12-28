import 'package:bundtask/data/dummyData.dart';
import 'package:flutter/material.dart';

import 'Presentation/Screens/HomeScreen.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(companies: DummyData.dummyCompanies),
    );
  }
}
