import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class EventItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container();
  }
}

class EventCalendarIcon extends StatelessWidget {
  EventCalendarIcon({ @required bool this.submitted });
  bool submitted;
  
  // TODO: create a flag for completed or not
  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 5.0,
      width: 5.0,
      margin: new EdgeInsets.all(0.5),
      decoration: new BoxDecoration(
        backgroundColor: (submitted) ? Colors.green[500] : Colors.red[500]
      )
    );
  }
}

class EventCalendarRow extends StatelessWidget {
  EventCalendarRow({ @required List<EventCalendarIcon> this.eventIcons });
  List<EventCalendarIcon> eventIcons;
  
  @override
  Widget build(BuildContext context) {
    return new Row(
      children: eventIcons
    );
  }
}
