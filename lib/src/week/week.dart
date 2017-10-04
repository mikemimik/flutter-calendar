import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:calendar/src/day/day.dart';

class Week extends StatelessWidget {
  Week({
    @required this.days,
  });

  final List<Day> days;

  @override
  Widget build(BuildContext context) {
    return new Row(
      children: days,
    );
  }
}
