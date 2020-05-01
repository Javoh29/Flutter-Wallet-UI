import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterui/screens/home_screen.dart';
import 'package:flutterui/utils/constants.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent
    ));
    return MaterialApp(
      title: 'Flutter UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: kFond,
        fontFamily: 'Montserrat',
      ),
      home: HomeScreen(),
    );
  }
}
