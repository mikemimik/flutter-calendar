import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flux/flutter_flux.dart';
import 'package:calendar/src/stores.dart';

class EventsView extends StoreWatcher {
  EventsView({
    @required this.itemBuilder,
    this.itemCount,
  });

  final IndexedWidgetBuilder itemBuilder;
  final int itemCount;

  @override
  void initStores(ListenToStore listenToStore) {
    listenToStore(calendarStoreToken);
  }

  @override
  Widget build(BuildContext context, Map<StoreToken, Store> stores) {
    final CalendarStore calendarStore = stores[calendarStoreToken];

    // return new Container(
    //   child: new ListView.builder(
    //     itemExtent: 20.0,
    //     itemCount: itemCount,
    //     itemBuilder: itemBuilder,
    //   ),
    // );
    List<Widget> events = new List<Widget>();
    for (int i = 0; i < itemCount; i++) {
      events.add(itemBuilder(context, i));
    }
    return new ListBody(
      children: events,
    );
  }
}
