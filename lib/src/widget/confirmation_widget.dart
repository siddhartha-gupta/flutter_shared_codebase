import 'package:flutter/material.dart';

class ConfirmationWidget {
  ConfirmationWidget();

  static void dialog(
    BuildContext context,
    String title,
    String content,
    String primaryBtnTxt,
    Function primaryBtnCallback,
    String secondaryBtnTxt,
    Function secondaryBtnCallback,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text(title),
          content: new Text(content),
          actions: <Widget>[
            new FlatButton(
              child: new Text(secondaryBtnTxt),
              onPressed: () {
                Navigator.of(context).pop();
                secondaryBtnCallback();
              },
            ),
            new FlatButton(
              child: new Text(primaryBtnTxt),
              onPressed: () {
                Navigator.of(context).pop();
                primaryBtnCallback();
              },
            ),
          ],
        );
      },
    );
  }
}
