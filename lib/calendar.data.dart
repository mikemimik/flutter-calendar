import 'package:flutter/http.dart' as http;
import 'package:calendar/core.dart';
import 'dart:convert';
import 'dart:io';

typedef void CalendarDataCallback(CalendarData data);

String _urlToFetch() {
  // TEST: when using ios simulator
  // return 'http://localhost:4000/events';
  // TEST: when using android emulator
  // return 'http://10.0.2.2:4000/events';
  // TESTING: static data
  return 'https://raw.githubusercontent.com/mikemimik/flutter-calendar/master/data/mock_data.json';
}

class CalendarEvent {
  int id;
  String title;
  String url;
  DateTime start;
  DateTime end;
  dynamic details;
  int year;
  int month;
  int day;

  CalendarEvent(Map<String, dynamic> data) {
    id = data['id'];
    title = data['title'];
    url = data['url'];
    start = DateTime.parse(data['date_start']);
    end = DateTime.parse(data['date_end']);
    details = data['details'];
    year = start.year;
    month = start.month;
    day = start.day;
  }

  @override
  String toString() {
    return 'Calendar Event (instance): id:${id} | title:${title}';
  }

  String getTime(DateTime time, { bool military: true }) {
    Map<String, String> hour = _convertHour(time.hour, military: military);
    String minute = _convertMinute(time.minute);
    if (military) {
      return '${hour["hour"]}:${minute}';
    } else {
      return '${hour["hour"]}:${minute} ${hour["period"]}';
    }
  }

  String getStartTime({ bool military: true }) {
    return getTime(start, military: military);
  }

  String getEndTime({ bool military: true }) {
    return getTime(end, military: military);
  }

  Map<String, String> _convertHour(int hour, { bool military: true }) {
    Map<String, String> output = new Map<String, String>();
    if (military) {
      output['period'] = null;
      if (hour < 10) {
        output['hour'] = '0${hour}';
      } else {
        output['hour'] = hour.toString();
      }
    } else {
      if (hour > 12) {
        output['hour'] = (hour - 12).toString();
        output['period'] = 'PM';
      } else {
        output['hour'] = hour.toString();
        output['period'] = (hour == 12) ? 'PM' : 'AM';
      }
    }
    return output;
  }

  String _convertMinute(int minute) {
    if (minute < 10) {
      return '0${minute}';
    } else {
      return '${minute}';
    }
  }
}

class CalendarData {
  CalendarData({
    List<Map<String, dynamic>> data
  }) {
    this._data = data;
  }

  List<Map<String, dynamic>> _data;

  List<CalendarEvent> generateEvents() {
    List<CalendarEvent> events = new List<CalendarEvent>();
    for (var event in _data) {
      events.add(new CalendarEvent(event));
    }
    events.sort((a, b) => (a.day).compareTo(b.day));
    return events;
  }
}

class CalendarDataError extends CalendarData {
  CalendarDataError({
    SocketException this.error,
    String this.message,
    ErrorType this.type
  }) : super();

  final SocketException error;
  final String message;
  final ErrorType type;
}

class CalendarDataFetcher {
  CalendarDataFetcher(this.callback) {
    _getData();
  }

  final CalendarDataCallback callback;

  void _getData() {
    http.get(_urlToFetch())
      .then((http.Response response) {
        // TESTING
        // print('statusCode: ${response.statusCode}');
        // print('response: ${response.body}');
        String json = response.body;
        if (json == null) {
          print('json is null');
          return;
        }
        JsonDecoder decoder = new JsonDecoder();
        try {
          var events = decoder.convert(json);
          callback(new CalendarData(data: events));
        } on ArgumentError {
          print('Invalid data received from API call');
          callback(
            new CalendarDataError(
              message: 'Invalid event data from network',
              type: ErrorType.network
            )
          );
        }
      })
      .catchError((err) {
        print(err); // TESTING
        callback(
          new CalendarDataError(
            error: err,
            message: 'Unable to load event from network.',
            type: ErrorType.network
          )
        );
      });
  }
}
