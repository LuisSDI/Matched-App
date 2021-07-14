import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matched_app/main_pages/test_pages/roommate_test/habits_test.dart';
import 'package:matched_app/resources/image_slider.dart';
import 'package:matched_app/resources/simple_buttom.dart';
import 'package:matched_app/ui_resources/custom_colors.dart';

class RoommateTestIntro extends StatelessWidget {
  const RoommateTestIntro({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenScaler scaler = ScreenScaler()..init(context);
    return Scaffold(
        backgroundColor: dark,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                    top: scaler.getHeight(3), bottom: scaler.getHeight(1.5)),
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
                      width: scaler.getWidth(80),
                      alignment: Alignment.centerLeft,
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: Text(
                          "Roommate Test",
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
                imgList: ['assets/images/roommates_test/roommate_1.jpg',
                'assets/images/roommates_test/roommate_2.jpg',
                'assets/images/roommates_test/roommate_3.jpg',
                'assets/images/roommates_test/roommate_4.jpg'],
              ),
              //Intro Text
              Padding(
                padding: EdgeInsets.symmetric(horizontal: scaler.getWidth(2),
                vertical: scaler.getWidth(1)),
                child: Padding(
                  padding: EdgeInsets.only(
                      top: scaler.getHeight(1), bottom: scaler.getHeight(1)),
                  child: Text(
                    """Roommate selection at CUHK SZ is a deliberate and holistic process. It is important to us that your campus experience is as smooth as possible. The answers you provide in this questionnaire will help us find the ideal roommate for your personality and lifestyle using our matching algorithm. Please note that while the university does its absolute best to pair compatible roommates, completing this form does NOT guarantee a perfect roommate pairing.""",
                    textAlign: TextAlign.left,
                    style: GoogleFonts.lato(
                        textStyle: TextStyle(
                            fontSize: 15, color: whiteish, height: 1)),
                  ),
                ),
              ),
              SizedBox(
                height: scaler.getHeight(0),
              ),
              SimpleButton(
                screen: HabitsTest(),
              text: "Start",)
            ],
          ),
        ),
        bottomNavigationBar: Container(
          height: scaler.getHeight(10),
          decoration: BoxDecoration(gradient: turkish),
        ));
  }
}
