import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:calendar/src/calendar/calendar_event_icon.dart';

class CalendarViewEventIconRow extends StatelessWidget {
  CalendarViewEventIconRow({
    @required this.eventIcons,
  });

  final List<CalendarViewEventIcon> eventIcons;

  @override
  Widget build(BuildContext context) {
    return new Row(
      children: eventIcons,
    );
  }
}
