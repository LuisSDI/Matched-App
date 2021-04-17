import 'question.dart';
import 'package:flutter/material.dart';
import 'result.dart';
import 'router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class QuizzPage extends StatefulWidget {
  QuizzPage({Key key}) : super(key: key);
  final Result myResult = Result();

  @override
  _QuizzPageState createState() => _QuizzPageState();
}

class _QuizzPageState extends State<QuizzPage> {
  Result _myResult = Result();
  @override
  void initState() {
    super.initState();
    _myResult = widget.myResult;
  }

  FirebaseFirestore databaseReference = FirebaseFirestore.instance;
  void createRecord() async {
    DocumentReference ref = await databaseReference
        .collection("MatchingTest")
        .add({'user': 'not known yet', 'result': widget.myResult.res});
  }

  @override
  Widget build(BuildContext context) {
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
                title: "3.	You rarely do something just out of pure curiosity.",
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
                  onPressed: () {
                    createRecord();
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
