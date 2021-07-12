import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matched_app/ui_resources/custom_colors.dart';

class TestButtom extends StatefulWidget {
  String detail = 'Test';
  String image = "";
  Alignment alignment;
  Widget screen = Scaffold();

  final GestureTapCallback onTap;

  TestButtom(
      {@required Key key,
      @required this.detail,
      @required this.image,
      @required this.screen,
      @required this.alignment,
        this.onTap,})
      : super(key: key);

  @override
  _TestButtomState createState() => _TestButtomState();
}

class _TestButtomState extends State<TestButtom> {
  @override
  Widget build(BuildContext context) {
    ScreenScaler scaler = ScreenScaler()..init(context);
    widget.alignment ??= Alignment.center;
    return GestureDetector(
      onTap: (widget.screen != null) ? () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => widget.screen));
      } : widget.onTap,
      child: Container(
        height: scaler.getHeight(18),
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
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: Container(
                  alignment: Alignment.center,
                  //padding: EdgeInsets.all(scaler.getWidth(1)),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image:  AssetImage(widget.image
                          // 'assets/images/image_2.png',
                        ),
                        fit: BoxFit.cover,
                        //alignment: widget.alignment,
                      )
                    )
                  ),
                ),
              ),
            Flexible(
              flex: 5,
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
                            fontSize: 30,
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
