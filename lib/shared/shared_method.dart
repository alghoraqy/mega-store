import 'package:flutter/material.dart';

Future navigatTo(context, {required Widget screen}) {
  return Navigator.push(context, MaterialPageRoute(builder: (context) {
    return screen;
  }));
}

Future navigatAndReplacement(context, {required Widget screen}) {
  return Navigator.pushReplacement(context,
      MaterialPageRoute(builder: (context) {
    return screen;
  }));
}
