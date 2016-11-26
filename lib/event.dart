import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class EventItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container();
  }
}

class EventCalendarIcon extends StatelessWidget {
  EventCalendarIcon({
    @required Color this.bgColor
  });

  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 5.0,
      width: 5.0,
      margin: new EdgeInsets.all(0.5),
      decoration: new BoxDecoration(
        backgroundColor: bgColor
      )
    );
  }
}

class EventCalendarIconRow extends StatelessWidget {
  EventCalendarIconRow({ @required List<EventCalendarIcon> this.eventIcons });
  List<EventCalendarIcon> eventIcons;

  @override
  Widget build(BuildContext context) {
    return new Row(
      children: eventIcons
    );
  }
}
