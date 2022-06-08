/*This code is personal property of np_group.*/
/*Made by Niraj Phutane a developer*/
/*https://github.com/nirajphutane*/

import 'package:flutter/material.dart';
import 'package:web_tool/API.dart';
import 'home.dart';
import 'dart:io';

void main() {
  HttpOverrides.global = AppHttpOverrides();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Web Tool',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: Home(),
    );
  }
}
