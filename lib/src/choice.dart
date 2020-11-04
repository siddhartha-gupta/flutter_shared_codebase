import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class Choice {
  const Choice({
    @required this.title,
    @required this.icon,
    @required this.callback,
    this.color,
  });

  final String title;
  final IconData icon;
  final Function() callback;
  final Color color;
}
