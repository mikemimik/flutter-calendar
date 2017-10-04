import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flux/flutter_flux.dart';

import 'package:calendar/src/week/week_header.dart';
import 'package:calendar/src/week/week.dart';
import 'package:calendar/src/day/day.dart';
import 'package:calendar/controllers.dart';
import 'package:calendar/utils.dart';

class Month extends StoreWatcher {
  Month({
    @required this.year,
    @required this.month,
    @required this.date,
    @required this.controller,
  });

  final int year;
  final int month;
  final int date;
  final MonthController controller;

  // Functions
  List<Day> _padMonthBeginning(DateTime firstDay) {
    List<Day> days = new List<Day>();
    int firstWeekday = firstDay.weekday;
    DateTime lastDayPrevMonth = new DateTime(year, month, 0);
    DateTime prevMonth = new DateTime(year, month - 1);
    if (firstWeekday < 7) {
      // NOTE(mperrotte): ignore if sunday (no padding needed)
      for (int i = 0; i < firstWeekday; i++) {
        days.add(new Day(
          year: (month == 1) ? year - 1 : year,
          month: prevMonth.month,
          date: lastDayPrevMonth.day - i,
          today: false,
        ));
      }
    }
    return days;
  }

  List<Day> _padMonthEnding(DateTime lastDay) {
    List<Day> days = new List<Day>();
    int lastWeekday = lastDay.weekday;
    DateTime firstDayNextMonth = new DateTime(year, month + 1, 1);
    DateTime nextMonth = new DateTime(year, month + 1);
    int remainingDays = ((6 - lastWeekday) == -1) ? 6 : (6 - lastWeekday);
    for (int i = 0; i < remainingDays; i++) {
      days.add(new Day(
        year: (month == 12) ? year + 1 : year,
        month: nextMonth.month,
        date: firstDayNextMonth.day + i,
        today: false,
      ));
    }
    return days;
  }

  List<Day> _generateMonthDays(DateTime firstDay, DateTime lastDay) {
    List<Day> days = <Day>[];
    for (int i = firstDay.day; i <= lastDay.day; i++) {
      if (i == date) {
        days.add(new Day(year: year, month: month, date: i, today: true));
      } else {
        days.add(new Day(year: year, month: month, date: i, today: false));
      }
    }
    // INFO(mperrotte): add padding to the beginnging of the month
    days.insertAll(0, _padMonthBeginning(firstDay));
    // INFO(mperrotte): add padding to the ending of the month
    days.addAll(_padMonthEnding(lastDay));
    return days;
  }

  List<Week> _generateMonthWeeks() {
    DateTime firstDay = new DateTime(year, month, 1);
    DateTime lastDay = new DateTime(year, month + 1, 0);
    List<Day> monthDays = _generateMonthDays(firstDay, lastDay);
    List<Week> weekList = new List<Week>();
    for (int weeknum = 0; weeknum < (monthDays.length / 7); weeknum++) {
      List<Day> weekDays = new List<Day>();
      // TODO(mperrotte): Look into using `List.sublist` here instead
      for (int weekday = (weeknum * 7); weekday < (weeknum * 7) + 7; weekday++) {
        weekDays.add(monthDays[weekday]);
      }
      weekList.add(new Week(days: weekDays));
    }
    return weekList;
  }

  @override
  void initStores(ListenToStore listenToStore) {
    listenToStore(calendarStoreToken);
  }

  @override
  Widget build(BuildContext context, Map<StoreToken, Store> stores) {
    List<Week> monthWeeks = _generateMonthWeeks();

    return new Expanded(
      child: new Container(
        margin: const EdgeInsets.all(8.0),
        child: new Column(
          children: [
            [generateWeekHeader('short')],
            monthWeeks,
          ].expand((dynamic week) {
            return week;
          }).toList(),
        ),
      ),
    );
  }
}
