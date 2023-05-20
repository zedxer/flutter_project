import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    /*
    home: Scaffold(
      body: const MyNavigationExample(),
    ),*/
    initialRoute: '/',
    routes: {
      '/': (context) => MyNavigationExample(),
      '/second': (context) => SecondRoute(),
    },
  ));
}

/*
class MyNavigationExample extends StatelessWidget {
  const MyNavigationExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("First Page"),
      ),
      body: Center(
          child: ElevatedButton(
        child: Text("First Route"),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SecondRoute()),
          );
        },
      )),
    );
  }
}

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Route"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}
*/
class MyNavigationExample extends StatelessWidget {
  const MyNavigationExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meow First Page"),
      ),
      body: Center(
          child: ElevatedButton(
        child: Text(" First Route"),
        onPressed: () {
          Navigator.pushNamed(context, '/second');
        },
      )),
    );
  }
}

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meow Second Route"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}
