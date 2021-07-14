import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matched_app/main_pages/test_pages/personality_test/personality_test_info.dart';
import 'package:matched_app/main_pages/test_pages/personality_test/personality_test_part2.dart';
import 'package:matched_app/main_pages/test_pages/roommate_test/roommate_test_info.dart';
import 'package:matched_app/main_pages/test_pages/roommate_test/social_test.dart';
import 'package:matched_app/resources/checkbox_choice_question.dart';
import 'package:matched_app/resources/multi_choice_question.dart';
import 'package:matched_app/resources/simple_buttom.dart';
import 'package:matched_app/ui_resources/custom_colors.dart';

class HabitsTest extends StatefulWidget {
  const HabitsTest({Key key}) : super(key: key);

  @override
  _HabitsTestState createState() => _HabitsTestState();
}

class _HabitsTestState extends State<HabitsTest> {
  String test;

  List<String> questions = RoommateTestInfo().habitsQuestions;
  List<int> results = List<int>.filled(19, null);
  Map<int, List<String>> answers = RoommateTestInfo().habitsAnswers;

  updateSelection(int index, val) {
    setState(() {
      results[index] = val;
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
                    """Roommate Habits"""
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
                """Prior to making the commitment to room with an individual it is important to determine your roommate habits. Your answers will help to show what are your preferences and with which type of person you would like to live with."""
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
                  child: MultiChoiceQuestion(
                    updateSelection: updateSelection,
                    question: questions[index],
                    answers: answers[index],
                    index: index,
                  ),
                );
              },
              itemCount: questions.length,
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
                bool isfinished = true;
                for (var i=0; i<results.length; i++) {
                  if(results[i] == null){
                    isfinished = false;
                    break;
                  }
                }
                if (isfinished) {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => SocialTest(
                    habitsAns: results,
                  )));
                }
                else{
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: mainColor,
                      duration: Duration(seconds: 3),
                      content: Container(
                          height: scaler.getHeight(5),
                          child: Center(child: Text('Please anwser all the questions to continue',
                            style:
                            GoogleFonts.lato(
                                fontSize: 18
                            ),))),

                    ),
                  );
                }

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
