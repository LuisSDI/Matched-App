import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matched_app/MatchingQuizz/result.dart';
import 'package:matched_app/MatchingQuizz/router.dart';
import 'package:matched_app/RoommateMatching/pages/testDone.dart';
import 'package:matched_app/RoommateMatching/questionRoommate.dart';

class RoommateQuizzPage extends StatefulWidget {
  RoommateQuizzPage(
      {Key key,
      this.docID = "Not known yet",
      @required this.identifier = "not known yet",
      this.gotInvitation = 0,
      this.otherResult = "",
      this.uid})
      : super(key: key);
  final Result myResult = Result.reinit(15, "");
  String docID, identifier, otherResult;
  int gotInvitation;
  String uid;

  @override
  _RoommateQuizzPageState createState() => _RoommateQuizzPageState();
}

class _RoommateQuizzPageState extends State<RoommateQuizzPage> {
  Result _myResult = Result("");
  Result _otherResult;
  @override
  void initState() {
    super.initState();
    _myResult = widget.myResult;
    _otherResult = Result(widget.otherResult);
  }

  FirebaseFirestore databaseReference = FirebaseFirestore.instance;

  void addResult() async {
    databaseReference.collection("Roommate").doc(widget.uid).set({
      'identifier': widget.identifier,
      'result': widget.myResult.res
    }).then((_) {
      print("success!");
    });
  }

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore.instance
        .collection('Roommate')
        .where("identifier", isEqualTo: widget.identifier)
        .limit(1)
        .get()
        .then((QuerySnapshot value) {
      if (value.docs.isNotEmpty) {
        //String val = value.docs.first.get("result").toString();
        // RouterCustom route = RouterCustom();
        // Navigator.of(context).push(route.toTestDone());

        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => TestDonePage(
                    identifier: widget.identifier,
                  )),
        );

        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => TestDonePage()),
        // );
      }
    });
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Roommate matching quizz',
            style: GoogleFonts.lato(
                textStyle: TextStyle(fontSize: 20, color: Colors.tealAccent)),
          ),
        ),
        body: Center(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              // child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  QuestionRommate(
                    title: "1.	I want my room to be:",
                    a1: "1 - Quiet and study oriented",
                    a2: "2 – A social gathering place for friends to hang out",
                    a3: "3 – More quiet than social",
                    a4: "4 – More social than quiet",
                    color: Colors.transparent,
                    result: widget.myResult,
                    resIndex: 0,
                  ),
                  QuestionRommate(
                    title: "2.	When it comes to overnight guests",
                    a1: "1 - I am okay with overnight guests with 12 hr. notice  ",
                    a2: "2 – I am okay with unplanned overnight guests ",
                    a3: "3 – I prefer no overnight guests ",
                    a4: "4 – I don't mind",
                    color: Colors.transparent,
                    result: widget.myResult,
                    resIndex: 1,
                  ),
                  QuestionRommate(
                    title:
                        "3.	How do you feel about your roommate's significant other frequently spending time in your room?",
                    a1: "1 - I would usually be comfortable in this situation",
                    a2: "2 – I would usually agree if I didn't plan to be there",
                    a3: "3 – Only if my roommate asked and I agreed",
                    a4: "4 – I would agree if the significant other was not spending the night.",
                    color: Colors.transparent,
                    result: widget.myResult,
                    resIndex: 2,
                  ),
                  QuestionRommate(
                    title:
                        "4.	How do you feel about groups of people socializing in your room? ",
                    a1: "1 - This would be fine with me except when I am trying to sleep or study in my room. ",
                    a2: "2 – This would be fine occasionally.",
                    a3: "3 – I would be okay only if I didn't plan to be there. ",
                    a4: "4 – I would expect to find privacy in my room most of the time.",
                    color: Colors.transparent,
                    result: widget.myResult,
                    resIndex: 3,
                  ),
                  QuestionRommate(
                    title: "5.	I plan to spend:",
                    a1: "1 - Most of my time in my room ",
                    a2: "2 – Most of my time outside of my room ",
                    a3: "3 – No time in my room ",
                    a4: "4 – Half of my time in my room and half of my time out of the room ",
                    color: Colors.transparent,
                    result: widget.myResult,
                    resIndex: 4,
                  ),
                  QuestionRommate(
                    title: "6.	At home I clean my room:",
                    a1: "1 - Every week",
                    a2: "2 – Every 2 weeks",
                    a3: "3 – Every month",
                    a4: "4 – When I feel like it",
                    color: Colors.transparent,
                    result: widget.myResult,
                    resIndex: 5,
                  ),
                  QuestionRommate(
                    title: "7.	My ideal room temperature is:",
                    a1: "1 - Below 18°C",
                    a2: "2 – 18°C - 21°C ",
                    a3: "3 – 21°C - 24°C ",
                    a4: "4 – Above 24°C",
                    color: Colors.transparent,
                    result: widget.myResult,
                    resIndex: 6,
                  ),
                  QuestionRommate(
                    title: "8.	I plan on going home:",
                    a1: "1 - Every weekend",
                    a2: "2 – Every other weekend",
                    a3: "3 – Once a month",
                    a4: "4 – Rarely or only during academic breaks",
                    color: Colors.transparent,
                    result: widget.myResult,
                    resIndex: 7,
                  ),
                  QuestionRommate(
                    title: "9.	I got to bed:",
                    a1: "1 - Before 10pm",
                    a2: "2 – After 10pm before 11pm",
                    a3: "3 – After 11pm before midnight",
                    a4: "4 – After midnight",
                    color: Colors.transparent,
                    result: widget.myResult,
                    resIndex: 8,
                  ),
                  QuestionRommate(
                    title: "10.	I get up:",
                    a1: "1 - Before 8am",
                    a2: "2 – After 8am before 10am",
                    a3: "3 – After 10am before 12am",
                    a4: "4 – After 12pm",
                    color: Colors.transparent,
                    result: widget.myResult,
                    resIndex: 9,
                  ),
                  QuestionRommate(
                    title: "11.	I expect to study:",
                    a1: "1 - In my room ",
                    a2: "2 – Outside my room ",
                    a3: "3 – More in my room than outside",
                    a4: "4 – More outside than in my room",
                    color: Colors.transparent,
                    result: widget.myResult,
                    resIndex: 10,
                  ),
                  QuestionRommate(
                    title:
                        "12.	What kind of relationship are you looking for in a roommate?",
                    a1: "1 - To do everything together ",
                    a2: "2 – To be friends ",
                    a3: "3 – To be respectful and peacefully coexist",
                    a4: "4 – Indifferent",
                    color: Colors.transparent,
                    result: widget.myResult,
                    resIndex: 11,
                  ),
                  QuestionRommate(
                    title:
                        "13.	How would you feel about your roommate borrowing or sharing your personal belongings?",
                    a1: "1 -  I would not mind at all.",
                    a2: "2 –  I would not mind sharing things like broom, stereos, etc. but would mind sharing personal items like clothing.",
                    a3: "3 – I would not mind if I had been asked and had given my permission. ",
                    a4: "4 – I would not use other people's things and expect others not to use mine.",
                    color: Colors.transparent,
                    result: widget.myResult,
                    resIndex: 12,
                  ),
                  QuestionRommate(
                    title: "14.	I require: ",
                    a1: "1 - very little private time ",
                    a2: "2 – some private time ",
                    a3: "3 – a significant amount of private time ",
                    a4: "4 – no privacy at all",
                    color: Colors.transparent,
                    result: widget.myResult,
                    resIndex: 13,
                  ),
                  QuestionRommate(
                    title: "15.	What is most important in choosing a roommate?",
                    a1: "1 - Their study habit",
                    a2: "2 – Their personality",
                    a3: "3 – Their tidiness",
                    a4: "4 – Their room habit",
                    color: Colors.transparent,
                    result: widget.myResult,
                    resIndex: 14,
                  ),
                  ElevatedButton(
                      child: Text('Validate'),
                      onPressed: () {
                        addResult();
                        RouterCustom route = RouterCustom();
                        Navigator.of(context).push(route.toTestDone());
                      }),
                ],
              ),
            ),
          ),
          // ),
        ));
  }
}
