import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'event.dart';

class Day extends StatelessWidget {
  Day({ int this.date });

  final int date;

  void _gotTap () {
    print('sup bro');
    print(this.date);
  }
  
  List<EventCalendarIcon> _generateEventIcons() {
    List<EventCalendarIcon> eventIcons = <EventCalendarIcon>[];
    for (var i = 0; i < 4; i++) {
      eventIcons.add(new EventCalendarIcon(color: Colors.blue[500]));
    }
    return eventIcons;
  }
  
  @override
  Widget build(BuildContext context) {
    
    Widget component = new InkWell(
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            new Align(
              alignment: FractionalOffset.centerRight,
              child: new Container(
                child: new Text(date.toString())
              )
            ),
            new Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                new EventCalendarRow(eventIcons: _generateEventIcons()),
                new EventCalendarRow(eventIcons: _generateEventIcons()),
              ]
            )
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
