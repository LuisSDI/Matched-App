import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matched_app/MatchingQuizz/result.dart';
import 'package:matched_app/MatchingQuizz/router.dart';

class ResultPage extends StatefulWidget {
  ResultPage(
      {Key key,
      @required this.myResult,
      this.otherResult,
      this.value,
      this.otherName = "unknown"})
      : super(key: key);

  final Result myResult;
  final Result otherResult;
  final String value, otherName;
  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  Result res2 = Result("");
  String name = "";

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
//        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Text('Result : ' + widget.myResult.res),
          // Text('Result : ' + res2.res),
          Container(
            child: Text('Your match  with ' + widget.otherName + ' is :',
                style: GoogleFonts.lato(
                    textStyle: TextStyle(fontSize: 22, color: Colors.white))),
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(15),
            //color: Colors.purple,
            decoration: BoxDecoration(
              color: Colors.purple,
              borderRadius: BorderRadius.circular(10),
              // boxShadow: [
              //   BoxShadow(color: Colors.green, spreadRadius: 3),
              // ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(MediaQuery.of(context).size.height / 10),
            child: Center(
                child: Text(pourcentage.toString().substring(0, 2) + " % ",
                    style: GoogleFonts.lato(
                        textStyle:
                            TextStyle(fontSize: 60, color: Colors.purple)))),
          ),
          // Container(
          //   height: MediaQuery.of(context).size.height / 2,
          // ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.purple,
            ),
            child: Text("return"),
            onPressed: () async {
              RouterCustom route = RouterCustom();
              Navigator.of(context).pushAndRemoveUntil(
                  route.toMatchingScreen(""), (route) => false);
            },
          )
        ],
      )),
    );
  }
}
