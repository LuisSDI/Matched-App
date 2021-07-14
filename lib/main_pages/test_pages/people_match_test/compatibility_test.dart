import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matched_app/bloc/user_bloc.dart';
import 'package:matched_app/main_pages/test_pages/people_match_test/compatibility_test_info.dart';
import 'package:matched_app/main_pages/test_pages/personality_test/personality_test_info.dart';
import 'package:matched_app/main_pages/test_pages/personality_test/personality_test_result.dart';
import 'package:matched_app/main_pages/test_pages/roommate_test/roommate_test_info.dart';
import 'package:matched_app/resources/async_loader.dart';
import 'package:matched_app/resources/simple_buttom.dart';
import 'package:matched_app/resources/slider_choice_question.dart';
import 'package:matched_app/ui_resources/custom_colors.dart';

class CompatibilityTest extends StatefulWidget {
  const CompatibilityTest({Key key, this.myUid, this.yourUid, }) : super(key: key);

  final String myUid;
  final String yourUid;

  @override
  _CompatibilityTestState createState() => _CompatibilityTestState();
}

class _CompatibilityTestState extends State<CompatibilityTest> {
  String test;

  List<int> results = List<int>.filled(36, 2);

  List<String> questions = CompatibilityTestInfo().questions;
  List<String> answers = CompatibilityTestInfo().options;

  updateSelection(int index, val) {
    setState(() {
      results[index] = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    ScreenScaler scaler = ScreenScaler()..init(context);
    UserBloc userBloc = BlocProvider.of(context);
    return BlocProvider(
      bloc: userBloc,
      child: Scaffold(
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
                      """Compatibility Test"""
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
                      question:
                          questions[index],
                      answers: answers,
                      initVal: 2,
                      index: index,
                      updateSelection: updateSelection,
                    ),
                  );
                },
                itemCount: results.length,
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
                                onPressed: () async {
                                  await userBloc.createPeopleMatchTest(widget.myUid, widget.yourUid, results);
                                  userBloc.dispose();
                                  Navigator.pop(context, 'Submit');
                                  Navigator.pop(context);
                                },
                                child: Text('Submit',
                                    style: GoogleFonts.lato(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ],
                          ));
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
      ),
    );
  }
}
