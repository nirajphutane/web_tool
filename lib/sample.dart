/*This code is personal property of np_group.*/
/*Made by Niraj Phutane a developer*/
/*https://github.com/nirajphutane*/

import 'package:flutter/material.dart';

class Sample extends StatefulWidget {

  @override
  _SampleState createState() => _SampleState();
}

class _SampleState extends State<Sample> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Sample'),
        ),
        body: Center(
          child: Icon(Icons.wb_incandescent_rounded),
        )
    );
  }
}
