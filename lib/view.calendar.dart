import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'view_types.dart';
import 'month.dart';
import 'week.dart';
import 'day.dart';

class CalendarView extends StatelessWidget {
  CalendarView({
    @required int this.year,
    @required int this.month,
    @required ViewCallback this.switchViewCallback
  });
  
  // VARIABLES
  final int year;
  final int month;
  final ViewCallback switchViewCallback;
  
  // FUNCTIONS
  List<Day> _generateMonthDays({ @required DateTime firstDay, @required DateTime lastDay }) {
    List<Day> days = <Day>[];
    for (int i = firstDay.day; i <= lastDay.day; i++) {
      days.add(new Day(date: i, viewCallback: switchViewCallback));
    }
    return days;
  }

  List<Day> _generateMonthPadding({ DateTime firstDay, DateTime lastDay }) {
    List<Day> days = <Day>[];
    if (firstDay != null) {
      // INFO: build month padding - beginning
      var firstWeekday = firstDay.weekday;
      DateTime lastDayPrevMonth = new DateTime(year, month, 0);
      if (firstWeekday < 7) { // ignore if sunday (no padding needed)
        for (var i = 0; i < firstWeekday; i++) {
          days.insert(0, new Day(date: lastDayPrevMonth.day - i));
        }
      }
    } else if (lastDay != null) {
      // INFO: build month padding - ending
      var lastWeekday = lastDay.weekday;
      DateTime firstDayNextMonth = new DateTime(year, month + 1, 1);
      var remainingDays = (6 - lastWeekday == -1) ? 6 : (6 - lastWeekday);
      for (var i = 0; i < remainingDays; i++) {
        days.add(new Day(date: firstDayNextMonth.day + i));
      }
    }
    return days;
  }

  List<Week> _generateMonthWeeks({ @required List<Day> monthDays }){
    List<Week> monthWeeks = new List<Week>();
    for (var weeknum = 0; weeknum < (monthDays.length / 7); weeknum++) {
      List<Day> weekDays = new List<Day>();
      for (var weekday = (weeknum * 7); weekday < (weeknum * 7) + 7; weekday++) {
        weekDays.add(monthDays[weekday]);
      }
      monthWeeks.add(new Week(days: weekDays));
    }
    return monthWeeks;
  }
  
  @override
  Widget build(BuildContext context) {
    DateTime _firstDay = new DateTime(year, month, 1);
    DateTime _lastDay = new DateTime(year, month + 1, 0);
    List<Day> monthDays = _generateMonthDays(firstDay: _firstDay, lastDay: _lastDay);
    monthDays.insertAll(0, _generateMonthPadding(firstDay: _firstDay));
    monthDays.addAll(_generateMonthPadding(lastDay: _lastDay));
    List<Week> monthWeeks = _generateMonthWeeks(monthDays: monthDays);
    
    Widget component = new Container(
      constraints: new BoxConstraints(),
      margin: new EdgeInsets.all(8.0),
      child: new Column(
        children: <Widget>[
          new CalendarViewHeader(monthName: MonthNames[month - 1]['long']),
          new Month(year: year, month: month, weeks: monthWeeks)
        ]
      )
    );
    return component;
  }
}

class CalendarViewHeader extends StatelessWidget {
  CalendarViewHeader({ @required String this.monthName });
  
  final String monthName;
  
  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 40.0,
      margin: new EdgeInsets.only(top: 5.0, bottom: 10.0),
      child: new Align(
        alignment: FractionalOffset.center,
        child: new Text(monthName)
      )
    );
  }
}
