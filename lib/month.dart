import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'week.dart';
import 'day.dart';

class Month extends StatelessWidget {
  Month({ @required int year, @required int month, @required List<Week> weeks }) {
    this._year = year;
    this._month = month;
    this._weeks = weeks;
  }

  int _year;
  int _month;
  List<Week> _weeks;
  String _dayNameLength = 'short';
  static final _days = {
    0: { 'short': 'Mon', 'long' : 'Monday' },
    1: { 'short': 'Tue', 'long': 'Tuesday' },
    2: { 'short': 'Wed', 'long': 'Wednesday' },
    3: { 'short': 'Thur', 'long': 'Thursday' },
    4: { 'short': 'Fri', 'long': 'Friday' },
    5: { 'short': 'Sat', 'long': 'Saturday' },
    6: { 'short': 'Sun', 'long': 'Sunday' }
  };

  @override
  Widget build(BuildContext context) {
    List<HeaderDay> headerDays = new List<HeaderDay>();
    headerDays.add(new HeaderDay(day: _days[6][_dayNameLength])); // add sunday first
    for (var i = 0; i < 6; i++) {
      headerDays.add(new HeaderDay(day: _days[i][_dayNameLength]));
    }
    HeaderWeek headerWeek = new HeaderWeek(days: headerDays);
    _weeks.insert(0, headerWeek);

    Widget component = new Container(
      child: new Column(
        children: _weeks
      )
    );
    
    return new Flexible(child: component);
  }
}
