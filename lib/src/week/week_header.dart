import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:calendar/src/day/day_header.dart';
import 'package:calendar/utils.dart';
import 'week.dart';

class WeekHeader extends Week {
  WeekHeader({
    @required this.days,
  });

  final List<DayHeader> days;

  @override
  Widget build(BuildContext context) {
    return new Row(
      children: days,
    );
  }
}

WeekHeader generateWeekHeader(String nameFormat) {
  assert(nameFormat != null);
  List<DayHeader> days = new List<DayHeader>();
  // INFO(mperrotte): add sunday first
  days.add(new DayHeader(
    day: DayNames[0][nameFormat],
  ));
  for (int i = 0; i < 6; i++) {
    days.add(new DayHeader(
      day: DayNames[i][nameFormat],
    ));
  }
  return new WeekHeader(
    days: days,
  );
}
