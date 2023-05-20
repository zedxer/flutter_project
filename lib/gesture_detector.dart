import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyGestureDetector());
// }

class MyGestureDetector extends StatefulWidget {
  const MyGestureDetector({super.key});

  @override
  State<MyGestureDetector> createState() => _MyGestureDetectorState();
}

class _MyGestureDetectorState extends State<MyGestureDetector> {
  bool _lightsOn = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(
            Icons.lightbulb,
            color: _lightsOn ? Colors.amberAccent : Colors.black,
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              _lightsOn = !_lightsOn;
              final snackBar = SnackBar(content: Text('Tap Function'));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            });
          },
          onDoubleTap: () {
            setState(() {
              _lightsOn = !_lightsOn;
              final snackBar = SnackBar(content: Text('Double Tap Function'));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            });
          },
          onLongPress: () {
            setState(() {
              _lightsOn = !_lightsOn;
              final snackBar = SnackBar(content: Text('Long Press Function'));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            });
          },
          child: Text(_lightsOn ? 'TURN LIGHT OFF' : 'TURN LIGHT ON'),
        )
      ],
    );
  }
}
