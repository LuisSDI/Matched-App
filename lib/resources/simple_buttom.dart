import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matched_app/ui_resources/custom_colors.dart';

class SimpleButton extends StatelessWidget {
  SimpleButton({@required this.text, @required this.screen});
  final Widget screen;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => screen));
        },
        style:  ElevatedButton.styleFrom(primary: Colors.transparent,
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(30.0),
          ),
        padding: EdgeInsets.zero
        ),
        child: Ink(
          child: Container(
            constraints: BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
            decoration: BoxDecoration(
                gradient: turkish,
                borderRadius: BorderRadius.circular(30.0)
            ),
            alignment: Alignment.center,
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                fontSize: 18,
                color: white,
                fontWeight: FontWeight.bold
              )
            ),
          ),
        ),
      ),
    );
  }
}

class SimpleButtonAdvanced extends StatelessWidget {
  SimpleButtonAdvanced({@required this.text, @required this.onTap});

  final GestureTapCallback onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      child: ElevatedButton(
        onPressed: onTap,
        style:  ElevatedButton.styleFrom(primary: Colors.transparent,
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0),
            ),
            padding: EdgeInsets.zero
        ),
        child: Ink(
          child: Container(
            constraints: BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
            decoration: BoxDecoration(
                gradient: turkish,
                borderRadius: BorderRadius.circular(30.0)
            ),
            alignment: Alignment.center,
            child: Text(
                text,
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                    fontSize: 18,
                    color: white
                )
            ),
          ),
        ),
      ),
    );
  }
}