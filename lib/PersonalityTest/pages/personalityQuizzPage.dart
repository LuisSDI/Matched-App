import 'package:matched_app/PersonalityTest/questionPersonality.dart';
import 'package:flutter/material.dart';
import 'package:matched_app/MatchingQuizz/result.dart';
import 'package:matched_app/MatchingQuizz/router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PersonnalityQuizzPage extends StatefulWidget {
  PersonnalityQuizzPage(
      {Key key,
      this.docID = "Not known yet",
      this.identifier = "not known yet",
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

  void createRecord() async {
    DocumentReference ref = await databaseReference
        .collection("MatchingTest")
        .add({'user': widget.identifier, 'result': widget.myResult.res});
    print('doc id: ' + widget.docID);
    await databaseReference
        .collection("Invitation")
        .doc(widget.docID)
        .update({'valueOfFrom': widget.myResult.res})
        .then((value) => print("Updated"))
        .catchError((error) => print("Failed to update invitation: $error"));
  }

  void addResult() async {
    DocumentReference ref = await databaseReference
        .collection("MatchingTest")
        .add({'user': widget.identifier, 'result': widget.myResult.res});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Test'),
        ),
        body: Center(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    //Text('My results : ' + _myResult.res),
                    QuestionPersonality(
                      title:
                          "1.	Generally speaking, you rely more on your experience than your imagination.",
                      a1: "1 - Strongly disagree",
                      a2: "2 – Slightly disagree",
                      a3: "3 – Neutral",
                      a4: "4 – Slightly agree",
                      color: Colors.transparent,
                      result: widget.myResult,
                      resIndex: 0,
                    ),
                    QuestionPersonality(
                      title:
                          "2.	Generally speaking, you rely more on your experience than your imagination.",
                      a1: "1 - Strongly disagree",
                      a2: "2 – Slightly disagree",
                      a3: "3 – Neutral",
                      a4: "4 – Slightly agree",
                      color: Colors.transparent,
                      result: widget.myResult,
                      resIndex: 1,
                    ),
                    QuestionPersonality(
                      title:
                          "3.	Generally speaking, you rely more on your experience than your imagination.",
                      a1: "1 - Strongly disagree",
                      a2: "2 – Slightly disagree",
                      a3: "3 – Neutral",
                      a4: "4 – Slightly agree",
                      color: Colors.transparent,
                      result: widget.myResult,
                      resIndex: 2,
                    ),
                    QuestionPersonality(
                      title:
                          "4.	Generally speaking, you rely more on your experience than your imagination.",
                      a1: "1 - Strongly disagree",
                      a2: "2 – Slightly disagree",
                      a3: "3 – Neutral",
                      a4: "4 – Slightly agree",
                      color: Colors.transparent,
                      result: widget.myResult,
                      resIndex: 3,
                    ),
                    QuestionPersonality(
                      title:
                          "5.	Generally speaking, you rely more on your experience than your imagination.",
                      a1: "1 - Strongly disagree",
                      a2: "2 – Slightly disagree",
                      a3: "3 – Neutral",
                      a4: "4 – Slightly agree",
                      color: Colors.transparent,
                      result: widget.myResult,
                      resIndex: 4,
                    ),
                    QuestionPersonality(
                      title:
                          "6.	Generally speaking, you rely more on your experience than your imagination.",
                      a1: "1 - Strongly disagree",
                      a2: "2 – Slightly disagree",
                      a3: "3 – Neutral",
                      a4: "4 – Slightly agree",
                      color: Colors.transparent,
                      result: widget.myResult,
                      resIndex: 5,
                    ),
                    QuestionPersonality(
                      title:
                          "7.	Generally speaking, you rely more on your experience than your imagination.",
                      a1: "1 - Strongly disagree",
                      a2: "2 – Slightly disagree",
                      a3: "3 – Neutral",
                      a4: "4 – Slightly agree",
                      color: Colors.transparent,
                      result: widget.myResult,
                      resIndex: 6,
                    ),
                    QuestionPersonality(
                      title:
                          "8.	Generally speaking, you rely more on your experience than your imagination.",
                      a1: "1 - Strongly disagree",
                      a2: "2 – Slightly disagree",
                      a3: "3 – Neutral",
                      a4: "4 – Slightly agree",
                      color: Colors.transparent,
                      result: widget.myResult,
                      resIndex: 7,
                    ),
                    QuestionPersonality(
                      title:
                          "9.	Generally speaking, you rely more on your experience than your imagination.",
                      a1: "1 - Strongly disagree",
                      a2: "2 – Slightly disagree",
                      a3: "3 – Neutral",
                      a4: "4 – Slightly agree",
                      color: Colors.transparent,
                      result: widget.myResult,
                      resIndex: 8,
                    ),
                    QuestionPersonality(
                      title:
                          "10.	Generally speaking, you rely more on your experience than your imagination.",
                      a1: "1 - Strongly disagree",
                      a2: "2 – Slightly disagree",
                      a3: "3 – Neutral",
                      a4: "4 – Slightly agree",
                      color: Colors.transparent,
                      result: widget.myResult,
                      resIndex: 9,
                    ),
                    QuestionPersonality(
                      title:
                          "11.	Generally speaking, you rely more on your experience than your imagination.",
                      a1: "1 - Strongly disagree",
                      a2: "2 – Slightly disagree",
                      a3: "3 – Neutral",
                      a4: "4 – Slightly agree",
                      color: Colors.transparent,
                      result: widget.myResult,
                      resIndex: 10,
                    ),
                    QuestionPersonality(
                      title:
                          "12.	Generally speaking, you rely more on your experience than your imagination.",
                      a1: "1 - Strongly disagree",
                      a2: "2 – Slightly disagree",
                      a3: "3 – Neutral",
                      a4: "4 – Slightly agree",
                      color: Colors.transparent,
                      result: widget.myResult,
                      resIndex: 11,
                    ),
                    QuestionPersonality(
                      title:
                          "13.	Generally speaking, you rely more on your experience than your imagination.",
                      a1: "1 - Strongly disagree",
                      a2: "2 – Slightly disagree",
                      a3: "3 – Neutral",
                      a4: "4 – Slightly agree",
                      color: Colors.transparent,
                      result: widget.myResult,
                      resIndex: 12,
                    ),
                    QuestionPersonality(
                      title:
                          "14.	Generally speaking, you rely more on your experience than your imagination.",
                      a1: "1 - Strongly disagree",
                      a2: "2 – Slightly disagree",
                      a3: "3 – Neutral",
                      a4: "4 – Slightly agree",
                      color: Colors.transparent,
                      result: widget.myResult,
                      resIndex: 13,
                    ),
                    QuestionPersonality(
                      title:
                          "15.	Generally speaking, you rely more on your experience than your imagination.",
                      a1: "1 - Strongly disagree",
                      a2: "2 – Slightly disagree",
                      a3: "3 – Neutral",
                      a4: "4 – Slightly agree",
                      color: Colors.transparent,
                      result: widget.myResult,
                      resIndex: 14,
                    ),
                    QuestionPersonality(
                      title:
                          "16.	Generally speaking, you rely more on your experience than your imagination.",
                      a1: "1 - Strongly disagree",
                      a2: "2 – Slightly disagree",
                      a3: "3 – Neutral",
                      a4: "4 – Slightly agree",
                      color: Colors.transparent,
                      result: widget.myResult,
                      resIndex: 15,
                    ),
                    QuestionPersonality(
                      title:
                          "17.	Generally speaking, you rely more on your experience than your imagination.",
                      a1: "1 - Strongly disagree",
                      a2: "2 – Slightly disagree",
                      a3: "3 – Neutral",
                      a4: "4 – Slightly agree",
                      color: Colors.transparent,
                      result: widget.myResult,
                      resIndex: 16,
                    ),
                    QuestionPersonality(
                      title:
                          "18.	Generally speaking, you rely more on your experience than your imagination.",
                      a1: "1 - Strongly disagree",
                      a2: "2 – Slightly disagree",
                      a3: "3 – Neutral",
                      a4: "4 – Slightly agree",
                      color: Colors.transparent,
                      result: widget.myResult,
                      resIndex: 17,
                    ),
                    QuestionPersonality(
                      title:
                          "19.	Generally speaking, you rely more on your experience than your imagination.",
                      a1: "1 - Strongly disagree",
                      a2: "2 – Slightly disagree",
                      a3: "3 – Neutral",
                      a4: "4 – Slightly agree",
                      color: Colors.transparent,
                      result: widget.myResult,
                      resIndex: 18,
                    ),
                    QuestionPersonality(
                      title:
                          "20.	Generally speaking, you rely more on your experience than your imagination.",
                      a1: "1 - Strongly disagree",
                      a2: "2 – Slightly disagree",
                      a3: "3 – Neutral",
                      a4: "4 – Slightly agree",
                      color: Colors.transparent,
                      result: widget.myResult,
                      resIndex: 19,
                    ),
                    QuestionPersonality(
                      title:
                          "21.	Generally speaking, you rely more on your experience than your imagination.",
                      a1: "1 - Strongly disagree",
                      a2: "2 – Slightly disagree",
                      a3: "3 – Neutral",
                      a4: "4 – Slightly agree",
                      color: Colors.transparent,
                      result: widget.myResult,
                      resIndex: 20,
                    ),
                    QuestionPersonality(
                      title:
                          "22.	Generally speaking, you rely more on your experience than your imagination.",
                      a1: "1 - Strongly disagree",
                      a2: "2 – Slightly disagree",
                      a3: "3 – Neutral",
                      a4: "4 – Slightly agree",
                      color: Colors.transparent,
                      result: widget.myResult,
                      resIndex: 21,
                    ),
                    QuestionPersonality(
                      title:
                          "23.	Generally speaking, you rely more on your experience than your imagination.",
                      a1: "1 - Strongly disagree",
                      a2: "2 – Slightly disagree",
                      a3: "3 – Neutral",
                      a4: "4 – Slightly agree",
                      color: Colors.transparent,
                      result: widget.myResult,
                      resIndex: 22,
                    ),
                    QuestionPersonality(
                      title:
                          "24.	Generally speaking, you rely more on your experience than your imagination.",
                      a1: "1 - Strongly disagree",
                      a2: "2 – Slightly disagree",
                      a3: "3 – Neutral",
                      a4: "4 – Slightly agree",
                      color: Colors.transparent,
                      result: widget.myResult,
                      resIndex: 23,
                    ),

                    ElevatedButton(
                        child: Text('Validate'),
                        onPressed: () {
                          // createRecord();
                          RouterCustom route = RouterCustom();
                          Navigator.of(context).push(
                              route.personalityQuizzToResult(widget.myResult));
                        }),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
