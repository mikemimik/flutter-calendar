// import 'package:flutter/widgets.dart';
import 'package:calendar/src/events/events_view.dart';
import 'package:calendar/src/data/data_model.dart';

const Map<int, Map<String, String>> MonthNames = const {
  0: const {'short': 'Jan', 'long': 'January'},
  1: const {'short': 'Feb', 'long': 'February'},
  2: const {'short': 'Mar', 'long': 'March'},
  3: const {'short': 'Apr', 'long': 'April'},
  4: const {'short': 'May', 'long': 'May'},
  5: const {'short': 'June', 'long': 'June'},
  6: const {'short': 'July', 'long': 'July'},
  7: const {'short': 'Aug', 'long': 'August'},
  8: const {'short': 'Sep', 'long': 'September'},
  9: const {'short': 'Oct', 'long': 'October'},
  10: const {'short': 'Nov', 'long': 'November'},
  11: const {'short': 'Dec', 'long': 'December'}
};

const Map<int, Map<String, String>> DayNames = const {
  0: const {'short': 'Mon', 'long': 'Monday'},
  1: const {'short': 'Tue', 'long': 'Tuesday'},
  2: const {'short': 'Wed', 'long': 'Wednesday'},
  3: const {'short': 'Thur', 'long': 'Thursday'},
  4: const {'short': 'Fri', 'long': 'Friday'},
  5: const {'short': 'Sat', 'long': 'Saturday'},
  6: const {'short': 'Sun', 'long': 'Sunday'}
};

enum RenderableView {
  calendar,
  events,
  event,
}

enum ControllerType {
  calendar,
  data,
}

typedef String DataCallback();
typedef EventsView RenderEventsCallback(List<DataModel> events);
typedef dynamic FetchDataCallback(String uri);
typedef String GetDataUriCallback();
typedef List<DataModel> ParseDataCallback(dynamic payload);
typedef List<DataModel> FilterEventsCallback(List<DataModel> events, Map<String, int> currentDay);
