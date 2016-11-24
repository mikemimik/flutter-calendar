import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'view.calendar.dart';
import 'view.event.dart';
import 'view_types.dart';

class Calendar extends StatefulWidget {
  factory Calendar({
    DateTime initializeDate
  }) {
    DateTime date = (initializeDate == null) ? new DateTime.now() : initializeDate;
    return new Calendar._internal(date.year, date.month);
  }
  
  Calendar._internal(this._year, this._month);
  
  final int _year;
  final int _month;
  String get year => _year.toString();
  String get month => _month.toString();
  
  @override
  CalendarState createState() => new CalendarState();
}

class CalendarState extends State<Calendar> {
  RenderableView _currentView = RenderableView.calendar;
  int _eventDate;
  
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
  
  _switchViewCalendar() {
    print('inside _switchViewCalendar');
    setState(() {
      _currentView = RenderableView.calendar;
    });
  }
  
  _switchViewEvent({ int date }) {
    print('inside _switchViewEvent: $date');
    setState(() {
      _currentView = RenderableView.event;
      _eventDate = date;
    });
  }
  
  @override
  void initState() {
    super.initState();
    setState(() {
      _currentView = RenderableView.calendar;
    });
  }

  @override
  Widget build(BuildContext context) {
    
    Widget component;
    switch (_currentView) {
      case RenderableView.calendar:
        component = new CalendarView(
          year: config._year,
          month: config._month,
          switchViewCallback: _switchViewEvent
        );
        break;
      case RenderableView.event:
        component = new EventView(
          year: config._year,
          month: config._month,
          day: _eventDate,
          switchViewCallback: _switchViewCalendar
        );
        break;
    }
    return new Material(child: component);
    
  }
}
