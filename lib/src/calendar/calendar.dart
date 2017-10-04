import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flux/flutter_flux.dart';

import 'package:calendar/src/calendar/calendar_view.dart';
import 'package:calendar/src/calendar/calendar_events_view.dart';
import 'package:calendar/src/actions.dart';
import 'package:calendar/src/stores.dart';
import 'package:calendar/src/types.dart';
import 'package:calendar/controllers.dart';

// TODO(mperrotte): fetch data
class Calendar extends StoreWatcher {
  Calendar({
    Key key,
    DateTime initializeDate,
    @required this.calendarController,
    @required this.dataController,
    @required this.monthController,
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
  final MonthController monthController;

  @override
  void initStores(ListenToStore listenToStore) {
    listenToStore(calendarStoreToken);
    listenToStore(controllerStoreToken);
  }

  @override
  Widget build(BuildContext context, Map<StoreToken, Store> stores) {
    final CalendarStore calendarStore = stores[calendarStoreToken];
    Widget component;

    // INFO(mperrotte): put controllers into store
    setCalendarControllerAction(calendarController);
    setDataControllerAction(dataController);
    setMonthControllerAction(monthController);

    // INFO(mperrotte): Fetch data after we've initialized the listeners
    String uri = dataController.getUri();
    dynamic payload = dataController.fetchData(uri);
    fetchDataAction({
      'payload': payload,
      'parseData': dataController.parseData,
    });

    switch (calendarStore.currentView) {
      case RenderableView.calendar:
        component = new CalendarView(
          year: year,
          month: month,
          date: date,
          monthController: monthController,
        );
        break;
      case RenderableView.events:
        component = new CalendarEventsView(
          year: calendarStore.selectedYear,
          month: calendarStore.selectedMonth,
          date: calendarStore.selectedDate,
          child: calendarController.renderEvents(
            calendarStore.events,
            calendarStore.currentDay,
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
