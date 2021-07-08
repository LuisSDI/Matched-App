import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matched_app/main_pages/chatpage/chat_screen.dart';
import 'package:matched_app/main_pages/chatpage/show_profile_chat.dart';
import 'package:matched_app/main_pages/test_pages/people_match_test/compatibility_test.dart';
import 'package:matched_app/main_pages/test_pages/people_match_test/reply_compatibility_test.dart';
import 'package:matched_app/model/user.dart';
import 'package:matched_app/ui_resources/custom_colors.dart';

class AcceptRequestButton extends StatelessWidget {
  final UserModel user;
  final String currentUserUid;
  final String testUid;


  const AcceptRequestButton({Key key, @required this.user, this.currentUserUid, this.testUid})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    ScreenScaler scaler = ScreenScaler()..init(context);
    return Container(
      decoration: BoxDecoration(
          border:
              Border.all(color: Color.fromRGBO(29, 211, 176, 0.8053), width: 2),
          borderRadius: BorderRadius.circular(25)),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.all(scaler.getWidth(1)),
            child: Container(
                height: scaler.getWidth(18),
                width: scaler.getWidth(18),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(scaler.getWidth(10)),
                  child: Image(
                    fit: BoxFit.cover,
                    image: NetworkImage(user.photoUrL),
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Container(
                        height: scaler.getWidth(18),
                        width: scaler.getWidth(18),
                        child: Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                    loadingProgress.expectedTotalBytes
                                : null,
                          ),
                        ),
                      );
                    },
                  ),
                )),
          ),
          //Texts
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user.name,
                  style: GoogleFonts.lato(
                      textStyle: TextStyle(
                    fontSize: 16,
                    color: white,
                  )),
                ),
                SizedBox(
                  height: scaler.getHeight(.5),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ShowProfileScreen(
                                  user: user,
                                )));
                  },
                  child: Text(
                    'Show Profile',
                    style: GoogleFonts.lato(
                        textStyle: TextStyle(
                            fontSize: 16,
                            color: Color.fromRGBO(29, 211, 176, 0.8053),
                            fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          ),
          //Open Chat
          Padding(
            padding: EdgeInsets.symmetric(vertical:scaler.getWidth(1),
            horizontal: scaler.getWidth(3)),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: mainColor,
                padding:EdgeInsets.all(scaler.getWidth(1)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: Text(
                "Accept\nRequest",
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(fontWeight: FontWeight.bold),
              ),
              onPressed: () async {
                if (user.uid == currentUserUid) {
                  _showDialog(context);
                }
                else {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ReplyCompatibilityTest(
                            yourUid: user.uid,
                            myUid: currentUserUid,
                            testUid: testUid,
                          )));
                }
              },
            ),
          )
        ],
      ),
    );
  }

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: dark,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          title: Text(
            'Alert!!!',
            style: GoogleFonts.lato(
                fontWeight: FontWeight.bold, color: white),
          ),
          content: Text("You can't send a request to yourself!!",
              style: GoogleFonts.lato(color: white)),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Ok'),
              child: Text(
                'Ok',
                style: GoogleFonts.lato(
                    fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        );
      },
    );
  }
}
