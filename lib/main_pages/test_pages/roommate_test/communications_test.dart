import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matched_app/main_pages/test_pages/roommate_test/activities_test.dart';
import 'package:matched_app/main_pages/test_pages/roommate_test/roommate_test_info.dart';
import 'package:matched_app/resources/simple_buttom.dart';
import 'package:matched_app/resources/slider_choice_question.dart';
import 'package:matched_app/ui_resources/custom_colors.dart';

class CommunicationsTest extends StatefulWidget {
  const CommunicationsTest({Key key, this.habitsAns, this.socialAns, this.beliefAns}) : super(key: key);

  final List<int> habitsAns;

  final List<int> socialAns;

  final List<int> beliefAns;
  @override
  _CommunicationsTestState createState() => _CommunicationsTestState();
}

class _CommunicationsTestState extends State<CommunicationsTest> {

  List<int> communAns = List<int>.filled(9, 2);
  List<String> questions = RoommateTestInfo().communicationsQuestion;
  List<String> answers = RoommateTestInfo().interestAnswers;

  updateSelection(int index, val) {
    setState(() {
      communAns[index] = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    ScreenScaler scaler = ScreenScaler()..init(context);
    return Scaffold(
      backgroundColor: dark,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                  top: scaler.getHeight(3), bottom: scaler.getHeight(.5)),
              child: Row(
                children: <Widget>[
                  //Buttom for back
                  Container(
                    child: IconButton(
                      icon: Icon(
                        Ionicons.ios_arrow_back,
                        color: mainColor,
                        size: 30,
                      ),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ),
                  //Title Text
                  Text(
                    """Communications"""
                        .trim(),
                    style: GoogleFonts.lato(
                        textStyle: TextStyle(
                            fontSize: 36,
                            color: white,
                            fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(
                left: scaler.getWidth(2),
              ),
              child: Text(
                """Please answer each question by sliding to the option that represents your preference. There are no wrong answers"""
                    .trim(),
                style: GoogleFonts.lato(
                    textStyle: TextStyle(
                        fontSize: 20,
                        color: white,
                        fontWeight: FontWeight.normal)),
              ),
            ),

            ListView.builder(
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(scaler.getWidth(2)),
                  child: SliderChoiceQuestion(
                    question: questions[index],
                    answers: answers,
                    index: index,
                    initVal: 2,
                    updateSelection: updateSelection,
                  ),
                );
              },
              itemCount: communAns.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
            ),
            //Intro Text
            SizedBox(
              height: scaler.getHeight(1),
            ),
            SimpleButtonAdvanced(
              onTap: () {

                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ActivitiesTest(
                        beliefAns: widget.beliefAns,
                        habitsAns: widget.habitsAns,
                        socialAns: widget.socialAns,
                        communAns: communAns,
                      )));
              },
              text: "Continue",
            ),
            SizedBox(
              height: scaler.getHeight(2),
            ),

            // Container(
            //   height: scaler.getHeight(10),
            //   decoration: BoxDecoration(gradient: turkish),
            // )
          ],
        ),
      ),
      // bottomNavigationBar: Container(
      //   height: scaler.getHeight(10),
      //   decoration: BoxDecoration(gradient: turkish),
      // )
    );
  }
}
