import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matched_app/ui_resources/custom_colors.dart';

class ExpansionItem extends StatelessWidget {
  final String title;
  final String data;
  final RichText richText;
  final Container special;

  ExpansionItem(
      {@required Key key, @required this.title, @required this.data,  this.richText,  this.special});

  @override
  Widget build(BuildContext context) {
    ScreenScaler scaler = ScreenScaler()..init(context);
    final theme = Theme.of(context).copyWith(
      dividerColor: mainColor,
    );
    return Padding(
      padding: EdgeInsets.only(bottom: scaler.getHeight(1)),
      child: Container(
        child: Theme(
          data: theme,
          child: Container(
            decoration: BoxDecoration(
              color: mainColor,
              border: Border.all(color: mainColor, width: 2),
              borderRadius: BorderRadius.circular(0),
            ),
            child: ExpansionTile(
              tilePadding: EdgeInsets.all(0),
              trailing: Padding(
                padding: EdgeInsets.only(
                  right: scaler.getHeight(2),
                ),
                child: Icon(
                  Entypo.chevron_down,
                  color: white,
                ),
              ),
              title: Container(
                padding: EdgeInsets.only(left: scaler.getHeight(2)),
                child: Text(
                  title,
                  style: GoogleFonts.lato(
                      textStyle:
                          TextStyle(color: white,fontSize: 18,
                              //fontWeight: FontWeight.bold
                          )),
                ),
              ),
              children: <Widget>[
                (data == null && richText == null)
                    ? special
                    : Container(
                        width: double.infinity,
                        color: deepBlue,
                        child: (data == null)
                            ? richText
                            : Text(
                                data,
                                style: GoogleFonts.lato(
                                    textStyle: TextStyle(
                                        fontSize: 14, color: white)),
                              ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
