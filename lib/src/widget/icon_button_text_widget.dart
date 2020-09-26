import 'package:flutter/material.dart';

class IconButtonText extends StatelessWidget {
  IconButtonText({
    @required this.onClick,
    @required this.iconData,
    @required this.text,
  });

  final VoidCallback onClick;
  final IconData iconData;
  final String text;

  @override
  Widget build(BuildContext context) {
    var itemColor = Theme.of(context).primaryColor;

    if (Theme.of(context).brightness == Brightness.dark) {
      itemColor = Theme.of(context).iconTheme.color;
    }

    return new InkResponse(
      onTap: onClick,
      child: new Column(
        children: <Widget>[
          new Icon(
            iconData,
            color: itemColor,
          ),
          new Text(
            text,
            style: new TextStyle(color: itemColor),
          )
        ],
      ),
    );
  }
}
