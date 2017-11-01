import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flux/flutter_flux.dart';
import 'package:calendar/src/stores.dart';

class EventsView extends StoreWatcher {
  EventsView({
    @required this.itemBuilder,
  });

  final IndexedWidgetBuilder itemBuilder;

  @override
  void initStores(ListenToStore listenToStore) {
    listenToStore(calendarStoreToken);
  }

  @override
  Widget build(BuildContext context, Map<StoreToken, Store> stores) {
    final CalendarStore calendarStore = stores[calendarStoreToken];

    return new Container(
      height: 504.0,
      child: new ListView.builder(
        itemCount: calendarStore.eventsByDate[calendarStore.selectedDate].length,
        itemBuilder: itemBuilder,
      ),
    );
  }
}
