import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matched_app/main_pages/discover_pages/personality_template.dart';
import 'package:matched_app/main_pages/explore_pages/colleges_pages/colleges_info.dart';
import 'package:matched_app/main_pages/test_pages/personality_test/personality_test_info.dart';
import 'package:matched_app/resources/major_buttom.dart';
import 'package:matched_app/ui_resources/custom_colors.dart';

class AnalystsScreen extends StatelessWidget {
  const AnalystsScreen({Key key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenScaler scaler = ScreenScaler()..init(context);
      return Scaffold(
        backgroundColor: dark,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: scaler.getHeight(3)),
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
                    Container(
                      //height: scaler.getHeight(11),
                      alignment: Alignment.centerLeft,
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: Text(
                          '''Analysts''',
                          style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                  fontSize: 36,
                                  color: white,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //CSE Button
              Padding(
                padding: EdgeInsets.only(
                    top: scaler.getHeight(1),
                    bottom: scaler.getHeight(1),
                    left: scaler.getHeight(1.5),
                    right: scaler.getHeight(1.5)),
                child: MajorButtom(
                  detail: """Architect
(INTJ)"""
                      .trim(),
                  image: PersonalityTestInfo().personalityIconsPath['INTJ'],
                  alignment: Alignment(-.3, 0),
                  color: Color(0xffF5D7E3),
                  screen: PersonalityTemplate(
                    desc: CollegesInfo().shawDesc,
                    imagesList: CollegesInfo().defaultList,
                    title: """Architect (INTJ)""",
                  ),
                ),
              ),
              //EIE Button
              Padding(
                padding: EdgeInsets.only(
                    top: scaler.getHeight(1),
                    bottom: scaler.getHeight(1),
                    left: scaler.getHeight(1.5),
                    right: scaler.getHeight(1.5)),
                child: MajorButtom(
                  detail: """Logician
(INTP)"""
                      .trim(),
                  image: PersonalityTestInfo().personalityIconsPath['INTP'],
                  color: Color(0xffF5D7E3),
                  alignment: Alignment(-.3, 0),
                  screen: PersonalityTemplate(
                    desc: CollegesInfo().shawDesc,
                    imagesList: CollegesInfo().defaultList,
                    title: """Logician (INTP)""",
                  ),
                ),
              ),
              //NES Button
              Padding(
                padding: EdgeInsets.only(
                    top: scaler.getHeight(1),
                    bottom: scaler.getHeight(1),
                    left: scaler.getHeight(1.5),
                    right: scaler.getHeight(1.5)),
                child: MajorButtom(
                  detail: """Commander
(ENTJ)"""
                      .trim(),
                  color: Color(0xffF5D7E3),
                  image: PersonalityTestInfo().personalityIconsPath['ENTJ'],
                  alignment: Alignment(-.3, 0),
                  screen: PersonalityTemplate(
                    desc: CollegesInfo().shawDesc,
                    imagesList: CollegesInfo().defaultList,
                    title: """Commander (ENTJ)""",
                  ),
                ),
              ),
              //Math Button
              Padding(
                padding: EdgeInsets.only(
                    top: scaler.getHeight(1),
                    bottom: scaler.getHeight(1),
                    left: scaler.getHeight(1.5),
                    right: scaler.getHeight(1.5)),
                child: MajorButtom(
                  detail: """Debater
(ENTP)"""
                      .trim(),
                  color: Color(0xffF5D7E3),
                  image: PersonalityTestInfo().personalityIconsPath['ENTP'],
                  alignment: Alignment(-.3, 0),
                  screen: PersonalityTemplate(
                    desc: CollegesInfo().shawDesc,
                    imagesList: CollegesInfo().defaultList,
                    title: """Debater (ENTP)""",
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          height: scaler.getHeight(10),
          decoration: BoxDecoration(gradient: turkish),
        ),
      );
    }

}
