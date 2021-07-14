import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matched_app/main_pages/test_pages/personality_test/personality_test_info.dart';
import 'package:matched_app/main_pages/test_pages/personality_test/personality_test_result.dart';
import 'package:matched_app/resources/simple_buttom.dart';
import 'package:matched_app/resources/slider_choice_question.dart';
import 'package:matched_app/ui_resources/custom_colors.dart';

class PersonalityTestPart2 extends StatefulWidget {
  const PersonalityTestPart2({Key key, this.previousResults}) : super(key: key);

  final List<int> previousResults;

  @override
  _PersonalityTestPart2State createState() => _PersonalityTestPart2State();
}

class _PersonalityTestPart2State extends State<PersonalityTestPart2> {
  String test;

  List<int> results = List<int>.filled(50, 0);

  setupResults() {
    setState(() {
      for (var i = 0; i < widget.previousResults.length; i++) {
        results[i] = widget.previousResults[i];
      }
    });
  }

  Map<int, List<String>> options = PersonalityTestInfo().partIIOptions;

  updateSelection(int index, val) {
    setState(() {
      results[index] = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    ScreenScaler scaler = ScreenScaler()..init(context);
    setupResults();
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
                    """Which word in each pair appeals 
to you more?"""
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
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(
                left: scaler.getWidth(2),
              ),
              child: Text(
                """Think what the word means, not how they look or how they sound"""
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
                    question:
                        '${widget.previousResults.length + index + 1}. ${options[index][0]} v.s ${options[index][1]}',
                    answers: options[index],
                    index: widget.previousResults.length + index,
                    updateSelection: updateSelection,
                  ),
                );
              },
              itemCount: results.length - widget.previousResults.length,
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
                showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                          backgroundColor: dark,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          title: Text(
                            'Confirm Answers',
                            style: GoogleFonts.lato(
                                fontWeight: FontWeight.bold, color: white),
                          ),
                          content: Text(
                            'Once you have submit your answers cant be change, do you wish to proceed?',
                            style: GoogleFonts.lato(color: white),
                          ),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'Cancel'),
                              child: Text(
                                'Cancel',
                                style: GoogleFonts.lato(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context, 'Submit');
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => PersonalityTestResult(
                                          results: results,
                                        )));
                              },
                              child: Text('Submit',
                                  style: GoogleFonts.lato(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ));
                // Navigator.push(
                //     context, MaterialPageRoute(builder: (context) => Scaffold()));
              },
              text: "Finish",
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
