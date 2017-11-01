import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flux/flutter_flux.dart';

import 'package:calendar/src/calendar/calendar_view.dart';
import 'package:calendar/src/calendar/calendar_events_view.dart';
import 'package:calendar/utils.dart';
import 'package:calendar/controllers.dart';

// TODO(mperrotte): fetch data
class Calendar extends StoreWatcher {
  Calendar({
    Key key,
    DateTime initializeDate,
    @required this.calendarController,
    @required this.dataController,
  })
      : year = (initializeDate == null) ? new DateTime.now().year : initializeDate.year,
        month = (initializeDate == null) ? new DateTime.now().month : initializeDate.month,
        date = (initializeDate == null) ? new DateTime.now().day : initializeDate.day,
        super(key: key);

  final int year;
  final int month;
  final int date;
  final CalendarController calendarController;
  final DataController dataController;

  @override
  void initStores(ListenToStore listenToStore) {
    listenToStore(calendarStoreToken);
    listenToStore(controllerStoreToken);

    // INFO(mperrotte): Fetch data after we've initialized the listeners
    String uri = dataController.getUri();
    dynamic payload = dataController.fetchData(uri);
    fetchDataAction({
      'payload': payload,
      'parseData': dataController.parseData,
    });
  }

  @override
  Widget build(BuildContext context, Map<StoreToken, Store> stores) {
    final CalendarStore calendarStore = stores[calendarStoreToken];
    Widget component;

    // INFO(mperrotte): put controllers into store
    setCalendarControllerAction(calendarController);
    setDataControllerAction(dataController);

    switch (calendarStore.currentView) {
      case RenderableView.calendar:
        component = new CalendarView(
          year: year,
          month: month,
          date: date,
        );
        break;
      case RenderableView.events:
        component = new CalendarEventsView(
          year: calendarStore.selectedYear,
          month: calendarStore.selectedMonth,
          date: calendarStore.selectedDate,
          child: calendarController.renderEvents(
            calendarStore.eventsByDate[calendarStore.selectedDate],
          ),
        );
        break;
      case RenderableView.event:
        break;
    }
    return new Material(
      child: component,
    );
  }
}
