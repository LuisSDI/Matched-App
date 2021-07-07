import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matched_app/main_pages/discover_pages/paragraph.dart';
import 'package:matched_app/resources/image_slider.dart';
import 'package:matched_app/ui_resources/custom_colors.dart';

class PersonalityTemplate extends StatelessWidget {
  @override
  final List<String> imagesList;
  final String desc;
  final String title;

  PersonalityTemplate({Key key, this.imagesList, this.desc, this.title})
      : super(key: key);

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
                        title,
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
              imgList: imagesList,
            ),
            //Intro Text //add paragraph from here
            Padding(
              padding: EdgeInsets.symmetric(horizontal: scaler.getWidth(2)),
              child: Padding(
                padding: EdgeInsets.only(
                    top: scaler.getHeight(1), bottom: scaler.getHeight(1)),
                child: Container(
                  //height: scaler.getHeight(43),
                  alignment: Alignment.topLeft,
                  // child: Text(
                  //   desc,
                  //   textAlign: TextAlign.left,
                  //   style: GoogleFonts.lato(
                  //       textStyle: TextStyle(
                  //           fontSize: 15, color: whiteish, height: 1)),
                  // ),
                  child: Paragraph(
                      title: "title 1",
                      text:
                          " blabalb b lab lbal aih lah al jalijdhli laj iy laou laih laih liah laiyh diyh ih if lofj ifh f ;fo uoj loo fjo jf; o;f ofj foj ofj ofj of ofj ;fp j;fpj ihutv6ruwhpwfpf o. fory"),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: scaler.getWidth(2)),
              child: Padding(
                padding: EdgeInsets.only(
                    top: scaler.getHeight(1), bottom: scaler.getHeight(1)),
                child: Container(
                  //height: scaler.getHeight(43),
                  alignment: Alignment.topLeft,
                  // child: Text(
                  //   desc,
                  //   textAlign: TextAlign.left,
                  //   style: GoogleFonts.lato(
                  //       textStyle: TextStyle(
                  //           fontSize: 15, color: whiteish, height: 1)),
                  // ),
                  child: Paragraph(
                      title: "title 2",
                      text:
                          " motherfucker blabalb b lab lbal aih lah al jalijdhli laj iy laou laih laih liah laiyh diyh ih if lofj ifh f ;fo uoj loo fjo jf; o;f ofj foj ofj ofj of ofj ;fp j;fpj ihutv6ruwhpwfpf o. fory"),
                ),
              ),
            ),
            SizedBox()
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
