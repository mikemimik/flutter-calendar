import 'package:meta/meta.dart';
import 'package:calendar/core.dart';

enum RenderableView {
  calendars,
  calendar,
  events,
  event,
  error,
  blank
}

enum ErrorType {
  network
}

Map<ErrorType, String> ErrorTypeMessages = {
  ErrorType.network: 'Network Error'
};

Map<int, Map<String, String>> MonthNames = {
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

typedef void ViewCallback({
  @required RenderableView view,
  Day selectedDay,
  CalendarEvent selectedEvent
});

// class ViewData {
//   ViewData({
//     RenderableView this.view,
//     Map this.data
//   });

//   final RenderableView view;
//   final Map data;
// }
