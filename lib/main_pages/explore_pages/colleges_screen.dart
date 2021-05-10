import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matched_app/main_pages/explore_pages/colleges_pages/college_template.dart';
import 'package:matched_app/main_pages/explore_pages/colleges_pages/colleges_info.dart';
import 'package:matched_app/resources/image_slider.dart';
import 'package:matched_app/resources/placeholder_page.dart';
import 'package:matched_app/resources/screen_buttom.dart';
import 'package:matched_app/ui_resources/custom_colors.dart';
import 'package:matched_app/ui_resources/icons/fix_icons_icons.dart';

class CollegeScreen extends StatelessWidget {
  const CollegeScreen({Key key}) : super(key: key);

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
                    height: scaler.getHeight(5),
                    alignment: Alignment.centerLeft,
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Text(
                        "Colleges",
                        style: GoogleFonts.lato(
                            textStyle: TextStyle(
                                fontSize: 34,
                                color: white,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //Image Carousel
            ImageSlider(
              imgList: CollegesInfo().collegesList,
            ),
            Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                      top: scaler.getHeight(1), bottom: scaler.getHeight(1)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      ScreenButtom(
                        detail: '''Shaw'''
                            .trim(),
                        iconData: FixIcons.shaw,
                        screen: CollegeTemplate(
                          desc: CollegesInfo().shawDesc,
                          title: 'Shaw',
                          imagesList: CollegesInfo().shawList,
                        ),
                      ),
                      ScreenButtom(
                        detail: '''Diligentia'''.trim(),
                        iconData: FixIcons.diligentia,
                        screen: CollegeTemplate(
                          desc: CollegesInfo().diligentiaDesc,
                          title: 'Diligentia',
                          imagesList: CollegesInfo().diligentiaList,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: scaler.getHeight(1), bottom: scaler.getHeight(1)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      ScreenButtom(
                        detail: '''Harmonia'''.trim(),
                        iconData: FixIcons.shaw,
                        screen: CollegeTemplate(
                          desc: CollegesInfo().harmoniaDesc,
                          title: 'Harmonia',
                          imagesList: CollegesInfo().harmoniaList,
                        ),
                      ),
                      ScreenButtom(
                        detail: 'Muse',
                        iconData: FixIcons.shaw,
                        screen: CollegeTemplate(
                          desc: CollegesInfo().museDesc,
                          title: 'Muse',
                          imagesList: CollegesInfo().museList,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              height: scaler.getHeight(10),
              decoration: BoxDecoration(
                  gradient:turkish),
            ),
          ],
        ),
      ),
    );
  }
}
