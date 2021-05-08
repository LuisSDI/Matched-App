import 'package:flutter/material.dart';
import 'package:matched_app/MatchingQuizz/result.dart';

class ResultPage extends StatefulWidget {
  ResultPage({Key key, @required this.myResult, this.otherResult, this.value})
      : super(key: key);

  final Result myResult;
  final Result otherResult;
  final String value;
  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
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
        title: Text('Result'),
      ),
      body: Center(
          child: Column(
        children: [
          Text('Result : ' + widget.myResult.res),
          Text('Result : ' + res2.res),
          Text('Percentage :' + pourcentage.toString())
        ],
      )),
    );
  }
}
