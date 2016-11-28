import 'package:flutter/http.dart' as http;
import 'dart:convert';
import 'dart:io';

typedef void CalendarDataCallback(CalendarData data);

String _urlToFetch() {
  return 'http://localhost:4000/events'; // TEST: when using ios simulator
  // return 'http://10.0.2.2:4000/events'; // TEST: when using android emulator
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
    SocketException this.error
  }) : super();

  final SocketException error;
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
        var events = decoder.convert(json);
        callback(new CalendarData(data: events));
      })
      .catchError((err) {
        print(err); // TESTING
        callback(new CalendarDataError(error: err));
      });
  }
}
