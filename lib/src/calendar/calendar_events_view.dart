import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:calendar/src/events/events_header_view.dart';
import 'package:calendar/src/events/events_footer_view.dart';

class CalendarEventsView extends StatelessWidget {
  CalendarEventsView({
    @required this.year,
    @required this.month,
    @required this.date,
    @required this.child,
  });

  final int year;
  final int month;
  final int date;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return new Container(
      constraints: new BoxConstraints(),
      child: new Column(
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          new EventsHeader(year, month, date),
          child,
          new EventsFooter(theme),
        ],
      ),
    );
  }
}
