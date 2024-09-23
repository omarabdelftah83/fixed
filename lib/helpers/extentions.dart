import 'package:flutter/material.dart';

extension NavigatorHelper on BuildContext {
  void push(Widget widget) {
    Navigator.of(this).push(MaterialPageRoute(builder: (context) => widget));
  }

  // ignore: unused_element
  void pop() {
    Navigator.of(this).pop();
  }

  void pushReplacement(Widget widget) {
    Navigator.of(this)
        .pushReplacement(MaterialPageRoute(builder: (context) => widget));
  }

  void pushAndRemoveUntil(Widget widget) {
    Navigator.of(this).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => widget),
        (Route route) => false);
  }
}
