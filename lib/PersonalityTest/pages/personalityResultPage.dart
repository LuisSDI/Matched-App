import 'package:flutter/material.dart';
import 'package:matched_app/MatchingQuizz/result.dart';
import 'package:matched_app/PersonalityTest/personalityCalcul.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PersonalityResultPage extends StatefulWidget {
  PersonalityResultPage(
      {Key key, @required this.myResult, this.value, @required this.identifier})
      : super(key: key);

  final Result myResult;
  final String value, identifier;

  @override
  _PersonalityResultPageState createState() => _PersonalityResultPageState();
}

class _PersonalityResultPageState extends State<PersonalityResultPage> {
  String personalityVal = "";

  double pourcentage = 0;

  FirebaseFirestore databaseReference = FirebaseFirestore.instance;

  void createRecord(String personality, String personality2) async {
    DocumentReference ref =
        await databaseReference.collection("Personality").add({
      'identifier': widget.identifier,
      'answer': widget.myResult.res,
      'personality': personality,
      'personality2': personality2
    });
    print("");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    PersonalityCalcul ca = PersonalityCalcul();
    personalityVal = ca.getPersonnality(widget.myResult.res);
    String personality = personalityVal.split(" ")[0];
    String personality2 = personalityVal.split("|")[1].split(" ")[0];
    createRecord(personality, personality2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personnality Result'),
      ),
      body: Center(
          child: Column(
        children: [
          Text('Your personality is : ' + personalityVal.split("|")[0])
        ],
      )),
    );
  }
}
