import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'event.dart';

class Day extends StatelessWidget {
  Day({ int this.date });

  final int date;

  void _gotTap () {
    print('sup bro');
  }
  
  List<EventCalendarIcon> _generateEventIcons() {
    List<EventCalendarIcon> eventIcons = <EventCalendarIcon>[];
    for (var i = 0; i < 4; i++) {
      eventIcons.add(new EventCalendarIcon(submitted: (i % 2 == 0) ? true : false));
    }
    return eventIcons;
  }
  
  @override
  Widget build(BuildContext context) {
    return new Flexible(
      child: new InkWell(
        onTap: _gotTap,
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
            children: <Widget>[
              new Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  new Text(date.toString())
                ],
              ),
              new Padding(
                padding: new EdgeInsets.only(top: 20.0),
                child: new EventCalendarRow(eventIcons: _generateEventIcons())
              ),
              new Padding(
                padding: new EdgeInsets.only(top: 1.0),
                  child: new EventCalendarRow(eventIcons: _generateEventIcons())
              )
            ]
          )
        )
      )
    );
  }
}

class HeaderDay extends Day {
  HeaderDay({ @required String this.day });
  final String day;

  @override
  Widget build(BuildContext context) {
    return new Flexible(
        child: new Container(
            decoration: new BoxDecoration(
                border: new Border.all(
                    color: Colors.black,
                    width: 0.5
                )
            ),
            padding: new EdgeInsets.all(4.0),
            child: new GestureDetector(
                onTap: _gotTap,
                child: new Text(day)
            )
        )
    );
  }
}
