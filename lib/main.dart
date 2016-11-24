import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'calendar.dart';

// INFO: demo specific widgets
Widget mainAppBar = new AppBar(
  title: new Text('calendar demo'),
  backgroundColor: Colors.blue[500]
);

ThemeData theme = new ThemeData(
  primarySwatch: Colors.blue
);

void main() {
  debugPaintSizeEnabled = false;
  runApp(
    new MaterialApp(
      title: 'calendar',
      theme: theme,
      home: new Scaffold(
        appBar: mainAppBar,
        body: new Calendar()
      )
    )
  );
}
