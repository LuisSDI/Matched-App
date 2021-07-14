import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matched_app/bloc/user_bloc.dart';
import 'package:matched_app/main_pages/home_page.dart';
import 'package:matched_app/main_pages/test_pages/personality_test/personality_test_info.dart';
import 'package:matched_app/model/personality_result.dart';
import 'package:matched_app/model/user.dart';
import 'package:matched_app/resources/versus_percent_bar.dart';
import 'package:matched_app/ui_resources/custom_colors.dart';

class RoommateSubmit extends StatelessWidget {
  const RoommateSubmit({
    Key key,
    this.habitsAns,
    this.socialAns,
    this.beliefAns,
    this.communAns,
    this.activitiesAns,
  }) : super(key: key);
  final List<int> habitsAns;

  final List<int> socialAns;

  final List<int> beliefAns;

  final List<int> communAns;

  final List<int> activitiesAns;

  @override
  Widget build(BuildContext context) {
    ScreenScaler scaler = ScreenScaler()..init(context);
    UserBloc userBloc = BlocProvider.of(context);
    return BlocProvider(
      bloc: userBloc,
      child: FutureBuilder(
        future: userBloc.createRoommateTest(userBloc.currentUser.uid, habitsAns,
            socialAns, beliefAns, communAns, activitiesAns),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return FutureBuilder(
                future: userBloc.getReleaseTime(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    DateTime time = snapshot.data;
                    return Scaffold(
                      backgroundColor: dark,
                      bottomNavigationBar: Container(
                        height: scaler.getHeight(10),
                        decoration: BoxDecoration(gradient: turkish),
                      ),
                      body: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  top: scaler.getHeight(3),
                                  bottom: scaler.getHeight(1.5)),
                              child: Stack(
                                children: [
                                  Row(
                                    children: <Widget>[
                                      //Buttom for back
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        child: IconButton(
                                          icon: Icon(
                                            Ionicons.ios_arrow_back,
                                            color: mainColor,
                                            size: 30,
                                          ),
                                          onPressed: () {
                                            Navigator.pushReplacement(
                                                context, MaterialPageRoute(builder: (context) => HomePage(
                                              currentIndex: 3,)));
                                          },
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        child: Text(
                                          'Congrats,',
                                          style: GoogleFonts.lato(
                                              textStyle: TextStyle(
                                                  fontSize: 36,
                                                  color: white,
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: scaler.getWidth(90),
                              height: scaler.getWidth(60),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: scaler.getWidth(60),
                                    alignment: Alignment.center,
                                    child: Stack(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              gradient: turkish),
                                          height: scaler.getWidth(60),
                                          width: scaler.getWidth(60),
                                        ),
                                        Align(
                                          alignment: Alignment.center,
                                          child: Container(
                                              width: scaler.getWidth(37.5),
                                              height: scaler.getWidth(37.5),
                                              child: FittedBox(
                                                fit: BoxFit.fill,
                                                child: Icon(
                                                  FontAwesome.check,
                                                  color: Colors.white,
                                                  size: 10,
                                                ),
                                              )),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                //Title Text
                                Padding(
                                  padding:
                                      EdgeInsets.only(top: scaler.getWidth(2)),
                                  child: Container(
                                    width: scaler.getWidth(80),
                                    alignment: Alignment.center,
                                    child: Text(
                                      'Your roommate application has been successful. Please wait for the other users to complete their application, the results will be released in:',
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.lato(
                                        textStyle: TextStyle(
                                            fontSize: 23,
                                            color: white,
                                            fontWeight: FontWeight.normal),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            CountdownTimer(
                              endTime:
                                  time.millisecondsSinceEpoch,
                              widgetBuilder: (_, CurrentRemainingTime time) {
                                if (time == null) {
                                  return Text(
                                      'Results are out, check your chats.');
                                }
                                int days = time.days ?? 0;
                                int hours = time.hours ?? 0;
                                int minutes = time.min ?? 0;
                                int sec = time.sec ?? 0;
                                return Text(
                                  '$days ${(days == 1) ? 'day' : 'days'}, $hours ${(hours == 1) ? 'hour' : 'hours'}, $minutes min, $sec sec',
                                  style: GoogleFonts.lato(
                                      color: Colors.white, fontSize: 23),
                                );
                              },
                            )
                          ],
                        ),
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
                });
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
