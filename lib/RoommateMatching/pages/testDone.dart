import 'package:flutter/material.dart';
import 'package:matched_app/MatchingQuizz/result.dart';

class TestDonePage extends StatefulWidget {
  TestDonePage({Key key}) : super(key: key);
  @override
  _TestDonePageState createState() => _TestDonePageState();
}

class _TestDonePageState extends State<TestDonePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test done'),
      ),
      body: Center(
          child: Column(
        children: [Text('Roommate matching result will be out soon!')],
      )),
    );
  }
}
