import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'data.dart';
import 'event.dart';
import 'view_types.dart';

class Day extends StatelessWidget {
  Day({
    @required int this.date,
    @required bool this.today,
    ViewCallback this.viewCallback
  });

  final int date;
  final bool today;
  List<CalendarEvent> _events;
  final ViewCallback viewCallback;

  List<EventCalendarIcon> _generateEventIcons(int count) {
    List<EventCalendarIcon> eventIcons = new List<EventCalendarIcon>();
    for (var i = 0; i < count; i++) {
      if (_events != null) {
        eventIcons.add(new EventCalendarIcon(bgColor: Colors.red[500]));
      } else {
        eventIcons.add(new EventCalendarIcon(bgColor: Colors.blue[500]));
      }
    }
    return eventIcons;
  }

  Widget _generateEventIconRows() {
    Column component = new Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[]
    );
    if (_events != null) {
      double raw = _events.length / 4;
      double remainder = raw % 2;
      int extra = (remainder != 0) ? 1 : 0;
      int rowCount = raw.truncate() + extra;
      for (int i = 0; i < rowCount; i++) {
        if (i == rowCount - 1) {
          int iconCount = _events.length - raw.truncate() * 4;
          component.children.add(new EventCalendarIconRow(eventIcons: _generateEventIcons(iconCount)));
        } else {
          component.children.add(new EventCalendarIconRow(eventIcons: _generateEventIcons(4)));
        }
      }
    }
    return component;
  }

  void addEvent(CalendarEvent event) {
    if (_events == null) {
      _events = new List<CalendarEvent>();
    }
    _events.add(event);
  }

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle;
    if (today) {
      textStyle = new TextStyle(color: Colors.orange[500]);
    } else {
      textStyle = new TextStyle();
    }
    Widget component = new InkWell(
      onTap: () {
        if (viewCallback != null) {
          viewCallback(
            view: RenderableView.event,
            selectedDay: this
          );
        }
      },
      child: new Container(
        height: 60.0,
        decoration: new BoxDecoration(
          border: new Border.all(
            color: Colors.black,
            width: 0.5
          )
        ),
        padding: new EdgeInsets.all(4.0),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            new Align(
              alignment: FractionalOffset.centerRight,
              child: new Container(
                child: new Text(
                  date.toString(),
                  style: textStyle
                )
              )
            ),
            _generateEventIconRows()
          ]
        )
      )
    );

    return new Flexible(child: component);
  }
}

class HeaderDay extends Day {
  HeaderDay({ @required String this.day });
  final String day;

  @override
  Widget build(BuildContext context) {

    // Make standard component
    Widget component = new Container(
      decoration: new BoxDecoration(
        border: new Border.all(
          color: Colors.black,
          width: 0.5
        )
      ),
      padding: new EdgeInsets.all(4.0),
      child: new Align(
        alignment: FractionalOffset.center,
        child: new Text(day)
      )
    );

    return new Flexible(child: component);
  }
}
