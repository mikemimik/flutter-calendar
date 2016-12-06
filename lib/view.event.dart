import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:calendar/core.dart';

class EventView extends StatelessWidget {
  EventView({
    @required CalendarEvent this.event,
    @required Day this.day,
    @required ViewCallback this.switchViewCallback
  });

  final CalendarEvent event;
  final Day day;
  final ViewCallback switchViewCallback;


  Widget _generateEventsViewFooter() {
    Widget component = new Container(
      padding: new EdgeInsets.all(8.0),
      margin: new EdgeInsets.only(top: 8.0, bottom: 12.0),
      child: new RaisedButton(
        child: new Text('back to events'),
        onPressed: () {
          switchViewCallback(
            view: RenderableView.events,
            selectedDay: day
          );
        }
      )
    );
    return component;
  }

  @override
  Widget build(BuildContext context) {
    Widget component = new Container(
      child: new Center(
        child: new Column(
          children: <Widget>[
            _generateEventsViewFooter()
          ]
        )
      )
    );
    return component;
  }
}