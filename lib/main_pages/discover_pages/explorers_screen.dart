import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matched_app/main_pages/discover_pages/personality_template.dart';
import 'package:matched_app/main_pages/explore_pages/colleges_pages/colleges_info.dart';
import 'package:matched_app/main_pages/test_pages/personality_test/personality_test_info.dart';
import 'package:matched_app/resources/major_buttom.dart';
import 'package:matched_app/ui_resources/custom_colors.dart';

class ExplorersScreen extends StatelessWidget {
  const ExplorersScreen({Key key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenScaler scaler = ScreenScaler()..init(context);
    Color color = Color(0xfff7e7cb);
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
                      alignment: Alignment.centerLeft,
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: Text(
                          '''Explorers''',
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
                  detail: """Virtuoso
(ISTP)"""
                      .trim(),
                  image: PersonalityTestInfo().personalityIconsPath['ISTP'],
                  alignment: Alignment(-.3, 0),
                  color: color,
                  screen: PersonalityTemplate(
                    desc: CollegesInfo().shawDesc,
                    imagesList: CollegesInfo().defaultList,
                    title: """Virtuoso (ISTP)""",
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
                  detail: """Adventurer
(ISFP)"""
                      .trim(),
                  image: PersonalityTestInfo().personalityIconsPath['ISFP'],
                  color: color,
                  alignment: Alignment(-.3, 0),
                  screen: PersonalityTemplate(
                    desc: CollegesInfo().shawDesc,
                    imagesList: CollegesInfo().defaultList,
                    title: """Adventurer (ISFP)""",
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
                  detail: """Entrepreneur
(ESTP)"""
                      .trim(),
                  color: color,
                  image: PersonalityTestInfo().personalityIconsPath['ESTP'],
                  alignment: Alignment(-.3, 0),
                  screen: PersonalityTemplate(
                    desc: CollegesInfo().shawDesc,
                    imagesList: CollegesInfo().defaultList,
                    title: """Entrepreneur (ESTP)""",
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
                  detail: """Entertainer\n(ESFP)"""
                      .trim(),
                  color: color,
                  image: PersonalityTestInfo().personalityIconsPath['ESFP'],
                  alignment: Alignment(-.3, 0),
                  screen: PersonalityTemplate(
                    desc: CollegesInfo().shawDesc,
                    imagesList: CollegesInfo().defaultList,
                    title: """Entertainer (ESFP)""",
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