import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:calendar/core.dart';

class EventItem extends StatelessWidget {
  EventItem({
    @required CalendarEvent this.item
  });

  final CalendarEvent item;

  @override
  Widget build(BuildContext context) {
    return new Container(
      constraints: new BoxConstraints(),
      margin: new EdgeInsets.all(8.0),
      child: new Text('title: ${item.title}')
    );
  }
}

class EventRow extends StatelessWidget {
  EventRow({
    @required CalendarEvent this.rowEvent
  });

  final CalendarEvent rowEvent;

  @override
  Widget build(BuildContext context) {
    Row component = new Row(
      children: <Widget>[]
    );
    component.children.add(new EventItem(item: rowEvent));
    return component;
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