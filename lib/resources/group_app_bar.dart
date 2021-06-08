import 'package:matched_app/Model/group.dart';
import 'package:matched_app/main_pages/chatpage/show_profile_chat.dart';
import 'package:matched_app/Model/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matched_app/ui_resources/custom_colors.dart';

class GroupAppBar extends StatelessWidget implements PreferredSizeWidget {


  final GroupModel group;

  const GroupAppBar({Key key, this.group}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    ScreenScaler scaler = ScreenScaler()..init(context);
    return Container(
      alignment: Alignment.bottomLeft,
      decoration: BoxDecoration(
          gradient: turkish),
      child: Padding(
        padding: EdgeInsets.only(top: scaler.getHeight(1)),
        child: Padding(
          padding: EdgeInsets.only(left: scaler.getHeight(1),
              top: scaler.getHeight(1)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //Back Button
              GestureDetector(
                child: Container(
                  alignment: Alignment.center,
                  child: Icon(
                    Ionicons.ios_arrow_back,
                    color: Colors.white,
                    size: 36,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              //Profile Picture
              Container(
                height: scaler.getHeight(6),
                width: scaler.getHeight(6),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(
                      Radius.circular(scaler.getWidth(20))),
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: Image(
                      image: NetworkImage(group.groupImage),
                      loadingBuilder: (BuildContext context, Widget child,
                          ImageChunkEvent loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Container(
                          height: scaler.getWidth(40),
                          width: scaler.getWidth(40),
                          color: Colors.white,
                          child: Center(
                            child: CircularProgressIndicator(
                              //valueColor: AlwaysStoppedAnimation(Colors.white),
                              value: loadingProgress.expectedTotalBytes !=
                                  null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes
                                  : null,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: scaler.getHeight(1),
              ),
              //Contact Name
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Name Text
                  Text(
                    group.groupName,
                    style: GoogleFonts.lato(
                        textStyle: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                  ),
                  //User Status
                  Padding(
                    padding: EdgeInsets.only(top: 4),
                    child: Row(
                      children: [
                        Text(
                          'Members - ${group.members.length}',
                          style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                              )),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Expanded(child: Container()),
              Padding(
                padding: EdgeInsets.only(right: scaler.getHeight(2)),
                child: Container(
                  child: IconButton(
                    onPressed: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => ShowProfileScreen(user: user,)));
                    },
                    icon: Icon(
                      MaterialCommunityIcons.account_circle,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                ),
              ),


              //View Profile Button
            ],
          ),
        ),
      ),
    );
  }


  final Size preferredSize = const Size.fromHeight(kToolbarHeight + 10);


}