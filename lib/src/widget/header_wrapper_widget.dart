import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class HeaderWrapperWidget extends StatelessWidget {
  HeaderWrapperWidget({
    Key key,
    @required this.leftIcon,
    @required this.leftIconCallback,
    @required this.text,
    @required this.actionButtons,
  }) : super(key: key);

  final IconData leftIcon;
  final Function() leftIconCallback;
  final String text;
  final Map<IconData, Function> actionButtons;

  Widget navigationIcon() {
    return leftIcon != null
        ? GestureDetector(
            onTap: () {
              leftIconCallback();
            },
            child: new Padding(
              padding: EdgeInsets.fromLTRB(15.0, 0, 15.0, 0),
              child: new Icon(leftIcon),
            ),
          )
        : new Container();
  }

  Widget headerText() {
    return new Text(
      text,
      overflow: TextOverflow.ellipsis,
      style: new TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget actionButtonWidgets() {
    if (actionButtons.length == 0) {
      return new Container();
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: actionButtons.entries.map((entry) {
        return GestureDetector(
          onTap: () {
            entry.value();
          },
          child: new Padding(
            padding: EdgeInsets.fromLTRB(15.0, 0, 15.0, 0),
            child: Icon(
              entry.key,
            ),
          ),
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 1,
      child: new Container(
        child: new Padding(
          padding: EdgeInsets.fromLTRB(0, 15.0, 0, 15.0),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              navigationIcon(),
              new Expanded(
                child: headerText(),
              ),
              actionButtonWidgets(),
            ],
          ),
        ),
      ),
    );
  }
}
