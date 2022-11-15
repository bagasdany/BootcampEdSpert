import 'package:flutter/material.dart';

final scaffoldKey = GlobalKey<ScaffoldMessengerState>();
bool currentOffer = false;
bool currentAlert = false;
bool currentConfirm = false;

class AppDialog {
  static void snackBar({required text, duration = 2, context}) {
    context.currentState!.showSnackBar(SnackBar(
      content: Text(text),
      behavior: SnackBarBehavior.floating,
      duration: Duration(seconds: duration),
    ));
  }
}
