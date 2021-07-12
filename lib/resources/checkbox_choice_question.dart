import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matched_app/grouped_buttons/src/checkbox_group.dart';

import 'package:matched_app/ui_resources/custom_colors.dart';

class CheckBoxChoiceQuestion extends StatefulWidget {
  CheckBoxChoiceQuestion({
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
  _CheckBoxChoiceQuestionState createState() => _CheckBoxChoiceQuestionState();
}

class _CheckBoxChoiceQuestionState extends State<CheckBoxChoiceQuestion> {
  List<List<String>> choices = [
    ["ABC", "AAB", "ACD"], // 1st qns has 3 choices
    ["AND", "CQA", "QWE", "QAL"], // 2nd qns has 4 choices
    ["ASD", "JUS", "JSB"] // 3rd qns has 3 choices
  ];

  String currentval;

  List<String> selectedItems;
  List<String> blockedItems = [];
  List<String> _checked = [];

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
                height: screenScaler.getWidth(15),
                child: Text(
                  widget.question,
                  style: GoogleFonts.lato(color: white,
                      fontWeight: FontWeight.bold, fontSize: 18),
                )),
          ),
          Container(
            decoration: BoxDecoration(
                color: deepBlue,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(15),
                    bottomLeft: Radius.circular(15))),
            child: CheckboxGroup(
              labels: widget.answers,
              margin: EdgeInsets.zero,
              labelStyle: GoogleFonts.lato(
                color: white,
                fontSize: 16,

              ),
              activeColor: mainColor,
              checkColor: white,
              disabled: blockedItems,
              onSelected: (List selected) {
                setState(() {
                  if (selected.length == 2) {
                    widget.answers.forEach((element) {
                      if(!selected.contains(element)){
                        blockedItems.add(element);
                      }
                    });
                  }
                  else if (selected.length < 2) {
                    blockedItems.clear();
                  }
                  _checked = selected;
                  String answerSel = '';
                  for (var i = 0; i < selected.length; i++) {
                    answerSel += (widget.answers.indexOf(selected[i])+1).toString();
                  }
                  if (answerSel.isEmpty) {
                    widget.updateSelection(widget.index, null);
                  }
                  else {
                    widget.updateSelection(widget.index, int.parse(answerSel));
                  }
                });
              },
            )
          )
        ],
      ),
    );
  }
}
