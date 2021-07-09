import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matched_app/ui_resources/custom_colors.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class VersusPercentBar extends StatelessWidget {
  VersusPercentBar({Key key, this.names, this.scores, this.width}) : super(key: key);

  final List<String> names;
  final List<int> scores;
  double width;


  @override
  Widget build(BuildContext context) {
    ScreenScaler scaler = ScreenScaler()..init(context);
    int totalPoints = scores[0] + scores[1];
    double percent= scores[0]/totalPoints;
    width ??= 80;
    return Column(
      children: [
        Container(
          child: LinearPercentIndicator(
            width: scaler.getWidth(width),
            lineHeight: scaler.getWidth(1),
            percent: percent,
            linearStrokeCap: LinearStrokeCap.roundAll,
            backgroundColor: purpleish,
            progressColor: mainColor,
          ),
        ),
        Container(
          width: scaler.getWidth(width*1.1),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('${names[0]} \n ${(percent*100).toStringAsFixed(2)}%',
              style: GoogleFonts.lato(
                fontSize: 14,
                fontWeight: (scores[0] < scores[1]) ? FontWeight.normal:
                FontWeight.bold,
                color: white,

              ),
                  textAlign: TextAlign.center,),
              Text('${names[1]} \n ${((1-percent)*100).toStringAsFixed(2)}%',
                style: GoogleFonts.lato(
                    fontSize: 14,
                    fontWeight: (scores[0] > scores[1]) ? FontWeight.normal:
                    FontWeight.bold,
                    color: white
                ),
                textAlign: TextAlign.center,),
            ],
          ),
        )
      ],
    );
  }
}
