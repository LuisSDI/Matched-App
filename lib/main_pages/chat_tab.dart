import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matched_app/model/group.dart';
import 'package:matched_app/resources/group_chat_button.dart';
import 'package:matched_app/ui_resources/custom_colors.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:matched_app/bloc/user_bloc.dart';
import 'package:matched_app/model/user.dart';
import 'package:matched_app/resources/chat_button.dart';

// import 'apply_tab.dart';

class ChatTab extends StatefulWidget {
  @override
  _ChatTabState createState() => _ChatTabState();
}

class _ChatTabState extends State<ChatTab> {
  @override
  Widget build(BuildContext context) {
    ScreenScaler scaler = ScreenScaler()..init(context);
    UserBloc userBloc = BlocProvider.of(context);
    print(userBloc.currentUser.uid);
    return BlocProvider(
      bloc: userBloc,
      child: FutureBuilder(
        future: userBloc.getUserData(userBloc.currentUser.uid),
        builder: (context, snapshot) {
          print(snapshot.connectionState);
          print(snapshot.data);
          if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
            UserModel user = snapshot.data;
            return FutureBuilder(
              future:  userBloc.getListGroups(user),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  print("Here is the result");
                  print(snapshot.data);
                  List<GroupModel> groups = snapshot.data;
                  return FutureBuilder(
                      future: userBloc.getListUsers(user.uid),
                      builder: (context, snapshot2) {
                        print(snapshot2.data);
                        if (snapshot2.connectionState == ConnectionState.done) {
                          List<UserModel> users = snapshot2.data;
                          print("Here is the result 2");
                          print(snapshot2.data);
                          return SingleChildScrollView(
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: scaler.getWidth(7),
                                      top: scaler.getWidth(7)),
                                  child: Container(
                                    height: scaler.getHeight(5),
                                    alignment: Alignment.centerLeft,
                                    child: FittedBox(
                                      fit: BoxFit.contain,
                                      child: Text(
                                        "Chats,",
                                        style: GoogleFonts.lato(
                                            textStyle: TextStyle(
                                                fontSize: 36,
                                                color: white,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(top: scaler.getHeight(1)),
                                  child: Column(
                                    children: [
                                      ListView.builder(
                                        itemBuilder: (context, index) {
                                          return Padding(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: scaler.getHeight(2),
                                              vertical: scaler.getHeight(.5),
                                            ),
                                            child: GroupChatButton(
                                              group: groups[index],
                                              currentUserUid: user.uid,
                                            ),
                                          );
                                        },
                                        itemCount: groups.length,
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        padding: EdgeInsets.zero,
                                      ),
                                      ListView.builder(
                                        itemBuilder: (context, index) {
                                          return Padding(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: scaler.getHeight(2),
                                              vertical: scaler.getHeight(.5),
                                            ),
                                            child: ChatButton(
                                              user: users[index],
                                              currentUserUid: user.uid,
                                            ),
                                          );
                                        },
                                        itemCount: users.length,
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        padding: EdgeInsets.zero,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        } else {
                          return Scaffold(
                            backgroundColor: dark,
                            body: Center(
                              child: CircularProgressIndicator(
                                valueColor:
                                    AlwaysStoppedAnimation<Color>(mainColor),
                              ),
                            ),
                          );
                        }
                      });
                } else {
                  return Scaffold(
                    backgroundColor: dark,
                    body: Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(mainColor),
                      ),
                    ),
                  );
                }
              },
            );
          }

          else
            {
              return Scaffold(
                backgroundColor: dark,
                body: Center(
                  child: CircularProgressIndicator(
                    valueColor:
                    AlwaysStoppedAnimation<Color>(mainColor),
                  ),
                ),
              );
            }

          },
      ),
    );
  }
}
