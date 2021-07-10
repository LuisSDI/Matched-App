import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matched_app/ui_resources/custom_colors.dart';

class Paragraph extends StatelessWidget {
  const Paragraph({Key key, @required this.title, @required this.text})
      : super(key: key);
  final String title, text;

  @override
  Widget build(BuildContext context) {
    ScreenScaler screenScaler = ScreenScaler()..init(context);
    return Container(
      alignment: Alignment.topLeft,
//      height: MediaQuery.of(context).size.height/3,
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            // margin: EdgeInsets.all(10),
            padding: EdgeInsets.only(
              bottom: screenScaler.getWidth(.5)
            ),
            child: Text(
              title,
              style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontSize: 20, color: white, fontWeight: FontWeight.bold)),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            // margin: EdgeInsets.all(10),
            // padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
            child: Text(
              text,
              style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontSize: 16,
                      color: whiteish,
                    height: 1

                  )),
            ),
          ),
        ],
      ),
    );
  }
}
