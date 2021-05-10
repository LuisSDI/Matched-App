import 'package:flutter/material.dart';
import 'package:matched_app/MatchingQuizz/result.dart';

class TestDonePage extends StatefulWidget {
  TestDonePage({Key key, @required this.myResult, this.otherResult, this.value})
      : super(key: key);

  final Result myResult;
  final Result otherResult;
  final String value;
  @override
  _TestDonePageState createState() => _TestDonePageState();
}

class _TestDonePageState extends State<TestDonePage> {
  Result res2 = Result("");

  double pourcentage = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.otherResult != null) {
      res2 = widget.otherResult;
      pourcentage = widget.myResult.calculateMatch(widget.otherResult);
    } else {
      pourcentage = widget.myResult.calculateMatch(res2);
    }
  }

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
