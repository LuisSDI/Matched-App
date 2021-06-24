import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'question.dart';
import 'result.dart';
import 'router.dart';

class QuizzPage extends StatefulWidget {
  QuizzPage(
      {Key key,
      this.docID = "Not known yet",
      @required this.identifier = "not known yet",
      this.gotInvitation = 0,
      this.otherResult = "",
      this.otherEmail})
      : super(key: key);
  final Result myResult = Result("");
  String docID, identifier, otherResult, otherEmail;
  int gotInvitation;

  @override
  _QuizzPageState createState() => _QuizzPageState();
}

class _QuizzPageState extends State<QuizzPage> {
  Result _myResult = Result("");
  Result _otherResult;
  @override
  void initState() {
    super.initState();
    _myResult = widget.myResult;
    _otherResult = Result(widget.otherResult);
  }

  FirebaseFirestore databaseReference = FirebaseFirestore.instance;

  void createRecord(String result) async {
    DocumentReference ref = await databaseReference
        .collection("MatchingTest")
        .add({'user': widget.identifier, 'result': result});
    print('doc id: ' + widget.docID);
    // await databaseReference
    //     .collection("Invitation")
    //     .doc(widget.docID)
    //     .update({'valueOfTo': result})
    //     .then((value) => print("Updated"))
    //     .catchError((error) => print("Failed to update invitation: $error"));
  }

  void updateInvitationTo(String to) async {
    await databaseReference
        .collection("Invitation")
        .doc(widget.docID)
        .update({'valueOfTo': to})
        .then((value) => print("Updated"))
        .catchError((error) => print("Failed to update invitation: $error"));
  }

  void addInvitation(String res) async {
    await databaseReference
        .collection("Invitation")
        .doc(widget.docID)
        .update({'valueOfFrom': res})
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
    FirebaseFirestore.instance
        .collection('MatchingTest')
        .where("user", isEqualTo: widget.identifier)
        .limit(1)
        .get()
        .then((QuerySnapshot value) {
      if (value.docs.isNotEmpty) {
        String val = value.docs.first.get("result").toString();

        if (widget.gotInvitation == 1) {
          //addInvitation(val);
          RouterCustom route = RouterCustom();
          Navigator.of(context).push(route.toMatchingScreen(widget.identifier));
        }
        if (widget.gotInvitation == 2) {
          Result myRes = Result(val);
          //updateInvitationTo(val);
          RouterCustom route = RouterCustom();
          Navigator.of(context).push(
              route.quizzToFinalResult(myRes, _otherResult, widget.otherEmail));
        }
        if (widget.gotInvitation == 3) {}
      }
    });
    if (widget.gotInvitation != 0) {
      return Scaffold(
          appBar: AppBar(
            title: Text('Matching Quizz'),
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
                      Question(
                        title:
                            "1.	Generally speaking, you rely more on your experience than your imagination.",
                        // a1: "1 - Strongly disagree",
                        // a2: "2 – Slightly disagree",
                        // a3: "3 – Neutral",
                        // a4: "4 – Slightly agree",
                        // a5: "5 – Strongly agree",
                        color: Colors.transparent,
                        result: widget.myResult,
                        resIndex: 0,
                      ),

                      Question(
                        title:
                            "2.	You find it easy to stay relaxed and focused even when there is some pressure.",
                        color: Colors.transparent,
                        result: widget.myResult,
                        resIndex: 1,
                      ),
                      Question(
                        title:
                            "3.	You rarely do something just out of pure curiosity.",
                        color: Colors.transparent,
                        result: widget.myResult,
                        resIndex: 2,
                      ),

                      Question(
                        title: "4.	People can rarely upset you.",
                        color: Colors.transparent,
                        result: widget.myResult,
                        resIndex: 3,
                      ),

                      Question(
                        title:
                            "5.	It is often difficult for you to relate to other people’s feelings.",
                        color: Colors.transparent,
                        result: widget.myResult,
                        resIndex: 4,
                      ),

                      Question(
                        title:
                            "6.	In a discussion, truth should be more important than people’s sensitivities.",
                        color: Colors.transparent,
                        result: widget.myResult,
                        resIndex: 5,
                      ),

                      Question(
                        title:
                            "7.	You think that everyone’s views should be respected regardless of whether they are supported by facts or not.",
                        color: Colors.transparent,
                        result: widget.myResult,
                        resIndex: 6,
                      ),

                      Question(
                        title:
                            "8.	You feel more energetic after spending time with a group of people.",
                        color: Colors.transparent,
                        result: widget.myResult,
                        resIndex: 7,
                      ),

                      Question(
                        title:
                            "9.	The most important thing about a friendship is having somebody to confide in.",
                        color: Colors.transparent,
                        result: widget.myResult,
                        resIndex: 8,
                      ),

                      Question(
                        title:
                            "10.	The most important thing about a friendship is having somebody to have fun with.",
                        color: Colors.transparent,
                        result: widget.myResult,
                        resIndex: 9,
                      ),

                      Question(
                        title:
                            "11.	If I had to pick, I would rather have a friend who enjoys doing the same things as me than a friend who feels the same way about life as I do.",
                        color: Colors.transparent,
                        result: widget.myResult,
                        resIndex: 10,
                      ),

                      Question(
                        title:
                            "12.	I feel it is easy to talk about my feelings with my friends.",
                        color: Colors.transparent,
                        result: widget.myResult,
                        resIndex: 11,
                      ),

                      Question(
                        title:
                            "13.	I think stranger’s opinions on me are important.",
                        color: Colors.transparent,
                        result: widget.myResult,
                        resIndex: 12,
                      ),

                      Question(
                        title:
                            "14.	I find it easy to admit it when I am wrong.",
                        color: Colors.transparent,
                        result: widget.myResult,
                        resIndex: 13,
                      ),

                      Question(
                        title:
                            "15.	I should keep in touch with my friend frequently",
                        color: Colors.transparent,
                        result: widget.myResult,
                        resIndex: 14,
                      ),

                      Question(
                        title:
                            "16.	During my free time, I prefer resting and chilling at home.(sleeping, reading book, watching movie)",
                        color: Colors.transparent,
                        result: widget.myResult,
                        resIndex: 15,
                      ),

                      Question(
                        title:
                            "17.	 During my free time, I prefer doing physical activities (workout, running, swimming …)",
                        color: Colors.transparent,
                        result: widget.myResult,
                        resIndex: 16,
                      ),

                      Question(
                        title:
                            "18.	During my free time, I prefer going out to socialize (volunteering, school clubs, events …)",
                        color: Colors.transparent,
                        result: widget.myResult,
                        resIndex: 17,
                      ),

                      ElevatedButton(
                          child: Text('Validate'),
                          onPressed: () {
                            if (widget.gotInvitation == 1) {
                              createRecord(widget.myResult.res);
                              RouterCustom route = RouterCustom();
                              Navigator.of(context).push(
                                  route.quizzToInvitation(widget.identifier));
                            }
                            if (widget.gotInvitation == 2) {
                              addResult();
                              RouterCustom route = RouterCustom();
                              Navigator.of(context).push(
                                  route.quizzToFinalResult(widget.myResult,
                                      _otherResult, widget.otherEmail));
                            }
                          }),
                    ],
                  ),
                ),
              ),
            ),
          ));
    } else {
      return Container(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //Text('My results : ' + _myResult.res),
                Question(
                  title:
                      "1.	Generally speaking, you rely more on your experience than your imagination.",
                  // a1: "1 - Strongly disagree",
                  // a2: "2 – Slightly disagree",
                  // a3: "3 – Neutral",
                  // a4: "4 – Slightly agree",
                  // a5: "5 – Strongly agree",
                  color: Colors.transparent,
                  result: widget.myResult,
                  resIndex: 0,
                ),

                Question(
                  title:
                      "2.	You find it easy to stay relaxed and focused even when there is some pressure.",
                  color: Colors.transparent,
                  result: widget.myResult,
                  resIndex: 1,
                ),
                Question(
                  title:
                      "3.	You rarely do something just out of pure curiosity.",
                  color: Colors.transparent,
                  result: widget.myResult,
                  resIndex: 2,
                ),

                Question(
                  title: "4.	People can rarely upset you.",
                  color: Colors.transparent,
                  result: widget.myResult,
                  resIndex: 3,
                ),

                Question(
                  title:
                      "5.	It is often difficult for you to relate to other people’s feelings.",
                  color: Colors.transparent,
                  result: widget.myResult,
                  resIndex: 4,
                ),

                Question(
                  title:
                      "6.	In a discussion, truth should be more important than people’s sensitivities.",
                  color: Colors.transparent,
                  result: widget.myResult,
                  resIndex: 5,
                ),

                Question(
                  title:
                      "7.	You think that everyone’s views should be respected regardless of whether they are supported by facts or not.",
                  color: Colors.transparent,
                  result: widget.myResult,
                  resIndex: 6,
                ),

                Question(
                  title:
                      "8.	You feel more energetic after spending time with a group of people.",
                  color: Colors.transparent,
                  result: widget.myResult,
                  resIndex: 7,
                ),

                Question(
                  title:
                      "9.	The most important thing about a friendship is having somebody to confide in.",
                  color: Colors.transparent,
                  result: widget.myResult,
                  resIndex: 8,
                ),

                Question(
                  title:
                      "10.	The most important thing about a friendship is having somebody to have fun with.",
                  color: Colors.transparent,
                  result: widget.myResult,
                  resIndex: 9,
                ),

                Question(
                  title:
                      "11.	If I had to pick, I would rather have a friend who enjoys doing the same things as me than a friend who feels the same way about life as I do.",
                  color: Colors.transparent,
                  result: widget.myResult,
                  resIndex: 10,
                ),

                Question(
                  title:
                      "12.	I feel it is easy to talk about my feelings with my friends.",
                  color: Colors.transparent,
                  result: widget.myResult,
                  resIndex: 11,
                ),

                Question(
                  title: "13.	I think stranger’s opinions on me are important.",
                  color: Colors.transparent,
                  result: widget.myResult,
                  resIndex: 12,
                ),

                Question(
                  title: "14.	I find it easy to admit it when I am wrong.",
                  color: Colors.transparent,
                  result: widget.myResult,
                  resIndex: 13,
                ),

                Question(
                  title: "15.	I should keep in touch with my friend frequently",
                  color: Colors.transparent,
                  result: widget.myResult,
                  resIndex: 14,
                ),

                Question(
                  title:
                      "16.	During my free time, I prefer resting and chilling at home.(sleeping, reading book, watching movie)",
                  color: Colors.transparent,
                  result: widget.myResult,
                  resIndex: 15,
                ),

                Question(
                  title:
                      "17.	 During my free time, I prefer doing physical activities (workout, running, swimming …)",
                  color: Colors.transparent,
                  result: widget.myResult,
                  resIndex: 16,
                ),

                Question(
                  title:
                      "18.	During my free time, I prefer going out to socialize (volunteering, school clubs, events …)",
                  color: Colors.transparent,
                  result: widget.myResult,
                  resIndex: 17,
                ),

                ElevatedButton(
                    child: Text('Validate'),
                    style: ButtonStyle(),
                    onPressed: () {
                      addResult();
                      RouterCustom route = RouterCustom();
                      Navigator.of(context)
                          .push(route.quizzToResult(widget.myResult));
                    }),
              ],
            ),
          ),
        ),
      );
    }
  }
}
