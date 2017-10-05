import 'package:flutter_flux/flutter_flux.dart';

import 'package:calendar/src/data/data_model.dart';
import 'package:calendar/src/actions.dart';
import 'package:calendar/src/types.dart';
import 'package:calendar/controllers.dart';

Map<int, List<DataModel>> reduceEvents(List<DataModel> events) {
  Map<int, List<DataModel>> eventsByDate = new Map<int, List<DataModel>>();
  return events.fold(eventsByDate, (prev, event) {
    if (prev.containsKey(event.date)) {
      prev[event.date].add(event);
    } else {
      prev[event.date] = new List<DataModel>();
      prev[event.date].add(event);
    }
    return prev;
  });
}

class CalendarStore extends Store {
  CalendarStore() {
    // NOTE(mperrotte): define action/reducers
    triggerOnAction(switchViewAction, (RenderableView view) {
      _currentView = view;
    });
    triggerOnAction(selectDateAction, (Map<String, int> currentDay) {
      _selectedDate = currentDay['date'];
      _selectedMonth = currentDay['month'];
      _selectedYear = currentDay['year'];
    });

    _fetchDataReducer(Map<String, dynamic> funcs) async {
      dynamic payload = await funcs['payload'];
      List<DataModel> data = funcs['parseData'](payload);
      _events = data;
      _eventsByDate = reduceEvents(_events);
      trigger();
    }

    fetchDataAction.listen(_fetchDataReducer);
  }

  // NOTE(mperrotte): define store properties
  RenderableView _currentView = RenderableView.calendar;
  int _selectedYear;
  int _selectedMonth;
  int _selectedDate;
  List<DataModel> _events = new List<DataModel>();
  Map<int, List<DataModel>> _eventsByDate = new Map<int, List<DataModel>>();

  // NOTE(mperrotte): define selectors
  RenderableView get currentView => _currentView;
  int get selectedYear => _selectedYear;
  int get selectedMonth => _selectedMonth;
  int get selectedDate => _selectedDate;
  List<DataModel> get events => _events;
  Map<int, List<DataModel>> get eventsByDate => _eventsByDate;
  Map<String, int> get currentDay => {
        'year': _selectedYear,
        'month': _selectedMonth,
        'date': _selectedDate,
      };
}

class ControllerStore extends Store {
  ControllerStore() {
    // setCalendarControllerAction.listen((CalendarController controller) {
    //   _calendarController = controller;
    //   trigger();
    // });
    triggerOnAction(setCalendarControllerAction, (CalendarController controller) {
      _calendarController = controller;
    });
    triggerOnAction(setDataControllerAction, (DataController controller) {
      _dataController = controller;
    });
  }

  CalendarController _calendarController;
  DataController _dataController;

  // NOTE(mperrotte): created single selector with type interface
  getController(ControllerType controller) {
    switch (controller) {
      case ControllerType.calendar:
        return _calendarController;
      case ControllerType.data:
        return _dataController;
    }
  }
}

// NOTE(mperrotte): define store tokens
final StoreToken calendarStoreToken = new StoreToken(new CalendarStore());
final StoreToken controllerStoreToken = new StoreToken(new ControllerStore());
