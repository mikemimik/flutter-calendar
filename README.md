# calendar

A flutter widget to display a calendar with some events.

# Usage

```dart
import 'package:calendar/calendar.dart';

void main() {
  runApp(
    new MaterialApp(
      title: 'Calendar Example',
      home: new Scaffold(
        body: new Calendar(
          calendarController: calendarController,
          dataController: dataController,
        ),
      ),
    ),
  );
}
```

The component requires two controllers to function. One is a `DataController` and the other is a `CalendarController`.

# Controllers
## Calendar Controller

In order to give the user of the component control over displaying information. The calendar controller is used to contain render methods (similar to `build` functions on a `Widget`) to customize how the information is displayed.
```dart
import 'package:calendar/controllers.dart';

CalendarController calendarController = new CalendarController(
  renderEvents: renderEventsHandler
);
```

#### `renderEvents`
The `renderEvents` property of the `CalendarController` has the following signature:

```dart
typedef EventsView RenderEventsCallback(List<DataModel> events, Map<String, int> currentDay);
```

An implementation looks like:
```dart

```
### Event Data Structure

The structure of the data returned from the API (currently) is as follows:
```
{
    "id": int,
    "title": String,
    "url": String,
    "date_start": DateTime,
    "date_end": DateTime,
    "details": Object
}
```
