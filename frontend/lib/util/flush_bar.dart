import 'package:flutter/material.dart';
import 'package:flushbar/flushbar.dart';

class FlushBarClass {
  static void flushBar(BuildContext context, String mensagem) {
    Flushbar(
      message: mensagem,
      flushbarPosition: FlushbarPosition.BOTTOM,
      duration: Duration(seconds: 3),
    )..show(context);
  }
}
