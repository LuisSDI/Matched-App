import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matched_app/MatchingQuizz/matchingScreen.dart';
import 'package:matched_app/bloc/user_bloc.dart';
import 'package:matched_app/main_pages/explore_pages/colleges_pages/college_template.dart';
import 'package:matched_app/resources/major_buttom.dart';
import 'package:matched_app/resources/major_screen.dart';
import 'package:matched_app/resources/placeholder_page.dart';
import 'package:matched_app/ui_resources/custom_colors.dart';
import 'package:matched_app/PersonalityTest/pages/personalityQuizzPage.dart';
import 'package:matched_app/RoommateMatching/pages/roommateQuizzPage.dart';

class TestTab extends StatelessWidget {
  TestTab({Key key, this.identifier}) : super(key: key);
  String identifier;

  @override
  Widget build(BuildContext context) {
    UserBloc userBloc = BlocProvider.of(context);
    User currentUser = userBloc.currentUser;
    ScreenScaler scaler = ScreenScaler()..init(context);
    return BlocProvider(
      bloc: UserBloc(),
      child: SingleChildScrollView(
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
                    "Test",
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
              child: MajorButtom(
                detail: '''Personality \nTest'''.trim(),
                image: "assets/images/disc/Disc2.jpg",
                alignment: Alignment(-.3, 0),
                screen: PersonnalityQuizzPage(
                    uid: currentUser.uid, identifier: currentUser.email),
              ),
            ),
            //Roommate Button
            Padding(
              padding: EdgeInsets.only(
                  top: scaler.getHeight(1),
                  bottom: scaler.getHeight(1),
                  left: scaler.getHeight(1.5),
                  right: scaler.getHeight(1.5)),
              child: MajorButtom(
                detail: '''Roommate \nMatching'''.trim(),
                image: "assets/images/disc/roommate.jpg",
                screen: RoommateQuizzPage(
                    uid: currentUser.uid, identifier: currentUser.email),
              ),
            ),
            //Do We Button
            Padding(
              padding: EdgeInsets.only(
                  top: scaler.getHeight(1),
                  bottom: scaler.getHeight(1),
                  left: scaler.getHeight(1.5),
                  right: scaler.getHeight(1.5)),
              child: MajorButtom(
                detail: '''"Do we \nMatch?"'''.trim(),
                image: "assets/images/disc/doWeMatch.jpg",
                alignment: Alignment(.8, 0),
                screen: MatchingScreen(
                  identifier: currentUser.email,
                  title: "Do we match?",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
