import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'view.calendar.dart';
import 'view.event.dart';
import 'view_types.dart';
import 'data.dart';

class Calendar extends StatefulWidget {
  factory Calendar({
    DateTime initializeDate
  }) {
    DateTime date = (initializeDate == null) ? new DateTime.now() : initializeDate;
    return new Calendar._internal(date.year, date.month, date.day);
  }

  Calendar._internal(this._year, this._month, this._day);

  final int _year;
  final int _month;
  final int _day;

  @override
  CalendarState createState() => new CalendarState();
}

class CalendarState extends State<Calendar> {
  RenderableView _currentView;
  List<CalendarEvent> _events;
  int _eventDate;

  void _switchView({
    @required RenderableView view,
    int date
  }) {
    print('inside _switchView: $date');
    setState(() {
      _currentView = view;
      _eventDate = date;
    });
  }

  @override
  void initState() {
    super.initState();
    new CalendarDataFetcher((CalendarData data) {
      setState(() {
        _events = data.generateEvents();
        _currentView = RenderableView.calendar;
      });
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
          day: config._day,
          events: _events,
          switchViewCallback: _switchView
        );
        break;
      case RenderableView.event:
        component = new EventView(
          year: config._year,
          month: config._month,
          day: _eventDate,
          switchViewCallback: _switchView
        );
        break;
    }
    return new Material(child: component);

  }
}
