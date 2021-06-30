import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matched_app/main_pages/test_pages/roommate_test/communications_test.dart';
import 'package:matched_app/main_pages/test_pages/roommate_test/roommate_test_info.dart';
import 'package:matched_app/resources/simple_buttom.dart';
import 'package:matched_app/resources/slider_choice_question.dart';
import 'package:matched_app/ui_resources/custom_colors.dart';

class BeliefTest extends StatefulWidget {
  const BeliefTest({Key key, this.habitsAns, this.socialAns}) : super(key: key);

  final List<int> habitsAns;

  final List<int> socialAns;
  @override
  _BeliefTestState createState() => _BeliefTestState();
}

class _BeliefTestState extends State<BeliefTest> {

  List<int> beliefAns = List<int>.filled(7, 2);
  List<String> questions = RoommateTestInfo().beliefQuestion;
  List<String> answers = RoommateTestInfo().interestAnswers;

  updateSelection(int index, val) {
    setState(() {
      beliefAns[index] = val;
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
                    """Religion / Beliefs """
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
              itemCount: beliefAns.length,
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

                print(widget.habitsAns);
                print(widget.socialAns);
                print(beliefAns);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CommunicationsTest(
                        socialAns: widget.socialAns,
                        habitsAns: widget.habitsAns,
                        beliefAns: beliefAns,
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
