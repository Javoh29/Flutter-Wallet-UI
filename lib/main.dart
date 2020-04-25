import 'package:flutter/material.dart';
import 'package:flutterui/screens/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFFEAEAEA),
        accentColor: Color(0xFF203A43),
      ),
      home: HomeScreen(),
    );
  }
}
