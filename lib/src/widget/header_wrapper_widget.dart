import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import '../choice.dart';

class HeaderWrapperWidget extends StatelessWidget {
  HeaderWrapperWidget({
    Key key,
    @required this.leftIcon,
    @required this.leftIconCallback,
    @required this.text,
    @required this.actionButtons,
    @required this.popUpMenuChoices,
  }) : super(key: key);

  final IconData leftIcon;
  final Function() leftIconCallback;
  final String text;
  final Map<IconData, Function> actionButtons;
  final List<Choice> popUpMenuChoices;

  void onMenuItemSelected(Choice choice) {
    choice.callback();
  }

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

  List<Widget> createActionButtons() {
    if (actionButtons.isEmpty) {
      return [new Container()];
    }

    return actionButtons.entries.map((entry) {
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
    }).toList();
  }

  Widget createPopUpMenu() {
    if (popUpMenuChoices.isEmpty) {
      return new Container();
    }

    return PopupMenuButton<Choice>(
      child: new Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 15.0, 0),
        child: Icon(Icons.more_vert),
      ),
      padding: EdgeInsets.all(0),
      onSelected: onMenuItemSelected,
      itemBuilder: (BuildContext context) {
        return popUpMenuChoices.map((Choice choice) {
          return PopupMenuItem<Choice>(
            value: choice,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Icon(
                  choice.icon,
                  size: 20.0,
                  color: choice.color ?? Theme.of(context).iconTheme.color,
                ),
                new Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Text(
                    choice.title,
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      color: choice.color ??
                          Theme.of(context).textTheme.bodyText1.color,
                    ),
                  ),
                )
              ],
            ),
          );
        }).toList();
      },
    );
  }

  Widget actionButtonWidgets() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ...createActionButtons(),
        createPopUpMenu(),
      ],
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
