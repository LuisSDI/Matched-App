import 'package:matched_app/Model/group.dart';
import 'package:matched_app/main_pages/chatpage/chat_screen.dart';
import 'package:matched_app/main_pages/chatpage/group_chat_screen.dart';
import 'package:matched_app/main_pages/chatpage/show_profile_chat.dart';
import 'package:matched_app/Model/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matched_app/ui_resources/custom_colors.dart';

class GroupChatButton extends StatelessWidget {
  final GroupModel group;
  final String currentUserUid;

  const GroupChatButton({Key key, @required this.group, this.currentUserUid}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ScreenScaler scaler = ScreenScaler()..init(context);
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Color.fromRGBO(29, 211, 176, 0.8053), width: 2),
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
                    image: NetworkImage(group.groupImage),
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
                  group.groupName,
                  style: GoogleFonts.lato(
                      textStyle: TextStyle(
                        fontSize: 16,
                        color: white,
                      )),
                ),
                SizedBox(
                  height: scaler.getHeight(.5),
                ),
                Text(
                  'Members - ${group.members.length}',
                  style: GoogleFonts.lato(
                      textStyle: TextStyle(
                          fontSize: 16,
                          color: Color.fromRGBO(29, 211, 176, 0.8053),
                          fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
          //Open Chat
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => GroupChatScreen(
                group: group,
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
