// @dart=2.9
import 'package:flutter/material.dart';
import './Home/HomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Asyu',
      theme:
          // ThemeData.dark(),
          ThemeData(
        primarySwatch: Colors.green,
      ),
      home: HomePage(),
    );
  }
}
