import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flux/flutter_flux.dart';
import 'day.dart';

class DayHeader extends Day {
  DayHeader({
    @required this.day,
  });

  final String day;

  @override
  Widget build(BuildContext context, Map<StoreToken, Store> stores) {
    return new Flexible(
      child: new Container(
        decoration: new BoxDecoration(
          border: new Border.all(
            color: Colors.black,
            width: 0.5,
          ),
        ),
        padding: const EdgeInsets.all(4.0),
        child: new Align(
          alignment: FractionalOffset.center,
          child: new Text(day),
        ),
      ),
    );
  }
}
