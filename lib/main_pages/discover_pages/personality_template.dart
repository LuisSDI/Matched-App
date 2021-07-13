import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matched_app/main_pages/discover_pages/paragraph.dart';
import 'package:matched_app/resources/image_slider.dart';
import 'package:matched_app/ui_resources/custom_colors.dart';
import 'package:url_launcher/url_launcher.dart';

class PersonalityTemplate extends StatelessWidget {
  @override
  final List<String> imagesList;
  final String desc;
  final String title;
  final String link;
  List<List<String>> subtitles;

  PersonalityTemplate(
      {Key key,
      this.imagesList,
      this.desc,
      this.title,
      this.link,
      this.subtitles = const [
        ["", ""]
      ]})
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
            SizedBox(height: scaler.getWidth(1),),
            for (var i = 0; i < subtitles.length; i++)
              Padding(
                padding: EdgeInsets.only(
                    //top: scaler.getHeight(1),
                    bottom: scaler.getHeight(1),
                right: scaler.getWidth(2),
                left: scaler.getWidth(2)),
                child: Container(
                  //height: scaler.getHeight(43),
                  alignment: Alignment.topLeft,

                  child:
                      Paragraph(title: subtitles[i][0], text: subtitles[i][1]),
                ),
              ),
            
            Container(
                padding: EdgeInsets.only(bottom: scaler.getWidth(2)),
                //height: scaler.getHeight(5),
                //margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                          style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                  fontSize: 16,
                                  color: white,
                                  fontWeight: FontWeight.bold)),
                          text: "To learn more "),
                      TextSpan(
                          style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                  fontSize: 16,
                                  color: blueGradient,
                                  fontWeight: FontWeight.bold)),
                          text: "Click here",
                          recognizer: TapGestureRecognizer()
                            ..onTap = () async {
                              var url = link;
                              if (await canLaunch(url)) {
                                await launch(url);
                              } else {
                                throw 'Could not launch $url';
                              }
                            }),
                    ],
                  ),
                )),

            //Intro Text //add paragraph from here
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
