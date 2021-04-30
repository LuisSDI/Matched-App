import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matched_app/resources/main_page_buttom.dart';
import 'package:matched_app/ui_resources/custom_colors.dart';
import 'package:matched_app/ui_resources/icons/fix_icons_icons.dart';


class DiscoverTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenScaler scaler = ScreenScaler()..init(context);
    return SafeArea(
      top: false,

      child: Container(
        child: Padding(
          padding: EdgeInsets.only(
              left: scaler.getWidth(7), right: scaler.getWidth(7)),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                //Discover Text
                Padding(
                  padding: EdgeInsets.only(top: scaler.getWidth(7)),
                  child: Container(
                    height: scaler.getHeight(5),
                    alignment: Alignment.centerLeft,
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Text(
                        "Personalty",
                        style: GoogleFonts.lato(
                            textStyle: TextStyle(
                                fontSize: 36,
                                color: white,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                ),
                //Subtitle Text
                Container(
                  height: scaler.getHeight(3),
                  alignment: Alignment.centerLeft,
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Text(
                      "Who you are?",
                      style: GoogleFonts.lato(
                          textStyle: TextStyle(
                        fontSize: 23,
                        color: whiteish,
                      )),
                    ),
                  ),
                ),
                Column(
                  children: <Widget>[
                    //Foundation Courses
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: scaler.getHeight(2.5)),
                      child: GestureDetector(
                        onTap: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => FoundationScreen()));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              gradient: turkish,
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0x80000000),
                                  blurRadius: 4.0, // soften the shadow
                                  spreadRadius: 0, //extend the shadow
                                  offset: Offset(
                                    0, // Move to right 10  horizontally
                                    6, // Move to bottom 10 Vertically
                                  ),
                                )
                              ]),
                          child: Container(
                            padding: EdgeInsets.all(scaler.getHeight(1)),
                            alignment: Alignment.center,
                            child: Text(
                              'How does the test work?',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.lato(
                                  textStyle: TextStyle(
                                //height: .5,
                                fontSize: 23,
                                color: white,
                                    fontWeight: FontWeight.bold
                              )),
                            ),
                          ),
                        ),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.only(
                          top: scaler.getHeight(1),
                          bottom: scaler.getHeight(1)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          //SSE Button
                          MainPageButton(
                            iconData: FixIcons.analyst,
                            text: "Analysts",
                          ),
                          //SME Button
                          MainPageButton(text: "Diplomats",
                          iconData: FixIcons.diplomats,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: scaler.getHeight(1),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: scaler.getHeight(1),
                          bottom: scaler.getHeight(1)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          //HSS Button
                          MainPageButton(
                            iconData: FixIcons.sentinel,
                            text: "Sentinels",
                          ),
                          //LHS Button
                          MainPageButton(
                            iconData: FixIcons.explorer,
                            text: 'Explorers',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
