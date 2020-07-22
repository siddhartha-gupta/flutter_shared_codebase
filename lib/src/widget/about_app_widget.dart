import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutAppWidget extends StatelessWidget {
  AboutAppWidget({
    Key key,
    @required this.playStoreMoreAppsUrl,
    @required this.authorName,
  }) : super(key: key);

  final String playStoreMoreAppsUrl;
  final String authorName;

  void openPlaystore() {
    launch(playStoreMoreAppsUrl);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(10.0),
          child: Center(
            child: Text(
              'Developed by'.toUpperCase(),
              style: TextStyle(
                fontWeight: FontWeight.w500,
                letterSpacing: 1,
              ),
            ),
          ),
        ),
        Center(
          child: Text(
            this.authorName,
            style: TextStyle(
              fontSize: 24,
            ),
          ),
        ),
        Container(
          height: 10,
        ),
        Container(
          alignment: Alignment.center,
          child: OutlineButton.icon(
            icon: Icon(OMIcons.apps),
            label: Text(
              'More Apps',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                letterSpacing: 1,
                color: Colors.grey.shade500,
              ),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            onPressed: openPlaystore,
          ),
        ),
      ],
    );
  }
}
