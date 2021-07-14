import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matched_app/MatchingQuizz/matchingScreen.dart';
import 'package:matched_app/bloc/user_bloc.dart';
import 'package:matched_app/main_pages/test_pages/people_match_test/home_match_screen.dart';
import 'package:matched_app/main_pages/test_pages/personality_test/personality_test_intro.dart';
import 'package:matched_app/main_pages/test_pages/personality_test/personality_test_result_fixed.dart';
import 'package:matched_app/main_pages/test_pages/roommate_test/roommate_submit_fixed.dart';
import 'package:matched_app/main_pages/test_pages/roommate_test/roommate_test_intro.dart';

import 'package:matched_app/model/user.dart';
import 'package:matched_app/resources/major_buttom.dart';
import 'package:matched_app/resources/test_buttom.dart';
import 'package:matched_app/ui_resources/custom_colors.dart';

class TestTab extends StatelessWidget {
  TestTab({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserBloc userBloc = BlocProvider.of(context);
    User currentUser = userBloc.currentUser;
    ScreenScaler scaler = ScreenScaler()..init(context);
    return BlocProvider(
      bloc: userBloc,
      child: FutureBuilder(
        future: userBloc.getUserData(userBloc.currentUser.uid),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            UserModel userModel = snapshot.data;
            return SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                        top: scaler.getWidth(7), left: scaler.getHeight(1.5)),
                    child: Container(
                      height: scaler.getHeight(5),
                      alignment: Alignment.centerLeft,
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: Text(
                          "Tests",
                          style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                  fontSize: 36,
                                  color: white,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ),
                  ),
                  //Personality Button
                  Padding(
                    padding: EdgeInsets.only(
                        top: scaler.getHeight(1),
                        bottom: scaler.getHeight(1),
                        left: scaler.getHeight(1.5),
                        right: scaler.getHeight(1.5)),
                    child: TestButtom(
                      detail: '''Personality \nTest'''.trim(),
                      image: "assets/images/personalities/test/personality_test_4.jpg",
                      alignment: Alignment(-.3, 0),
                      screen: (userModel.personality == 'None')
                          ? PersonalityTestIntro()
                          : PersonalityTestResultFixed(),
                    ),
                  ),
                  //Roommate Button
                  Padding(
                    padding: EdgeInsets.only(
                        top: scaler.getHeight(1),
                        bottom: scaler.getHeight(1),
                        left: scaler.getHeight(1.5),
                        right: scaler.getHeight(1.5)),
                    child: Stack(
                      children: [
                        TestButtom(
                          detail: '''Roommate \nMatching'''.trim(),
                          image: "assets/images/roommates.jpg",
                          onTap: () async {
                            if (userModel.personality == 'None') {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: mainColor,
                                  duration: Duration(seconds: 3),
                                  content: Container(
                                      height: scaler.getHeight(5),
                                      child: Center(
                                          child: Text(
                                        'Complete the Personality Test to unlock it',
                                        style: GoogleFonts.lato(fontSize: 18),
                                      ))),
                                ),
                              );
                            } else {
                               userBloc.getRoommateSubmit(userBloc.currentUser.uid).then((value) {
                                 if (value != null) {
                                    userBloc.getReleaseTime().then((value2) {
                                      if (value2 != null) {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => (value != null ) ? RoommateSubmitFixed(
                                                  releaseTime: value2,
                                                ) :RoommateTestIntro()));
                                      }
                                      else{
                                        print('Error: time could not be retrieve');
                                      }
                                    });
                                 }
                                 else
                                   {
                                   print('Error: uid could not be retrieve or does not exist');
                                   Navigator.push(
                                       context,
                                       MaterialPageRoute(
                                           builder: (context) => RoommateTestIntro()));
                                 }
                               });
                            }
                          },
                        ),
                        Visibility(
                          visible: (userModel.personality == 'None'),
                          child: GestureDetector(
                            onTap: () {
                              if (userModel.personality == 'None') {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    backgroundColor: deepBlue,
                                    duration: Duration(seconds: 3),
                                    content: Container(
                                        height: scaler.getHeight(5),
                                        child: Center(
                                            child: Text(
                                          'Complete the Personality Test to unlock it',
                                          style: GoogleFonts.lato(fontSize: 18),
                                        ))),
                                  ),
                                );
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: blackOp,
                              ),
                              height: scaler.getHeight(18),
                              child: Center(
                                child: Container(
                                  width: scaler.getHeight(8),
                                  child: FittedBox(
                                    fit: BoxFit.cover,
                                    child: Icon(
                                      FontAwesome.lock,
                                      color: white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //Do We Button
                  Padding(
                    padding: EdgeInsets.only(
                        top: scaler.getHeight(1),
                        bottom: scaler.getHeight(1),
                        left: scaler.getHeight(1.5),
                        right: scaler.getHeight(1.5)),
                    child: Stack(
                      children: [
                        TestButtom(
                          detail: '''"Do we \nMatch?"'''.trim(),
                          image: "assets/images/friendship.jpg",
                          alignment: Alignment(.8, 0),
                          onTap: () {
                            if (userModel.personality == 'None') {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: deepBlue,
                                  duration: Duration(seconds: 3),
                                  content: Container(
                                      height: scaler.getHeight(5),
                                      child: Center(
                                          child: Text(
                                        'Complete the Personality Test to unlock it',
                                        style: GoogleFonts.lato(fontSize: 18),
                                      ))),
                                ),
                              );
                            } else {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomeMatchScreen(
                                            identifier: currentUser.email,
                                            title: "Do we match?",
                                          )));
                            }
                          },
                        ),
                        Visibility(
                          visible: (userModel.personality == 'None'),
                          child: GestureDetector(
                            onTap: () {
                              if (userModel.personality == 'None') {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    backgroundColor: deepBlue,
                                    duration: Duration(seconds: 3),
                                    content: Container(
                                        height: scaler.getHeight(5),
                                        child: Center(
                                            child: Text(
                                          'Complete the Personality Test to unlock it',
                                          style: GoogleFonts.lato(fontSize: 18),
                                        ))),
                                  ),
                                );
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: blackOp,
                              ),
                              height: scaler.getHeight(19),
                              child: Center(
                                child: Container(
                                  width: scaler.getHeight(8),
                                  child: FittedBox(
                                    fit: BoxFit.cover,
                                    child: Icon(
                                      FontAwesome.lock,
                                      color: white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Scaffold(
              backgroundColor: dark,
              body: Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(mainColor),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
