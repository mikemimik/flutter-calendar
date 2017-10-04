import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CalendarViewEventIcon extends StatelessWidget {
  CalendarViewEventIcon({
    @required this.backgroundColor,
  });

  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 5.0,
      width: 5.0,
      margin: const EdgeInsets.all(0.5),
      decoration: new BoxDecoration(
        color: backgroundColor,
      ),
    );
  }
}
