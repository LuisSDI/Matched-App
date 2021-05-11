import 'package:matched_app/PersonalityTest/questionPersonality.dart';
import 'package:flutter/material.dart';
import 'package:matched_app/MatchingQuizz/result.dart';
import 'package:matched_app/MatchingQuizz/router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:matched_app/PersonalityTest/pages/personalityResultPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PersonnalityQuizzPage extends StatefulWidget {
  PersonnalityQuizzPage(
      {Key key,
      this.docID = "Not known yet",
      @required this.identifier,
      this.gotInvitation = 0,
      this.otherResult = ""})
      : super(key: key);
  final Result myResult = Result.reinit(24, "");
  String docID, identifier, otherResult;
  int gotInvitation;

  @override
  _PersonnalityQuizzPageState createState() => _PersonnalityQuizzPageState();
}

class _PersonnalityQuizzPageState extends State<PersonnalityQuizzPage> {
  Result _myResult = Result("");
  Result _otherResult;
  @override
  void initState() {
    super.initState();
    _myResult = widget.myResult;
    _otherResult = Result(widget.otherResult);
  }

  FirebaseFirestore databaseReference = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore.instance
        .collection('Personality')
        .where("identifier", isEqualTo: widget.identifier)
        .limit(1)
        .get()
        .then((QuerySnapshot value) {
      if (value.docs.isNotEmpty) {
        String val = value.docs.first.get("answer").toString();
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => PersonalityResultPage(
                    identifier: widget.identifier,
                    result: val,
                    hasValue: true,
                    myResult: Result.reinit(24, val),
                  )),
        );
      }
    });
    return Scaffold(
        appBar: AppBar(
          title: Text('Personality Test'),
        ),
        body: Center(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Instruction"),
                    Text(""),
                    QuestionPersonality(
                      title: "1. ",
                      a1: "A - Restrained",
                      a2: "B - Forceful",
                      a3: "C - Careful",
                      a4: "D - Expressive",
                      color: Colors.transparent,
                      result: widget.myResult,
                      resIndex: 0,
                    ),
                    QuestionPersonality(
                      title: "2.",
                      a1: "A - Pioneering",
                      a2: "B - Correct",
                      a3: "C - Exciting",
                      a4: "D - Precise",
                      color: Colors.teal[100],
                      result: widget.myResult,
                      resIndex: 1,
                    ),
                    QuestionPersonality(
                      title: "3.",
                      a1: "A - Willing",
                      a2: "B - Animated",
                      a3: "C - Bold",
                      a4: "D - Precise",
                      color: Colors.transparent,
                      result: widget.myResult,
                      resIndex: 2,
                    ),
                    QuestionPersonality(
                      title: "4.",
                      a1: "A - Argumentative",
                      a2: "B - Doubting",
                      a3: "C - Indecisive",
                      a4: "D - Unpredictable",
                      color: Colors.transparent,
                      result: widget.myResult,
                      resIndex: 3,
                    ),
                    QuestionPersonality(
                      title: "5.",
                      a1: "A - Respectful",
                      a2: "B - Out-going",
                      a3: "C - Patient",
                      a4: "D - Daring",
                      color: Colors.teal[100],
                      result: widget.myResult,
                      resIndex: 4,
                    ),
                    QuestionPersonality(
                      title: "6.",
                      a1: "A - Persuasive",
                      a2: "B - Self-reliant",
                      a3: "C - Logical",
                      a4: "D - Gentle",
                      color: Colors.transparent,
                      result: widget.myResult,
                      resIndex: 5,
                    ),
                    QuestionPersonality(
                      title: "7.",
                      a1: "A - Cautious",
                      a2: "B - Even-tempered",
                      a3: "C - Decisive",
                      a4: "D - Life-of-the-party",
                      color: Colors.teal[100],
                      result: widget.myResult,
                      resIndex: 6,
                    ),
                    QuestionPersonality(
                      title: "8.",
                      a1: "A - Popular",
                      a2: "B - Assertive",
                      a3: "C - Perfectionist",
                      a4: "D - Generous",
                      color: Colors.transparent,
                      result: widget.myResult,
                      resIndex: 7,
                    ),
                    QuestionPersonality(
                      title: "9.",
                      a1: "A - Colorful",
                      a2: "B - Modest",
                      a3: "C - Easy-going",
                      a4: "D - Unyielding",
                      color: Colors.teal[100],
                      result: widget.myResult,
                      resIndex: 8,
                    ),
                    QuestionPersonality(
                      title: "10.",
                      a1: "A - Systematic",
                      a2: "B - Optimistic",
                      a3: "C - Persistent",
                      a4: "D - Accommodating",
                      color: Colors.transparent,
                      result: widget.myResult,
                      resIndex: 9,
                    ),
                    QuestionPersonality(
                      title: "11.",
                      a1: "A - Relentless",
                      a2: "B - Humble",
                      a3: "C - Neighborly",
                      a4: "D - Talkative",
                      color: Colors.teal[100],
                      result: widget.myResult,
                      resIndex: 10,
                    ),
                    QuestionPersonality(
                      title: "12.",
                      a1: "A - Friendly",
                      a2: "B - Observant",
                      a3: "C - Playful",
                      a4: "D - Strong-willed",
                      color: Colors.transparent,
                      result: widget.myResult,
                      resIndex: 11,
                    ),
                    QuestionPersonality(
                      title: "13.",
                      a1: "A - Charming",
                      a2: "B - Adventurous",
                      a3: "C - Disciplined",
                      a4: "D - Deliberate",
                      color: Colors.teal[100],
                      result: widget.myResult,
                      resIndex: 12,
                    ),
                    QuestionPersonality(
                      title: "14.",
                      a1: "A - Restrained",
                      a2: "B - Steady",
                      a3: "C - Aggresive",
                      a4: "D - Attractive",
                      color: Colors.transparent,
                      result: widget.myResult,
                      resIndex: 13,
                    ),
                    QuestionPersonality(
                      title: "15.",
                      a1: "A - Enthusiastic",
                      a2: "B - Analytical",
                      a3: "C - Sympathetic",
                      a4: "D - Determined",
                      color: Colors.teal[100],
                      result: widget.myResult,
                      resIndex: 14,
                    ),
                    QuestionPersonality(
                      title: "16.",
                      a1: "A - Commanding",
                      a2: "B - Impulsive",
                      a3: "C - Slow-paced",
                      a4: "D - Critical",
                      color: Colors.transparent,
                      result: widget.myResult,
                      resIndex: 15,
                    ),
                    QuestionPersonality(
                      title: "17.",
                      a1: "A - Consistent ",
                      a2: "B - Force-of-character",
                      a3: "C - Lively",
                      a4: "D - Laid-back",
                      color: Colors.teal[100],
                      result: widget.myResult,
                      resIndex: 16,
                    ),
                    QuestionPersonality(
                      title: "18.",
                      a1: "A - Influential",
                      a2: "B - Kind",
                      a3: "C - Independent",
                      a4: "D - Orderly",
                      color: Colors.transparent,
                      result: widget.myResult,
                      resIndex: 17,
                    ),
                    QuestionPersonality(
                      title: "19.",
                      a1: "A - Influential",
                      a2: "B - Popular",
                      a3: "C - Pleasant",
                      a4: "D - Out-spoken",
                      color: Colors.teal[100],
                      result: widget.myResult,
                      resIndex: 18,
                    ),
                    QuestionPersonality(
                      title: "20.",
                      a1: "A - Impatient",
                      a2: "B - Serious",
                      a3: "C - Procrastinator",
                      a4: "D - Emotional",
                      color: Colors.transparent,
                      result: widget.myResult,
                      resIndex: 19,
                    ),
                    QuestionPersonality(
                      title: "21.",
                      a1: "A - Competitive",
                      a2: "B - Spontaneous",
                      a3: "C - Loyal",
                      a4: "D - Thoughtful",
                      color: Colors.teal[100],
                      result: widget.myResult,
                      resIndex: 20,
                    ),
                    QuestionPersonality(
                      title: "22.",
                      a1: "A - Self-sacrificing",
                      a2: "B - Considerate",
                      a3: "C - Convincing",
                      a4: "D - Courageous",
                      color: Colors.transparent,
                      result: widget.myResult,
                      resIndex: 21,
                    ),
                    QuestionPersonality(
                      title: "23.",
                      a1: "A - Dependant",
                      a2: "B - Flighty",
                      a3: "C - Stoic",
                      a4: "D - Pushy",
                      color: Colors.teal[100],
                      result: widget.myResult,
                      resIndex: 22,
                    ),
                    QuestionPersonality(
                      title: "24.",
                      a1: "A - Tolerant",
                      a2: "B - Conventional",
                      a3: "C - Stimulating",
                      a4: "D - Directing",
                      color: Colors.transparent,
                      result: widget.myResult,
                      resIndex: 23,
                    ),
                    ElevatedButton(
                        child: Text('Validate'),
                        onPressed: () {
                          RouterCustom route = RouterCustom();
                          Navigator.of(context).push(
                              route.personalityQuizzToResult(
                                  widget.myResult, widget.identifier));
                        }),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
