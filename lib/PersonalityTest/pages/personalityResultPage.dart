import 'package:flutter/material.dart';
import 'package:matched_app/MatchingQuizz/result.dart';
import 'package:matched_app/PersonalityTest/personalityCalcul.dart';

class PersonalityResultPage extends StatefulWidget {
  PersonalityResultPage({Key key, @required this.myResult, this.value})
      : super(key: key);

  final Result myResult;
  final String value;

  @override
  _PersonalityResultPageState createState() => _PersonalityResultPageState();
}

class _PersonalityResultPageState extends State<PersonalityResultPage> {
  String personalityVal = "";

  double pourcentage = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    PersonalityCalcul ca = PersonalityCalcul();
    personalityVal = ca.getPersonnality(widget.myResult.res);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personnality Result'),
      ),
      body: Center(
          child: Column(
        children: [Text('Your personality is : ' + personalityVal)],
      )),
    );
  }
}
