import 'package:facebook_feed/screens/postDetails.dart';
import 'package:flutter/material.dart';
import 'package:facebook_feed/screens/homePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {"/userDetails": (context) => PostDetail()},
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
