import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class AppLogoWidget extends StatelessWidget {
  final String appIcon;

  AppLogoWidget({
    Key key,
    @required this.appIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Container(
        // width: 200.0,
        child: Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(200.0),
            child: Image.asset(
              this.appIcon,
              width: 150.0,
            ),
          ),
        ),
      ),
    );
  }
}
