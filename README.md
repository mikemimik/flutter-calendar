# calendar

A flutter widget to display a calendar with some events.

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
