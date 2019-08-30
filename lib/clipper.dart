import 'package:flutter/material.dart';

import 'bottomnavclipper.dart';

class CustomClassClipper extends StatefulWidget {
  CustomClassClipper({Key key}) : super(key: key);

  _CustomClassClipperState createState() => _CustomClassClipperState();
}

class _CustomClassClipperState extends State<CustomClassClipper> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: FractionallySizedBox(
        heightFactor: 0.1,
        child: CustomPaint(
          painter: BottomNavigationClipper(),

                  child: Container(
            color: Colors.black87,
          ),
        ),
      ),
    );
  }
}
