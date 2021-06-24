import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matched_app/main_pages/test_pages/personality_test/personality_test_info.dart';
import 'package:matched_app/main_pages/test_pages/personality_test/personality_test_part2.dart';
import 'package:matched_app/resources/checkbox_choice_question.dart';
import 'package:matched_app/resources/multi_choice_question.dart';
import 'package:matched_app/resources/simple_buttom.dart';
import 'package:matched_app/ui_resources/custom_colors.dart';

class PersonalityTestPart1 extends StatefulWidget {
  const PersonalityTestPart1({Key key}) : super(key: key);

  @override
  _PersonalityTestPart1State createState() => _PersonalityTestPart1State();
}

class _PersonalityTestPart1State extends State<PersonalityTestPart1> {
  String test;

  List<String> questions = PersonalityTestInfo().questions;
  List<int> results = List<int>.filled(26, null);
  Map<int, List<String>> answers = PersonalityTestInfo().answers;

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
                  top: scaler.getHeight(3), bottom: scaler.getHeight(1.5)),
              child: Row(
                children: <Widget>[
                  //Buttom for back
                  Container(
                    child: IconButton(
                      icon: Icon(
                        Icons.cancel,
                        color: mainColor,
                        size: 30,
                      ),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ),
                  //Title Text
                  Text(
                    """Which answer comes closer 
to telling how you usually feel 
or act?"""
                        .trim(),
                    style: GoogleFonts.lato(
                        textStyle: TextStyle(
                            fontSize: 24,
                            color: white,
                            fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
            ListView.builder(
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(scaler.getWidth(2)),
                  child: index != 24 ? MultiChoiceQuestion(
                    updateSelection: updateSelection,
                    question: questions[index],
                    answers: answers[index],
                    index: index,
                  ): CheckBoxChoiceQuestion(
                    updateSelection: updateSelection,
                    index: index,
                    question: questions[index],
                    answers: answers[index],
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
                print(results);
                bool isfinished = true;
                for (var i=0; i<results.length; i++) {
                  if(results[i] == null){
                    isfinished = false;
                    break;
                  }
                }
                if (isfinished) {
                  print(results);
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => PersonalityTestPart2(
                    previousResults: results,
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
