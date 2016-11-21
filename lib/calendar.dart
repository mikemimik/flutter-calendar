import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'month.dart';
import 'week.dart';
import 'day.dart';

class Calendar extends StatelessWidget {
  Calendar({ DateTime initializeDate }) {
    this._initializeDate = (initializeDate == null) ? new DateTime.now() : initializeDate;
    this._year = _initializeDate.year;
    this._month = _initializeDate.month;
  }
  DateTime _initializeDate;
  int _year;
  int _month;
  static final _months = {
    0: { 'short': 'Jan', 'long': 'January' },
    1: { 'short': 'Feb', 'long': 'February' },
    2: { 'short': 'Mar', 'long': 'March' },
    3: { 'short': 'Apr', 'long': 'April' },
    4: { 'short': 'May', 'long': 'May' },
    5: { 'short': 'June', 'long': 'June' },
    6: { 'short': 'July', 'long': 'July' },
    7: { 'short': 'Aug', 'long': 'August' },
    8: { 'short': 'Sep', 'long': 'September' },
    9: { 'short': 'Oct', 'long': 'October' },
    10: { 'short': 'Nov', 'long': 'November' },
    11: { 'short': 'Dec', 'long': 'December' }
  };

  List<Day> _generateMonthDays({ DateTime firstDay, DateTime lastDay }) {
    List<Day> days = <Day>[];
    for (int i = firstDay.day; i <= lastDay.day; i++) {
      days.add(new Day(date: i));
    }
    return days;
  }

  List<Day> _generateMonthPadding({ DateTime firstDay, DateTime lastDay }) {
    List<Day> days = <Day>[];
    if (firstDay != null) {
      // INFO: build month padding - beginning
      var firstWeekday = firstDay.weekday;
      DateTime lastDayPrevMonth = new DateTime(_year, _month, 0);
      if (firstWeekday < 7) { // ignore if sunday (no padding needed)
        for (var i = 0; i < firstWeekday; i++) {
          days.insert(0, new Day(date: lastDayPrevMonth.day - i));
        }
      }
    } else if (lastDay != null) {
      // INFO: build month padding - ending
      var lastWeekday = lastDay.weekday;
      DateTime firstDayNextMonth = new DateTime(_year, _month + 1, 1);
      var remainingDays = (6 - lastWeekday == -1) ? 6 : (6 - lastWeekday);
      for (var i = 0; i < remainingDays; i++) {
        days.add(new Day(date: firstDayNextMonth.day + i));
      }
    }
    return days;
  }

  @override
  Widget build(BuildContext context) {

    // INFO: build all `Day`s in month
    // - get first day of month - for indexing
    DateTime _firstDay = new DateTime(_year, _month, 1);
    // - get last day of month - for indexing
    DateTime _lastDay = new DateTime(_year, _month + 1, 0);

    // INFO: create days in the month
    List<Day> monthDays = _generateMonthDays(firstDay: _firstDay, lastDay: _lastDay);

    // INFO: build month padding - beginning
    monthDays.insertAll(0, _generateMonthPadding(firstDay: _firstDay));
    
    // INFO: build month padding - ending
    monthDays.addAll(_generateMonthPadding(lastDay: _lastDay));

    // INFO: generate weeks in this month
    List<Week> monthWeeks = new List<Week>();
    for (var weeknum = 0; weeknum < (monthDays.length / 7); weeknum++) {
      List<Day> weekDays = new List<Day>();
      for (var weekday = (weeknum * 7); weekday < (weeknum * 7) + 7; weekday++) {
        weekDays.add(monthDays[weekday]);
      }
      monthWeeks.add(new Week(days: weekDays));
    }

    return new Container(
      constraints: new BoxConstraints(),
      margin: new EdgeInsets.all(8.0),
      child: new Column(
        children: <Widget>[
          new CalendarHeader(monthName: _months[_month - 1]['long']),
          new Month(year: _year, month: _month, weeks: monthWeeks)
        ]
      ),
    );
  }
}

class CalendarHeader extends StatelessWidget {
  CalendarHeader({ @required monthName }) {
    this._month = monthName;
  }
  String _month;
  
  @override
  Widget build(BuildContext context) {
    return new Row(
      children: <Widget>[
        new Container(
          margin: new EdgeInsets.only(top: 5.0, bottom: 10.0),
          child: new Text(_month)
        )
      ]
    );
  }
}
