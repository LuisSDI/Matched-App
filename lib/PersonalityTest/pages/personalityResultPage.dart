import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matched_app/MatchingQuizz/result.dart';
import 'package:matched_app/MatchingQuizz/router.dart';
import 'package:matched_app/PersonalityTest/personalityCalcul.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:matched_app/bloc/user_bloc.dart';
import 'package:matched_app/main_pages/home_page.dart';

class PersonalityResultPage extends StatefulWidget {
  PersonalityResultPage(
      {Key key,
      @required this.myResult,
      this.hasValue = false,
      this.result,
      this.value, this.uid,
      @required this.identifier})
      : super(key: key);

  final Result myResult;
  final String value, identifier;
  String result;
  bool hasValue;
  String uid;
  UserBloc userBloc;

  @override
  _PersonalityResultPageState createState() => _PersonalityResultPageState();
}

class _PersonalityResultPageState extends State<PersonalityResultPage> {
  String personalityVal = "";

  double pourcentage = 0;

  FirebaseFirestore databaseReference = FirebaseFirestore.instance;

  void createRecord(String personality, String personality2) async {
    databaseReference.collection("Personality").doc(widget.uid).set({
      'identifier': widget.identifier,
      'answer': widget.myResult.res,
      'personality': personality,
      'personality2': personality2
    }).then((_){
      print("success!");
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.hasValue) {
      PersonalityCalcul ca = PersonalityCalcul();
      personalityVal = ca.getPersonnality(widget.result);
    } else {
      PersonalityCalcul ca = PersonalityCalcul();
      personalityVal = ca.getPersonnality(widget.myResult.res);
      String personality = personalityVal.split(" ")[0];
      String personality2 = personalityVal.split("|")[1].split(" ")[0];
      createRecord(personality, personality2);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
            decoration: BoxDecoration(
                //color: Colors.teal,
                ),
            child: Text('Personnality Result',
                style: GoogleFonts.lato(
                    textStyle: TextStyle(fontSize: 22, color: Colors.white)))),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.all(15),
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.teal,
            ),
            child: Center(
                child: Text('Your personality is : ',
                    style: GoogleFonts.lato(
                        textStyle:
                            TextStyle(fontSize: 16, color: Colors.white)))),
          ),
          Container(
            padding: EdgeInsets.all(15),
            margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
            height: MediaQuery.of(context).size.height / 2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(120),
              color: Colors.purple,
            ),
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(120),
                  color: Colors.white,
                ),
                child: Center(
                  child: Text(
                    personalityVal.split("|")[0].split("-")[0],
                    style: GoogleFonts.lato(
                        textStyle: TextStyle(
                      fontSize: 40,
                      shadows: [
                        Shadow(
                          blurRadius: 2.0,
                          color: Colors.deepPurple,
                          offset: Offset(2.0, 2.0),
                        ),
                        Shadow(
                          blurRadius: 10.0,
                          color: Colors.white,
                          offset: Offset(3.0, 3.0),
                        ),
                      ],
                    )),
                  ),
                ),
              ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.teal,
            ),
            child: Text("return"),
            onPressed: () async {
              UserBloc userBloc = BlocProvider.of(context);
              User currentUser = userBloc.currentUser;
              RouterCustom route = RouterCustom();
              Navigator.of(context).pushAndRemoveUntil(
                  route.toHomePage(currentUser.email), (route) => false);
            },
          )
        ],
      )),
    );
  }
}
