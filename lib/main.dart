import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'calendar.dart';

Widget mainAppBar = new AppBar(
  title: new Text('calendar demo'),
  backgroundColor: Colors.blue[500]
);

void main() {
  debugPaintSizeEnabled = false;
  runApp(
    new MaterialApp(
      title: 'calendar',
      theme: new ThemeData(
        primarySwatch: Colors.blue
      ),
      home: new Scaffold(
        appBar: mainAppBar,
        body: new Calendar()
      )
    )
  );
}
