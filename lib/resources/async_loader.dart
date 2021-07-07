import 'package:flutter/material.dart';
import 'package:matched_app/ui_resources/custom_colors.dart';

class Async_Loader {
  static Future<void> showLoadingDialog(
      BuildContext context) async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return WillPopScope(
              onWillPop: () async => false,
              child: Center(
                child: CircularProgressIndicator(
                  color: mainColor,
                ),
              ));
        });
  }
}
