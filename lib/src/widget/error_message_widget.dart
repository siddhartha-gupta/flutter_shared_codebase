import 'package:flutter/material.dart';

class ErrorMessage extends StatelessWidget {
  ErrorMessage(
      {Key key,
      this.title,
      this.subtitle:
          'Oops! It looks like something is not correct. Please, check your internet connection.'})
      : super(key: key);

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListTile(
        leading: Icon(Icons.sync_problem),
        title: Text(title),
        subtitle: Text(subtitle),
      ),
    );
  }
}
