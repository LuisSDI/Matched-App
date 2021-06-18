import 'package:matched_app/main_pages/chatpage/chat_screen.dart';
import 'package:matched_app/main_pages/chatpage/show_profile_chat.dart';
import 'package:matched_app/Model/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matched_app/ui_resources/custom_colors.dart';

class SmallChatButton extends StatelessWidget {
  final UserModel user;
  final String currentUserUid;

  const SmallChatButton({Key key, @required this.user, this.currentUserUid}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ScreenScaler scaler = ScreenScaler()..init(context);
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: mainColor, width: 2),
          borderRadius: BorderRadius.circular(25),
      color: dark),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.all(scaler.getWidth(1)),
            child: Container(
                height: scaler.getWidth(10),
                width: scaler.getWidth(10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(scaler.getWidth(10)),
                  child: Image(
                    fit: BoxFit.cover,
                    image: NetworkImage(user.photoUrL),
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Container(
                        // height: scaler.getWidth(10),
                        // width: scaler.getWidth(10),
                        child: Center(
                          child: Container(
                            height: scaler.getWidth(3),
                            width: scaler.getWidth(3),
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes
                                  : null,
                            ),
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
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => ChatScreen(
                user: user,
                currentUserUid: currentUserUid,
              )));
            },
            child: Container(
              child: Icon(
                Ionicons.ios_arrow_forward,
                color: Color.fromRGBO(29, 211, 176, 0.8053),
                size: 40,
              ),
            ),
          )
        ],
      ),
    );
  }
}
