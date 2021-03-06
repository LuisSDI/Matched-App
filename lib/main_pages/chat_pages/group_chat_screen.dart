import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:matched_app/model/group.dart';
import 'package:matched_app/model/group_message.dart';
import 'package:matched_app/bloc/user_bloc.dart';
import 'package:matched_app/resources/group_app_bar.dart';
import 'package:matched_app/resources/group_messages_list.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matched_app/ui_resources/custom_colors.dart';

class GroupChatScreen extends StatelessWidget {

  TextEditingController _textEditingController = TextEditingController();
  bool isWritting = false;


  final GroupModel group;
  final String currentUserUid;

  final GlobalKey<ScaffoldState> _scaffkey = GlobalKey();



  GroupChatScreen({Key key, @required this.group, this.currentUserUid}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenScaler scaler = ScreenScaler()..init(context);
    return SafeArea(
      top: false,
      child: BlocProvider(
        bloc: UserBloc(),
        child:Scaffold(
          backgroundColor: dark,
          key: _scaffkey,
          body: Column(
            children: <Widget>[
              Flexible(
                child: GroupMessageList(currentUserId: currentUserUid,
                  groupId: group.groupId,groupModel: group,),
              ),
              //Chat Text Field
              Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0xff1DD3B0), Color(0xff1D7CD3)])),
                child:Row(
                  children: [
                    //TextField to Send Messages
                    Expanded(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                            maxHeight: scaler.getHeight(15)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: TextField(
                            controller: _textEditingController,
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            onChanged: (value) {
                              //(value.length > 0 || value.trim() == '') ? setWriting(true) : setWriting(false);
                            },
                            style: GoogleFonts.lato(
                                textStyle: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold)),
                            decoration: InputDecoration(
                              hintText: 'Type a message...',
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: scaler.getHeight(1),
                                  vertical: scaler.getWidth(1)
                              ),
                              isDense: true,
                              hintStyle: GoogleFonts.lato(
                                  textStyle: TextStyle(
                                    fontSize: 15,
                                  )),
                              counterText: '',
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(10))
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        if(_textEditingController.text.length == 0 || _textEditingController.text.trim() == ''){
                          _scaffkey.currentState.showSnackBar(SnackBar(
                            content: Container(
                              alignment: Alignment.center,
                              height: scaler.getHeight(2),
                              child: Text(
                                "Unable to send an empty message",
                                style: GoogleFonts.lato(
                                    textStyle: TextStyle(
                                      fontSize: 14,
                                    )),
                              ),
                            ),
                            duration: Duration(seconds: 1),
                          ));
                        }
                        else{
                          UserBloc userBloc = BlocProvider.of(context);
                          User currentUser = userBloc.currentUser;
                          GroupMessage _message = GroupMessage(
                            senderId: currentUser.uid,
                            message: _textEditingController.text,
                            timeStamp: FieldValue.serverTimestamp(),
                          );
                          userBloc.sendGroupMessage(group.groupId, _message);
                          _textEditingController.clear();
                        }
                      },child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: scaler.getWidth(1)),
                      child: Icon(
                        Icons.send,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),)
                  ],
                ),

              )
            ],
          ),
          appBar: GroupAppBar(group: group,currentUserUid: currentUserUid,),
        ),
      ),
    );
  }



  setWriting(bool val) {
    isWritting = val;
  }
}
