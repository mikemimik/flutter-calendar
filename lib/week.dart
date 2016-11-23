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
    
    Widget component = new Row(
      children: _days
    );
    
    return component;
  }
}

class HeaderWeek extends Week {
  HeaderWeek({ @required List<HeaderDay> days }) {
    this._days = days;
  }
  List<HeaderDay> _days;

  @override
  Widget build(BuildContext context) {
    
    Widget component = new Row(
      children: _days
    );
    
    return component;
  }
}
