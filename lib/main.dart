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
        primaryColor: Color(0xFFF1F1F1),
        accentColor: Color(0xFF00B761)
      ),
      home: HomeScreen(),
    );
  }
}
