import 'package:flutter/material.dart';
import 'package:calendar/src/types.dart';

class EventsHeader extends StatelessWidget {
  EventsHeader(
    this.year,
    this.month,
    this.date,
  );

  final int year;
  final int month;
  final int date;

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Container(
        margin: const EdgeInsets.only(
          top: 12.0,
          bottom: 12.0,
        ),
        child: new Text('Day: ' + MonthNames[month - 1]['long'] + ' ${date}, ${year}'),
      ),
    );
  }
}
