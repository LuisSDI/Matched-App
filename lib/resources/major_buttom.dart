import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matched_app/ui_resources/custom_colors.dart';

class MajorButtom extends StatefulWidget {
  String detail = 'Test';
  String image = "";
  Alignment alignment;
  Widget screen = Scaffold();

  MajorButtom({@required Key key, @required this.detail, @required this.image, @required this.screen, @required this.alignment})
      : super(key: key);

  @override
  _MajorButtomState createState() => _MajorButtomState();
}

class _MajorButtomState extends State<MajorButtom> {
  @override
  Widget build(BuildContext context) {
    ScreenScaler scaler = ScreenScaler()..init(context);
    widget.screen;
    widget.alignment ??= Alignment.center;
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => widget.screen));
      },
      child: Container(
        height: scaler.getHeight(16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
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
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 4,
              child: Container(
                alignment:Alignment.centerLeft ,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10)
                  ),
                  child: Image(
                    image: AssetImage(
                      //widget.image
                      'assets/images/image_2.png',
                    ),
                    fit: BoxFit.cover,
                    alignment: widget.alignment,
                    height: scaler.getHeight(16),
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 4,
              child: Container(
                alignment: Alignment.center,
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Text(
                    widget.detail,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lato(
                        textStyle: TextStyle(
                            //height: .5,
                            fontSize: 20,
                            color: white,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
