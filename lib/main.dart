import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/viewmodels/student_view_models.dart';
import 'package:untitled/views/screens/bottomnav_example.dart';
import 'package:untitled/views/screens/future_list_example.dart';
import 'package:untitled/views/screens/listview_with_provider_example.dart';

import 'data.dart';
import 'gesture_detector.dart';
import 'views/screens/listview_with_searching.dart';
import 'views/screens/login.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => StudentViewModel(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/a': (context) => const ListViewWithSearchExample(
              title: 'Some Title',
            ),
        '/b': (context) => const ListViewDataExample(),
        '/c': (context) => const LoginScreen(),
        '/d': (context) => const ListScreenWithProviders(),
        '/e': (context) => const BottomNavigationBarExample(),
      },
      initialRoute: '/e',
    );
  }
}
