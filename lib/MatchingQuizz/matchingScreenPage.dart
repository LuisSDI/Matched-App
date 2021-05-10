import 'package:flutter/material.dart';
import 'package:matched_app/MatchingQuizz/matchingScreen.dart';

class MatchingScreenPage extends StatelessWidget {
  const MatchingScreenPage({Key key, @required this.identifier})
      : super(key: key);
  final String identifier;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: MatchingScreen(identifier: identifier, title: "Do we match?"),
      ),
    );
  }
}
