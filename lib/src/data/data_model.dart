import 'package:flutter/foundation.dart';

abstract class DataModel {
  DataModel({
    @required this.year,
    @required this.month,
    @required this.date,
  });

  final int year;
  final int month;
  final int date;
}
