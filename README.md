# calendar

A flutter widget to display a calendar with some events.

![flutter-calendar-calendar view](https://cloud.githubusercontent.com/assets/2818462/20657190/f1573420-b501-11e6-93e3-77b4dc3cebc7.png | width=320)![flutter-calendar-event view](https://cloud.githubusercontent.com/assets/2818462/20657211/2069e992-b502-11e6-9332-e12a71cb200f.png | width=320)


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
