import 'package:flutter/material.dart';

import 'pages/connect_page.dart';
import 'pages/controller_page.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Robot Arm Controller',
      home: new ConnectPage(),
      debugShowCheckedModeBanner: false,
      routes: {
        "/connect": (_) => new ConnectPage(),
        "/controller": (_) => new ControllerPage(),
      },
    );
  }
}