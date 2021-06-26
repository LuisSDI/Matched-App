import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matched_app/bloc/user_bloc.dart';
import 'package:matched_app/model/group.dart';
import 'package:matched_app/model/user.dart';
import 'package:matched_app/resources/small_chat_button.dart';
import 'package:matched_app/ui_resources/custom_colors.dart';

class ShowGroupScreen extends StatelessWidget {
  final GroupModel group;
  final String currentUserUid;

  const ShowGroupScreen({
    Key key,
    @required this.group,
    this.currentUserUid,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenScaler scaler = ScreenScaler()..init(context);
    UserBloc userBloc = BlocProvider.of(context);
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: dark,
        body: Container(
          child: Padding(
            padding: EdgeInsets.only(
                left: scaler.getHeight(2), right: scaler.getHeight(2)),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  // Title Row
                  Padding(
                    padding: EdgeInsets.only(
                      top: scaler.getHeight(3),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        //Back Button
                        GestureDetector(
                          child: Container(
                            child: Icon(
                              Ionicons.ios_arrow_back,
                              color: mainColor,
                              size: 36,
                            ),
                          ),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                        //Profile Text
                        Container(
                          height: scaler.getHeight(5),
                          alignment: Alignment.centerLeft,
                          child: FittedBox(
                            fit: BoxFit.contain,
                            child: Text(
                              "${group.groupName}",
                              style: GoogleFonts.lato(
                                  textStyle: TextStyle(
                                      fontSize: 36,
                                      color: white,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                        ),
                        //Edit Profile Button
                      ],
                    ),
                  ),

                  //Profile Picture
                  Padding(
                    padding: EdgeInsets.only(top: scaler.getHeight(1)),
                    child: Container(
                      height: scaler.getWidth(50),
                      width: scaler.getWidth(90),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(
                            Radius.circular(scaler.getWidth(0))),
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
                                child: Center(
                                  child: CircularProgressIndicator(
                                    value: loadingProgress.expectedTotalBytes !=
                                            null
                                        ? loadingProgress
                                                .cumulativeBytesLoaded /
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
                  ),
                  //Memebers Title
                  Padding(
                    padding: EdgeInsets.only(top: scaler.getHeight(2)),
                    child: Stack(children: [
                      Container(
                        height: scaler.getHeight(5),
                        //width: scaler.getHeight(10),
                        decoration: BoxDecoration(
                          color: cianGradient,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            topLeft: Radius.circular(10)
                          ),
                        ),
                        child: Center(
                          child: FittedBox(
                            fit: BoxFit.cover,
                            child: Text(
                              'Members',
                              style: GoogleFonts.lato(
                                  textStyle: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                        ),
                      ),
                    ]),
                  ),

                  Container(
                    decoration: BoxDecoration(
                      gradient: turkish,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)
                      )
                    ),
                    child: FutureBuilder(
                        future: userBloc.getListMemebers(group),
                        builder: (context, snapshot2) {
                          print(snapshot2.data);
                          if (snapshot2.connectionState ==
                              ConnectionState.done) {
                            List<UserModel> users = snapshot2.data;
                            print("Here is the result 2");
                            print(snapshot2.data);
                            return SingleChildScrollView(
                              child: Column(
                                children: [
                                  Column(
                                    children: [
                                      ListView.builder(
                                        itemBuilder: (context, index) {
                                          return Padding(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: scaler.getHeight(1),
                                              vertical: scaler.getHeight(.5),
                                            ),
                                            child: SmallChatButton(
                                              user: users[index],
                                              currentUserUid: currentUserUid,
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
                                ],
                              ),
                            );
                          } else {
                            return Container(
                              height: scaler.getWidth(10),
                              child: Center(
                                  child: CircularProgressIndicator(
                                    valueColor:
                                        AlwaysStoppedAnimation<Color>(white),
                                  ),
                              ),
                            );
                          }
                        }),
                  ),
                  SizedBox(
                    height: scaler.getHeight(1),
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: Container(
          height: scaler.getHeight(10),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xff1DD3B0), Color(0xff1D7CD3)])),
        ),
      ),
    );
  }
}
