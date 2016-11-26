import 'package:flutter/http.dart' as http;
import 'dart:convert';

typedef void CalendarDataCallback(CalendarData data);

String _urlToFetch() {
  return 'http://localhost:4000/events';
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
  CalendarData(this._data);

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
        callback(new CalendarData(events));
      })
      .catchError((err) {
        print(err);
        return;
      });
  }
}
