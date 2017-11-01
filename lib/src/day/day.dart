import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flux/flutter_flux.dart';

import 'package:calendar/src/calendar/calendar_event_icon_row.dart';
import 'package:calendar/src/calendar/calendar_event_icon.dart';
import 'package:calendar/src/data/data_model.dart';
import 'package:calendar/utils.dart';

class Day extends StoreWatcher {
  Day({
    @required this.year,
    @required this.month,
    @required this.date,
    List<DataModel> events,
    this.today: false,
  })
      : textStyle = today ? new TextStyle(color: Colors.orange[500]) : new TextStyle();

  final int year;
  final int month;
  final int date;
  final bool today;
  final TextStyle textStyle;

  // Functions
  List<CalendarViewEventIcon> _generateEventIcons(int count) {
    List<CalendarViewEventIcon> eventIcons = new List<CalendarViewEventIcon>();
    for (int i = 0; i < count; i++) {
      eventIcons.add(
        new CalendarViewEventIcon(
          backgroundColor: Colors.red[500],
        ),
      );
    }
    return eventIcons;
  }

  List<Widget> _generateEventIconRows(CalendarStore store) {
    List<Widget> children = new List<Widget>();
    if (store.eventsByDate[date] != null && store.eventsByDate[date].length != 0) {
      num rows = store.eventsByDate[date].length / 4;
      num rowCount = rows.round();
      num remainder = store.eventsByDate[date].length.remainder(4);
      for (int i = 0; i < rowCount; i++) {
        if (i == rowCount - 1) {
          int iconCount = (remainder == 0) ? 4 : remainder;
          children.add(
            new CalendarViewEventIconRow(
              eventIcons: _generateEventIcons(iconCount),
            ),
          );
        } else {
          children.add(
            new CalendarViewEventIconRow(
              eventIcons: _generateEventIcons(4),
            ),
          );
        }
      }
    }
    return children;
  }

  @override
  void initStores(ListenToStore listenToStore) {
    listenToStore(calendarStoreToken);
  }

  @override
  Widget build(BuildContext context, Map<StoreToken, Store> stores) {
    final CalendarStore calendarStore = stores[calendarStoreToken];

    return new Flexible(
      child: new InkWell(
        onTap: () {
          Map<String, int> currentDay = new Map.fromIterables(
            ['year', 'month', 'date'],
            [year, month, date],
          );
          selectDateAction(currentDay);
          switchViewAction(RenderableView.events);
        },
        child: new Container(
          height: 60.0,
          decoration: new BoxDecoration(
              border: new Border.all(
            color: Colors.black,
            width: 0.5,
          )),
          padding: const EdgeInsets.all(4.0),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              new Align(
                alignment: FractionalOffset.centerRight,
                child: new Container(
                  child: new Text(
                    date.toString(),
                    style: textStyle,
                  ),
                ),
              ),
              new Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: _generateEventIconRows(calendarStore),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
