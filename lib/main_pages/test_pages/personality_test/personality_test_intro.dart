import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matched_app/main_pages/test_pages/personality_test/personality_test_part1.dart';
import 'package:matched_app/resources/image_slider.dart';
import 'package:matched_app/resources/simple_buttom.dart';
import 'package:matched_app/ui_resources/custom_colors.dart';

class PersonalityTestIntro extends StatelessWidget {
  const PersonalityTestIntro({Key key}) : super(key: key);

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
                          "Personality Test",
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
                imgList: ['assets/images/personalities/test/personality_test_1.jpg',
                  'assets/images/personalities/test/personality_test_2.jpg',
                  'assets/images/personalities/test/personality_test_3.png',
                  'assets/images/personalities/test/personality_test_4.jpg'],
              ),
              //Intro Text
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: scaler.getWidth(2),
                    vertical: scaler.getWidth(1)),
                child: Padding(
                  padding: EdgeInsets.only(
                      top: scaler.getHeight(1), bottom: scaler.getHeight(1)),
                  child: Text(
                    """There are no “right“ or “wrong” answers to the questions on this personality test. Your answers will help to show how you like to look at things and how you like to go about deciding things. Knowing your own preferences and learning about other people’s can help you understand whether your special strenghts are, what kind of work you might enjoy and be successful doing, and how people with different preferences can relate to each other and be valuable to society.
Read each question carefully and select one of the two choices given, which applies to you,""",
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
                screen: PersonalityTestPart1(),
                text: "Start",
              )
            ],
          ),
        ),
        bottomNavigationBar: Container(
          height: scaler.getHeight(10),
          decoration: BoxDecoration(gradient: turkish),
        ));
  }
}
