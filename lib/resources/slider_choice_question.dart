import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matched_app/ui_resources/custom_colors.dart';

class SliderChoiceQuestion extends StatefulWidget {
  const SliderChoiceQuestion({Key key, this.question, this.answers, this.updateSelection, this.index})
      : super(key: key);
  final String question;
  final List<String> answers;
  final updateSelection;
  final int index;
  @override
  _SliderChoiceQuestionState createState() => _SliderChoiceQuestionState();
}

class _SliderChoiceQuestionState extends State<SliderChoiceQuestion> {

  String _currentSliderValue;
  double _value = 0;
  Color thumbColor = white;

  @override
  Widget build(BuildContext context) {
    ScreenScaler screenScaler = ScreenScaler()..init(context);

    _currentSliderValue ??=widget.answers[0];
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenScaler.getWidth(2)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          DecoratedBox(
            decoration: BoxDecoration(
                color: mainColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15))),
            child: Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(
                    top: screenScaler.getWidth(1),
                    left: screenScaler.getWidth(.5)),
                width: double.infinity,
                height: screenScaler.getWidth(11),
                child: Text(
                  widget.question,
                  style: GoogleFonts.lato(color: white, fontSize: 18,
                  fontWeight: FontWeight.bold),
                )),
          ),
          Container(
            decoration: BoxDecoration(
                color: deepBlue,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(15),
                    bottomLeft: Radius.circular(15))),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(children: [
                SliderTheme(
                  data: SliderThemeData(
                    thumbColor: thumbColor,
                    activeTickMarkColor: deepBlue,
                    inactiveTickMarkColor: deepBlue,
                    tickMarkShape: SliderTickMarkShape.noTickMark,
                    trackHeight: screenScaler.getWidth(1),
                    showValueIndicator: ShowValueIndicator.always,
                    inactiveTrackColor: white,
                    activeTrackColor: mainColor,
                    //disabledThumbColor: thumbColor
                  ),
                  child: Slider(
                    value: _value,
                    min: 0,
                    max: widget.answers.length-1.toDouble(),
                    divisions: widget.answers.length-1,
                    label: _currentSliderValue,
                    onChanged: (double value) {
                      setState(() {
                        _value = value;
                        _currentSliderValue = widget.answers[value.toInt()];
                        widget.updateSelection(widget.index,value.toInt());
                        if (_value == widget.answers.length-1.toDouble() ) {
                          thumbColor = mainColor;
                        } else {
                          thumbColor = white;
                        }
                      });



                         // widget.updateSelection(widget.index,widget.answers[value.toInt()-1]);
                        },
                      ),
                  ),
                Container(
                      //color: Colors.red,
                      padding: EdgeInsets.only(
                        bottom: screenScaler.getWidth(1),
                        //left: screenScaler.getWidth(1),
                        //right: screenScaler.getWidth(1)
                      ),
                      child: Text( 'Your choice: $_currentSliderValue',
                      style: GoogleFonts.lato(
                        color: white,
                        fontSize: 16
                      ),),
                      alignment:Alignment.center,
                      ),


              ]),
            ),
          )
        ],
      ),
    );
  }
}
