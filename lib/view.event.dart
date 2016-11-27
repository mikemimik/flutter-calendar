import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:calendar/core.dart';

class EventView extends StatelessWidget {
  EventView({
    @required int this.year,
    @required int this.month,
    @required Day this.day,
    @required ViewCallback this.switchViewCallback
  });

  final int year;
  final int month;
  final Day day;
  final ViewCallback switchViewCallback;

  Widget _generateHeader() {
    return new Text('Day: ' + MonthNames[month]['long'] + ' ${day.date}, $year');
  }

  Widget _generateEventRows() {
    Column component = new Column(
      children: <Widget>[]
    );
    day.getEvents().forEach((event) {
      component.children.add(new EventRow(rowEvent: event));
    });
    return component;
  }

  Widget _generateFooter() {
    return new Container(
      padding: new EdgeInsets.all(8.0),
      child: new RaisedButton(
        child: new Text('back to calendar'),
        onPressed: () {
          switchViewCallback(
            view: RenderableView.calendar
          );
        }
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget component = new Container(
      constraints: new BoxConstraints(),
      margin: new EdgeInsets.all(8.0),
      child: new Center(
        child: new Column(
          children: <Widget>[
            _generateHeader(),
            _generateEventRows(),
            _generateFooter()
          ]
        )
      )
    );
    return component;
  }
}