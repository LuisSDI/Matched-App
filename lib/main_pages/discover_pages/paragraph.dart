import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matched_app/ui_resources/custom_colors.dart';

class Paragraph extends StatelessWidget {
  const Paragraph({Key key, @required this.title, @required this.text})
      : super(key: key);
  final String title, text;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
//      height: MediaQuery.of(context).size.height/3,
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.fromLTRB(5, 5, 0, 5),
            child: Text(
              title,
              style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontSize: 24, color: white, fontWeight: FontWeight.bold)),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
            child: Text(
              text,
              style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontSize: 18,
                      color: white,
                      fontWeight: FontWeight.normal)),
            ),
          ),
        ],
      ),
    );
  }
}
