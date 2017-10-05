import 'package:flutter_flux/flutter_flux.dart';

import 'package:calendar/controllers.dart';
import 'package:calendar/src/types.dart';

final Action<RenderableView> switchViewAction = new Action<RenderableView>();
final Action<Map<String, int>> selectDateAction = new Action<Map<String, int>>();
final Action<Map<String, dynamic>> fetchDataAction = new Action<Map<String, dynamic>>();

final Action<CalendarController> setCalendarControllerAction = new Action<CalendarController>();
final Action<DataController> setDataControllerAction = new Action<DataController>();
