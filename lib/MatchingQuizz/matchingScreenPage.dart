import 'package:flutter/material.dart';
import 'package:matched_app/MatchingQuizz/matchingScreen.dart';
import 'package:matched_app/main_pages/home_page.dart';

class MatchingScreenPage extends StatefulWidget {
  MatchingScreenPage({Key key, @required this.identifier}) : super(key: key);
  final String identifier;

  @override
  _MatchingScreenPageState createState() => _MatchingScreenPageState();
}

class _MatchingScreenPageState extends State<MatchingScreenPage> {
  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text('Are you sure?'),
            content: new Text('Do you want to go back?'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: new Text('No'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => HomePage(
                          identifier: widget.identifier,
                          currentIndex: 3,
                          hasIndex: true)),
                ),
                child: new Text('Yes'),
              ),
            ],
          ),
        )) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: _onWillPop,
      child: new Scaffold(
        body: Container(
          child: MatchingScreen(
              identifier: widget.identifier, title: "Do we match?"),
        ),
      ),
    );
  }
}
