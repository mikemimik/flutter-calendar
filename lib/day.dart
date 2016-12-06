import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:calendar/core.dart';

class Day extends StatelessWidget {
  Day({
    @required int this.date,
    @required bool this.today
  });

  final int date;
  final bool today;
  List<CalendarEvent> _events;
  ViewCallback _viewCallback;
  bool hasEvents = false;

  List<CalendarViewEventIcon> _generateEventIcons(int count) {
    List<CalendarViewEventIcon> eventIcons = new List<CalendarViewEventIcon>();
    for (var i = 0; i < count; i++) {
      if (_events != null) {
        eventIcons.add(new CalendarViewEventIcon(bgColor: Colors.red[500]));
      } else {
        eventIcons.add(new CalendarViewEventIcon(bgColor: Colors.blue[500]));
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
          int checkCount = _events.length - raw.truncate() * 4;
          int iconCount = (checkCount == 0) ? 4 : checkCount;
          component.children.add(new CalendarViewEventIconRow(
            eventIcons: _generateEventIcons(iconCount)
          ));
        } else {
          component.children.add(new CalendarViewEventIconRow(
            eventIcons: _generateEventIcons(4)
          ));
        }
      }
    }
    return component;
  }

  void addEvent(CalendarEvent event) {
    if (_events == null) { _events = new List<CalendarEvent>(); }
    hasEvents = true;
    _events.add(event);
  }

  List<CalendarEvent> getEvents() {
    return _events;
  }

  void addTapEventHandler({ @required ViewCallback handler }) {
    _viewCallback = handler;
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
        if (_viewCallback != null) {
          _viewCallback(
            view: RenderableView.events,
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

  @override
  String toString() {
    return 'Day (instance): date:${date} | today:${today}';
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
