
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matched_app/main_pages/explore_pages/colleges_pages/college_template.dart';
import 'package:matched_app/main_pages/explore_pages/colleges_pages/colleges_info.dart';
import 'package:matched_app/resources/major_buttom.dart';
import 'package:matched_app/ui_resources/custom_colors.dart';

class AnalystsScreen extends StatelessWidget {
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
                    height: scaler.getHeight(11),
                    alignment: Alignment.centerLeft,
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Text(
                        '''Analysts''',
                        style: GoogleFonts.lato(
                            textStyle: TextStyle(
                                fontSize: 30,
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
(INTJ-A / 
INTJ-T)"""
                    .trim(),
                image: "assets/images_sse_majors/CSE.png",
                alignment: Alignment(-.3, 0),
                screen: CollegeTemplate(
                  desc: CollegesInfo().shawDesc,
                  imagesList: CollegesInfo().defaultList,
                  title: """Architect (INTJ-A / INTJ-T)""",
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
(INTP-A / 
INTP-T)"""
                    .trim(),
                image: "assets/images_sse_majors/CSE.png",
                alignment: Alignment(-.3, 0),
                screen: CollegeTemplate(
                  desc: CollegesInfo().shawDesc,
                  imagesList: CollegesInfo().defaultList,
                  title: """Logician (INTP-A / INTP-T)""",
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
(ENTJ-A / 
ENTJ-T)"""
                    .trim(),
                image: "assets/images_sse_majors/CSE.png",
                alignment: Alignment(-.3, 0),
                screen: CollegeTemplate(
                  desc: CollegesInfo().shawDesc,
                  imagesList: CollegesInfo().defaultList,
                  title: """Commander (ENTJ-A / ENTJ-T)""",
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
(ENTP-A / 
ENTP-T)"""
                    .trim(),
                image: "assets/images_sse_majors/CSE.png",
                alignment: Alignment(-.3, 0),
                screen: CollegeTemplate(
                  desc: CollegesInfo().shawDesc,
                  imagesList: CollegesInfo().defaultList,
                  title: """Debater (ENTP-A / ENTP-T)""",
                ),
              ),
            ),

          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: scaler.getHeight(10),
        decoration: BoxDecoration(
            gradient: turkish),
      ),
    );
  }
}
