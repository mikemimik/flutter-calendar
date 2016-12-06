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

  Widget _generateEventViewHeader() {
    Widget component = new Container(
      margin: new EdgeInsets.only(top: 12.0),
      child: new Text('${event.title}')
    );
    return component;
  }

  Widget _generateEventViewBody() {
    Widget component = new Column(
      children: <Widget>[
        _generateEventViewBodyItem('${MonthNames[event.month - 1]["long"]} ${event.day}, ${event.year}'),
        _generateEventViewBodyItem('Start Time: ${event.getStartTime(military: false)}'),
        _generateEventViewBodyItem('End Time: ${event.getEndTime(military: false)}'),
        new Divider(),
        _generateEventViewBodyItem('${event.url}'),
        new Divider(),
        _generateEventViewBodyItem('${event.details}')
      ]
    );
    return component;
  }

  Widget _generateEventViewBodyItem(String text) {
    Widget component = new Container(
      margin: new EdgeInsets.only(right: 8.0, left: 8.0),
      child: new Align(
        alignment: FractionalOffset.centerLeft,
        child: new Text(text)
      )
    );
    return component;
  }

  Widget _generateEventViewFooter() {
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
            _generateEventViewHeader(),
            _generateEventViewBody(),
            _generateEventViewFooter()
          ]
        )
      )
    );
    return component;
  }
}