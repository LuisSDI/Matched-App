
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matched_app/main_pages/explore_pages/colleges_pages/college_template.dart';
import 'package:matched_app/main_pages/explore_pages/service_pages/service_info.dart';
import 'package:matched_app/resources/image_slider.dart';
import 'package:matched_app/resources/screen_buttom.dart';
import 'package:matched_app/ui_resources/custom_colors.dart';

class ServiceScreen extends StatelessWidget {
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
                        "Facilities",
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
              imgList: ServiceInfo().serviceList,
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
                        detail: '''Career Service Center'''
                            .trim(),
                        iconData: MaterialCommunityIcons.library,
                        screen: CollegeTemplate(
                          desc: ServiceInfo().cscDesc,
                          title: '''Career Service Center''',
                          imagesList: ServiceInfo().cscList,
                        ),
                      ),
                      ScreenButtom(
                        detail: '''SALL 
Center'''.trim(),
                        iconData: FontAwesome.soccer_ball_o,
                        screen: CollegeTemplate(
                          title: '''SALL Center''',
                          desc: ServiceInfo().sallDesc,
                          imagesList: ServiceInfo().sallList,
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
                        detail: '''CIDE'''.trim(),
                        iconData: Icons.store,
                        screen: CollegeTemplate(
                          title: 'CIDE',
                          desc: ServiceInfo().cideDesc,
                          imagesList: ServiceInfo().cideList,
                        ),
                      ),
                      ScreenButtom(
                        detail: 'Health Center',
                        iconData: Icons.healing,
                        screen: CollegeTemplate(
                          title: 'Health Template',
                          desc: ServiceInfo().healthDesc,
                          imagesList: ServiceInfo().healthList,
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
