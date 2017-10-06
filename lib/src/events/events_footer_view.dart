import 'package:flutter/material.dart';
import 'package:calendar/src/types.dart';
import 'package:calendar/src/actions.dart';

class EventsFooter extends StatelessWidget {
  EventsFooter(
    this.theme,
  );

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return new Container(
      decoration: new BoxDecoration(
        color: theme.accentColor,
      ),
      child: new SizedBox(
        height: 48.0,
        child: new Row(
          children: <Widget>[
            new IconButton(
              iconSize: 36.0,
              icon: new Icon(
                Icons.chevron_left,
                size: 36.0,
              ),
              onPressed: () {
                switchViewAction(RenderableView.calendar);
              },
            )
          ],
        ),
      ),
    );
  }
}
