import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class SettingsCardWidget extends StatelessWidget {
  SettingsCardWidget({
    Key key,
    @required this.child,
    @required this.padding,
    @required this.margin,
  }) : super(key: key);

  final Widget child;
  final double padding;
  final double margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).dialogBackgroundColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 8),
            color: Colors.black.withAlpha(20),
            blurRadius: 16,
          )
        ],
      ),
      margin: EdgeInsets.all(margin),
      padding: EdgeInsets.all(padding),
      child: child,
    );
  }
}
