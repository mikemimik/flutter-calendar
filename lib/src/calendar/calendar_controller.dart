import 'package:flutter/foundation.dart';

import 'package:calendar/src/types.dart';

abstract class BaseCalendarController {
  BaseCalendarController({
    @required this.renderEvents,
  });

  final RenderEventsCallback renderEvents;
}

class CalendarController extends BaseCalendarController {
  CalendarController({
    @required renderEvents,
  })
      : super(
          renderEvents: renderEvents,
        );
}
