import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matched_app/ui_resources/custom_colors.dart';

class MainPageButton extends StatelessWidget {

  final String text;
  final IconData iconData;
  final Widget screen;
  const MainPageButton({Key key, this.text, this.iconData, this.screen}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ScreenScaler scaler = ScreenScaler()..init(context);
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => screen));
      },
      child: Container(
        height: scaler.getHeight(18),
        width: scaler.getHeight(18),
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: scaler.getHeight(8),
              child: FittedBox(
                fit: BoxFit.contain,
                child: Icon(
                  iconData,
                  color: Colors.white,
                  size: 40,
                ),
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              height: scaler.getHeight(4.2),
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                    textStyle: TextStyle(
                      //height: .5,
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
