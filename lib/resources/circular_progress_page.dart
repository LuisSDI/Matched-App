import 'package:flutter/material.dart';
import 'package:matched_app/ui_resources/custom_colors.dart';

class CircularProgressPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: dark,
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
