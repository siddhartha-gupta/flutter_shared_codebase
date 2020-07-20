import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class PageWrapperWidget extends StatelessWidget {
  PageWrapperWidget({
    Key key,
    @required this.scrollable,
    @required this.headerWidget,
    @required this.bodyWidgets,
  }) : super(key: key);

  final bool scrollable;
  final Widget headerWidget;
  final List<Widget> bodyWidgets;

  @override
  Widget build(BuildContext context) {
    return new SafeArea(
      child: new Material(
        child: new Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          verticalDirection: VerticalDirection.down,
          children: <Widget>[
            headerWidget,
            new Expanded(
              child: scrollable
                  ? new SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: new Column(
                        children: bodyWidgets,
                      ),
                    )
                  : new Column(
                      children: bodyWidgets,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
