import 'package:flutter/material.dart';

class EventItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container();
  }
}

class EventCalendarIcon extends StatelessWidget {
  // TODO: create a flag for completed or not
  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 5.0,
      width: 5.0,
      margin: new EdgeInsets.all(0.5),
      decoration: new BoxDecoration(
        backgroundColor: Colors.green[500]
      )
    );
  }
}
