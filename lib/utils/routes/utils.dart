import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mvvmstructre/models/movie_models.dart';

class Utils {
  static double average(List<int> rating) {
    dynamic totalrating = 0;
    for (int i = 0; i < rating.length; i++) {
      totalrating = totalrating + rating[i];
    }
    double average = totalrating / rating.length;
    return double.parse((totalrating / rating.length).toStringAsFixed(1));
  }

  static void feildFocusChnage(
      BuildContext context, FocusNode current, FocusNode nextfocus) {
    current.unfocus();
    FocusScope.of(context).requestFocus(nextfocus);
  }

  static errortoastMessage(String message) {
    Fluttertoast.showToast(
        msg: message,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        toastLength: Toast.LENGTH_LONG);
  }

  static void errorFlushbarMessage(String message, BuildContext context) {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          message: message,
          duration: const Duration(seconds: 3),
          forwardAnimationCurve: Curves.decelerate,
        )..show(context));
  }

  static snackbar(String message, BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(backgroundColor: Colors.black, content: Text(message)));
  }
}
