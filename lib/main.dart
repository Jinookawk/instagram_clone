import 'package:flutter/material.dart';
import 'package:instagram_clone/constants/material_white.dart';
import 'package:instagram_clone/home_page.dart';
import 'package:instagram_clone/screens/auth_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //home: AuthScreen(),
      home: HomePage(),
      theme: ThemeData(primarySwatch: white),
    );
  }
}
