import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matched_app/main_pages/explore_pages/colleges_pages/colleges_info.dart';
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
                          "Let's begin !!!",
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
                imgList: CollegesInfo().defaultList,
              ),
              //Intro Text
              Padding(
                padding: EdgeInsets.symmetric(horizontal: scaler.getWidth(2),
                vertical: scaler.getWidth(1)),
                child: Padding(
                  padding: EdgeInsets.only(
                      top: scaler.getHeight(1), bottom: scaler.getHeight(1)),
                  child: Text(
                    """Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec gravida at urna eget lacinia. Aliquam suscipit eu dui et bibendum. Maecenas mollis vehicula urna ac vestibulum. Sed vel tincidunt turpis. Nullam auctor magna sit amet nisl congue venenatis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Donec vestibulum nulla ac molestie tempus. Nunc quam turpis, sodales eget turpis dapibus, finibus tincidunt justo. Nulla condimentum eros nec tempus mollis. Nunc sed tristique ante. Nulla eget feugiat nisi.""",
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
