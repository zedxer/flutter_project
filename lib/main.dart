import 'package:flutter/material.dart';

import 'data.dart';
import 'gesture_detector.dart';
import 'views/screens/listview_with_searching.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/a': (context) => HomePage(),
        '/b': (context) => SecondPage(),
      },
      initialRoute: '/a',
    );
  }
}