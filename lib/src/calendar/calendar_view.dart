import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:calendar/src/month/month.dart';
import 'package:calendar/controllers.dart';
import 'package:calendar/utils.dart';

class CalendarView extends StatelessWidget {
  CalendarView({
    @required this.year,
    @required this.month,
    @required this.date,
  });

  final int year;
  final int month;
  final int date;

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Column(
        children: <Widget>[
          new CalendarViewHeader(monthName: MonthNames[month - 1]['long']),
          new Month(
            year: year,
            month: month,
            date: date,
          ),
        ],
      ),
    );
  }
}

class CalendarViewHeader extends StatelessWidget {
  CalendarViewHeader({
    @required this.monthName,
  });

  final String monthName;
  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 40.0,
      margin: const EdgeInsets.only(top: 5.0, bottom: 10.0),
      child: new Align(
        alignment: FractionalOffset.center,
        child: new Text(monthName),
      ),
    );
  }
}
