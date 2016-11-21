import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'day.dart';

class Week extends StatelessWidget {
  Week({ @required List<Day> days }) {
    this._days = days;
  }

  List<Day> _days;

  @override
  Widget build(BuildContext context) {
    // create seven days
    return new Row(
        children: _days
    );
  }
}

class HeaderWeek extends Week {
  HeaderWeek({ @required List<HeaderDay> days }) {
    this._days = days;
  }
  List<HeaderDay> _days;

  @override
  Widget build(BuildContext context) {
    return new Row(
      children: _days
    );
  }
}
