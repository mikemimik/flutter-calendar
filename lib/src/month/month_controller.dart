import 'package:flutter/foundation.dart';

import 'package:calendar/src/types.dart';

abstract class BaseMonthController {
  BaseMonthController({
    @required this.filterEvents,
  });
  final FilterEventsCallback filterEvents;
}

class MonthController extends BaseMonthController {
  MonthController({
    @required filterEvents,
  })
      : super(
          filterEvents: filterEvents,
        );
}
