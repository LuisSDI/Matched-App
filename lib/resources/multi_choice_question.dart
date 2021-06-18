import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matched_app/ui_resources/custom_colors.dart';

class MultiChoiceQuestion extends StatefulWidget {
  MultiChoiceQuestion({
    Key key,
    this.updateSelection,
  this.question,
    this.answers, this.index
  }) : super(key: key);

  String question;
  List<String> answers;
  final updateSelection;
  final int index;
  @override
  _MultiChoiceQuestionState createState() => _MultiChoiceQuestionState();
}

class _MultiChoiceQuestionState extends State<MultiChoiceQuestion> {
  List<List<String>> choices = [
    ["ABC", "AAB", "ACD"], // 1st qns has 3 choices
    ["AND", "CQA", "QWE", "QAL"], // 2nd qns has 4 choices
    ["ASD", "JUS", "JSB"] // 3rd qns has 3 choices
  ];

  String currentval;

  @override
  Widget build(BuildContext context) {
    ScreenScaler screenScaler = ScreenScaler()..init(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenScaler.getWidth(2)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          DecoratedBox(
            decoration: BoxDecoration(
                color: mainColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15))),
            child: Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(
                top: screenScaler.getWidth(1),
                left: screenScaler.getWidth(.5)
              ),
                width: double.infinity,
                height: screenScaler.getWidth(11),
                child: Text(
              widget.question,
              style: GoogleFonts.lato(color: white, fontSize: 18),
            )),
          ),
          Container(
            decoration: BoxDecoration(
                color: deepBlue,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(15),
                    bottomLeft: Radius.circular(15))),
            child: Column(
              children: widget.answers.map((item) {
                //change index of choices array as you need
                return RadioListTile(
                  groupValue: currentval,
                  contentPadding: EdgeInsets.symmetric(
                      horizontal: screenScaler.getWidth(2)),
                  dense: false,
                  title: Text(
                    item,
                    style: GoogleFonts.lato(color: Colors.white, fontSize: 16),
                  ),
                  value: item,
                  activeColor: mainColor,
                  onChanged: (val) {
                    currentval = val;
                    widget.updateSelection(widget.index,widget.answers.indexOf(val));
                  },
                );
              }).toList(),
            ),
          )
        ],
      ),
    );
  }
}
