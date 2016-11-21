# calendar

A flutter widget to display a calendar with some events.

## Getting Started

For help getting started with Flutter, view our online
[documentation](http://flutter.io/).

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
