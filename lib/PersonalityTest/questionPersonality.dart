import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matched_app/MatchingQuizz/result.dart';

class QuestionPersonality extends StatefulWidget {
  QuestionPersonality(
      {Key key,
      this.title = "add the question here",
      this.a1 = "1 - Strongly disagree",
      this.a2 = "2 – Slightly disagree",
      this.a3 = "3 – Neutral",
      this.a4 = "4 – Slightly agree",
      this.color = Colors.cyan,
      this.result,
      this.resIndex = 0})
      : super(key: key);
  final String title, a1, a2, a3, a4;
  final List<String> questions = [];
  final Color color;
  final Result result;
  final int resIndex;

  @override
  _QuestionPersonalityState createState() => _QuestionPersonalityState();
}

class _QuestionPersonalityState extends State<QuestionPersonality> {
  bool _ch1 = false, _ch2 = false, _ch3 = false, _ch4 = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _ch1 = false;
    _ch2 = false;
    _ch3 = false;
    _ch4 = false;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
            margin: EdgeInsets.all(10),
            child: Text(
              widget.title,
              style: TextStyle(fontSize: 20),
            )),
        SizedBox(
          height: 50,
          child: CheckboxListTile(
              title: Text(
                widget.a1,
                style: GoogleFonts.lato(
                    textStyle: TextStyle(fontSize: 16, color: Colors.black)),
              ),
              value: _ch1,
              controlAffinity: ListTileControlAffinity.leading,
              onChanged: (bool value) {
                setState(() {
                  _ch2 = false;
                  _ch3 = false;
                  _ch4 = false;
                  _ch1 = value;
                  widget.result.allResults[widget.resIndex] = 1;
                  widget.result.initRes();
                });
              }),
        ),
        SizedBox(
          height: 50,
          child: CheckboxListTile(
              title: Text(
                widget.a2,
                style: GoogleFonts.lato(
                    textStyle: TextStyle(fontSize: 16, color: Colors.black)),
              ),
              value: _ch2,
              controlAffinity: ListTileControlAffinity.leading,
              onChanged: (bool value) {
                setState(() {
                  _ch1 = false;
                  _ch3 = false;
                  _ch4 = false;
                  _ch2 = value;
                  widget.result.allResults[widget.resIndex] = 2;
                  widget.result.initRes();
                });
              }),
        ),
        SizedBox(
          height: 50,
          child: CheckboxListTile(
              title: Text(
                widget.a3,
                style: GoogleFonts.lato(
                    textStyle: TextStyle(fontSize: 16, color: Colors.black)),
              ),
              value: _ch3,
              controlAffinity: ListTileControlAffinity.leading,
              onChanged: (bool value) {
                setState(() {
                  _ch2 = false;
                  _ch1 = false;
                  _ch4 = false;
                  _ch3 = value;
                  widget.result.allResults[widget.resIndex] = 3;
                  widget.result.initRes();
                });
              }),
        ),
        SizedBox(
          height: 50,
          child: CheckboxListTile(
              title: Text(
                widget.a4,
                style: GoogleFonts.lato(
                    textStyle: TextStyle(fontSize: 16, color: Colors.black)),
              ),
              value: _ch4,
              controlAffinity: ListTileControlAffinity.leading,
              onChanged: (bool value) {
                setState(() {
                  _ch2 = false;
                  _ch3 = false;
                  _ch1 = false;
                  _ch4 = value;

                  widget.result.allResults[widget.resIndex] = 4;
                  widget.result.initRes();
                });
              }),
        ),
      ],
    );
  }
}
