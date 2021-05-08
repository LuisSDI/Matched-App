import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matched_app/ui_resources/custom_colors.dart';

class PlaceHolderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenScaler scaler = ScreenScaler()..init(context);
    return Scaffold(
      backgroundColor: dark,
      body: Column(children: <Widget>[
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
                      "Coming Soon",
                      style: GoogleFonts.lato(
                          textStyle: TextStyle(
                              fontSize: 33,
                              color: white,
                              fontWeight: FontWeight.bold)),
                    ),
                  )),
            ],
          ),
        ),
        Expanded(
          child: Center(
            child: Text(
              "Coming Soon!",
              style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontSize: 50,
                      color: mainColor,
                      fontWeight: FontWeight.bold)),
            ),
          ),
        ),
      ]),
      bottomNavigationBar: Container(
        height: scaler.getHeight(10),
        decoration: BoxDecoration(
            gradient: turkish),
      ),
    );
  }
}
