import 'package:flutter/material.dart';
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
  
  @override
  CalendarState createState() => new CalendarState();
}

class CalendarState extends State<Calendar> {
  RenderableView _currentView = RenderableView.calendar;
  int _eventDate;
  
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
