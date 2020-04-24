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
        primaryColor: Color(0xFFFFD900),
        accentColor: Color(0xFFFAFAFA),
        indicatorColor: Color(0xFF4D0099)
      ),
      home: HomeScreen(),
    );
  }
}
