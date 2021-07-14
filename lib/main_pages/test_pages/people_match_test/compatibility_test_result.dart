import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matched_app/bloc/user_bloc.dart';
import 'package:matched_app/main_pages/test_pages/people_match_test/compatibility_test_info.dart';
import 'package:matched_app/main_pages/test_pages/personality_test/personality_test_info.dart';
import 'package:matched_app/model/compatibility_result.dart';
import 'package:matched_app/model/personality_result.dart';
import 'package:matched_app/model/user.dart';
import 'package:matched_app/resources/versus_percent_bar.dart';
import 'package:matched_app/ui_resources/custom_colors.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CompatibilityTestResult extends StatelessWidget {
  const CompatibilityTestResult({
    Key key,
    this.testUid,
  }) : super(key: key);

  final String testUid;

  @override
  Widget build(BuildContext context) {
    ScreenScaler scaler = ScreenScaler()..init(context);
    UserBloc userBloc = BlocProvider.of(context);
    return BlocProvider(
      bloc: userBloc,
      child: FutureBuilder(
        future:
            userBloc.getCompatibilityResult(userBloc.currentUser.uid, testUid),
        builder: (context, AsyncSnapshot<CompatibilityResult> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            PersonalityResult myPersonalityResult =
                snapshot.data.myPersonalityResult;
            int range = snapshot.data.finalScore~/ 20;
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
                          bottom: scaler.getWidth(1)),
                      child: Row(
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
                                Navigator.of(context).pop();
                              },
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: Text(
                              'Compatibility Results',
                              style: GoogleFonts.lato(
                                  textStyle: TextStyle(
                                      fontSize: 36,
                                      color: white,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(bottom: scaler.getWidth(1)),
                      child: Text(
                        "You are ...",
                        style: GoogleFonts.lato(
                            textStyle: TextStyle(
                                fontSize: 30,
                                color: white,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: scaler.getWidth(5),
                          right: scaler.getWidth(5),
                      bottom: scaler.getWidth(1)),
                      height: scaler.getWidth(35),
                      decoration: BoxDecoration(
                        color: cianGradient,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: scaler.getWidth(35),
                            alignment: Alignment.center,
                            child: Stack(
                              children: [
                                // Align(
                                //   alignment: Alignment.center,
                                //   child: Container(
                                //     decoration: BoxDecoration(
                                //         shape: BoxShape.circle,
                                //         color: CompatibilityTestInfo().compatibilityColors[range]),
                                //     height: scaler.getWidth(30),
                                //     width: scaler.getWidth(30),
                                //   ),
                                // ),
                                Align(
                                  alignment: Alignment.center,
                                  child: CircularPercentIndicator(
                                    radius: scaler.getWidth(27),
                                    lineWidth: scaler.getWidth(3),
                                    percent: snapshot.data.finalScore/100,
                                    center:  Text(
                                      '${snapshot.data.finalScore.toStringAsFixed(1)} %',
                                      style: GoogleFonts.lato(
                                          textStyle: TextStyle(
                                              fontSize: 20,
                                              color: white,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                    circularStrokeCap: CircularStrokeCap.round,
                                    progressColor: CompatibilityTestInfo().compatibilityColors[range])
                                  ),
                              ],
                            ),
                          ),
                          Expanded(
                              child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  child: Text(
                                    '${CompatibilityTestInfo().compatibilityCategory[range]}',
                                    style: GoogleFonts.lato(
                                        textStyle: TextStyle(
                                            fontSize: 22,
                                            color: white,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: scaler.getWidth(
                                        scaler.getWidth(.125),
                                      ),
                                      vertical: scaler.getWidth(1)),
                                  child: Text(
                                    '${CompatibilityTestInfo().compatibilityDesc[range]}',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.lato(
                                        textStyle: TextStyle(
                                            fontSize: 16,
                                            color: white,
                                            fontStyle: FontStyle.italic,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ),
                              ],
                            ),
                          ))
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(bottom: scaler.getWidth(1)),
                      child: Text(
                        "${snapshot.data.myName.split(' ').first}'s Personality",
                        style: GoogleFonts.lato(
                            textStyle: TextStyle(
                                fontSize: 30,
                                color: white,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                    personalityShow(scaler, myPersonalityResult),
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(bottom: scaler.getWidth(1)),
                      child: Text(
                        "${snapshot.data.yourName.split(' ').first}'s Personality",
                        style: GoogleFonts.lato(
                            textStyle: TextStyle(
                                fontSize: 30,
                                color: white,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                    personalityShow(scaler, snapshot.data.yourPersonalityResult)
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
          return Scaffold(
            backgroundColor: dark,
            body: Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(mainColor),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget personalityShow(
      ScreenScaler scaler, PersonalityResult personalityResult) {
    Map<String, String> personalityIntro =
        PersonalityTestInfo().personalityIntro;
    Map<String, String> personalityName = PersonalityTestInfo().personalityName;
    Map<String, String> personalityRoles =
        PersonalityTestInfo().personalityRoles;
    Map<String, String> personalityDesc = PersonalityTestInfo().personalityDesc;
    Map<String, String> personalityIconsPath =
        PersonalityTestInfo().personalityIconsPath;
    List<List<String>> pairValues = PersonalityTestInfo().pairValues;
    List<List<int>> pairScores = [
      [personalityResult.iScore, personalityResult.eScore],
      [personalityResult.sScore, personalityResult.nScore],
      [personalityResult.tScore, personalityResult.fScore],
      [personalityResult.jScore, personalityResult.pScore]
    ];
    return Padding(
      padding: EdgeInsets.only(
          left: scaler.getWidth(5),
          right: scaler.getWidth(5),
          bottom: scaler.getWidth(4)),
      child: Container(
        decoration: BoxDecoration(
            color: deepBlue,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: scaler.getWidth(2)),
              child: Container(
                width: scaler.getWidth(80),
                height: scaler.getWidth(35),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: scaler.getWidth(1)),
                      child: Container(
                        width: scaler.getWidth(35),
                        alignment: Alignment.center,
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle, color: cianGradient),
                              height: scaler.getWidth(35),
                              width: scaler.getWidth(35),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Container(
                                width: scaler.getWidth(24),
                                height: scaler.getWidth(24),
                                child: Image(
                                  image: AssetImage(personalityIconsPath[
                                      personalityResult.personality]),
                                  fit: BoxFit.contain,
                                  //width: scaler.getWidth(110),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                        child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Text(
                              '${personalityName[personalityResult.personality]}',
                              style: GoogleFonts.lato(
                                  textStyle: TextStyle(
                                      fontSize: 30,
                                      color: white,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                          Container(
                            child: RichText(
                                text: TextSpan(
                              text: 'Role: ',
                              style: GoogleFonts.lato(
                                  textStyle: TextStyle(
                                      fontSize: 14,
                                      color: white,
                                      fontWeight: FontWeight.normal)),
                              children: [
                                TextSpan(
                                  text:
                                      '${personalityRoles[personalityResult.personality]}',
                                  style: GoogleFonts.lato(
                                      textStyle: TextStyle(
                                          fontSize: 16,
                                          color: white,
                                          fontWeight: FontWeight.bold)),
                                )
                              ],
                            )),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: scaler.getWidth(
                                  scaler.getWidth(.125),
                                ),
                                vertical: scaler.getWidth(1)),
                            child: Text(
                              '"${personalityIntro[personalityResult.personality]}"',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.lato(
                                  textStyle: TextStyle(
                                      fontSize: 14,
                                      color: white,
                                      fontStyle: FontStyle.italic,
                                      fontWeight: FontWeight.normal)),
                            ),
                          ),
                        ],
                      ),
                    ))
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //Title Text
                Container(
                  height: scaler.getHeight(4),
                  width: scaler.getWidth(80),
                  alignment: Alignment.center,
                  child: Text(
                    'Overview',
                    style: GoogleFonts.lato(
                        textStyle: TextStyle(
                            fontSize: 30,
                            color: white,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: scaler.getWidth(1), horizontal: scaler.getWidth(2)),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  personalityDesc[personalityResult.personality],
                  style: GoogleFonts.lato(
                      textStyle: TextStyle(
                          fontSize: 14,
                          color: white,
                          fontWeight: FontWeight.bold)),
                ),
              ),
            ),
            ListView.builder(
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(scaler.getHeight(1)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                          child: VersusPercentBar(
                        names: pairValues[index],
                        scores: pairScores[index],
                        width: 68,
                      )),
                    ],
                  ),
                );
              },
              itemCount: pairValues.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
            ),
          ],
        ),
      ),
    );
  }
}
