import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'event.dart';

class Day extends StatelessWidget {
  Day({ int this.date });

  final int date;

  @override
  Widget build(BuildContext context) {
    return new Flexible(
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
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            new Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                new Text(date.toString())
              ],
            ),
            new Row(
              children: <Widget>[
                new EventCalendarIcon(),
                new EventCalendarIcon(),
                new EventCalendarIcon(),
                new EventCalendarIcon(),
              ]
            )
          ]
        )
      )
    );
  }
}

class HeaderDay extends Day {
  HeaderDay({ @required String this.day });
  final String day;

  void _gotTap () {
    print('sup bro');
  }

  @override
  Widget build(BuildContext context) {
    return new Flexible(
        child: new Container(
            decoration: new BoxDecoration(
                border: new Border.all(
                    color: Colors.red[500],
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
