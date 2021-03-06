
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:matched_app/ui_resources/custom_colors.dart';

class ArrowButtom extends StatelessWidget {

  final GestureTapCallback onTap;

  const ArrowButtom({@required Key key, @required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenScaler scaler = ScreenScaler()..init(context);
    return Container(
      height: scaler.getWidth(24),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: scaler.getWidth(15),
            decoration: BoxDecoration(
              gradient: turkish
            ),

          ),

          GestureDetector(
            onTap: onTap,
            child: Container(
              alignment: Alignment(0.8,-1),
              child: Container(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.all(scaler.getWidth(0)),
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Icon(
                    AntDesign.arrowright,
                    color: Colors.white,
                    size: 35,
                  )
                ),
              ),
              width: scaler.getWidth(15),
              height: scaler.getWidth(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: deepBlue,
                  width: 2
                ),
                color: mainColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black38,
                    blurRadius: 4.0,
                    // soften the shadow//extend the shadow
                    offset: Offset(
                      0,
                      6,
                    ),
                  ),

                ],


              ),

        ),
            ),
          ),]
      ),
    )
    ;
  }
}
