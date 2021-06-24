import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matched_app/bloc/user_bloc.dart';
import 'package:matched_app/ui_resources/custom_colors.dart';

class GroupMessageList extends StatelessWidget {

  final String currentUserId;
  final String groupId;

  const GroupMessageList({Key key, this.currentUserId, this.groupId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenScaler scaler = ScreenScaler()..init(context);
    UserBloc userBloc = BlocProvider.of(context);
    return BlocProvider(
      bloc: UserBloc(),
      child: StreamBuilder(
        stream: userBloc.getChats(groupId),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot){
          if(snapshot.data == null){
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            padding: EdgeInsets.all(scaler.getWidth(2)),
            itemBuilder: (context, index) {
              return chatMessageItem(context, snapshot.data.docs[index]);
            },
            itemCount: snapshot.data.docs.length,
            reverse: true,
          );
        },
      ),
    );
  }

  Widget chatMessageItem(BuildContext context, DocumentSnapshot snapshot){
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: snapshot['senderId'] == currentUserId ? senderLayout(context , snapshot , Alignment.centerRight) :
        recieverLayout(context,snapshot, Alignment.centerLeft),
      ),
    );
  }

  Widget senderLayout(BuildContext context , DocumentSnapshot snapshot , Alignment alignment) {
    ScreenScaler scaler = ScreenScaler()..init(context);
    return Align(
      alignment: alignment,
      child: Container(
        constraints: BoxConstraints(
            maxWidth: scaler.getWidth(60)
        ),
        child:Padding(
          padding: EdgeInsets.all(scaler.getHeight(1)),
          child: Text(
            snapshot['message'],
            style: GoogleFonts.lato(
                textStyle: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                )),
          ),
        ),

        decoration: BoxDecoration(
            color: mainColor,
            borderRadius: BorderRadius.all(Radius.circular(10))
        ),
      ),
    );
  }

  Widget recieverLayout(BuildContext context,DocumentSnapshot snapshot, Alignment alignment ) {
    ScreenScaler scaler = ScreenScaler()..init(context);
    return Align(
      alignment: alignment,
      child: Container(
        constraints: BoxConstraints(
            maxWidth: scaler.getWidth(60)
        ),
        child:Padding(
          padding: EdgeInsets.all(scaler.getHeight(1)),
          child: Text(
            snapshot['message'],
            style: GoogleFonts.lato(
                textStyle: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                )),
          ),
        ),

        decoration: BoxDecoration(
            color: greyish,
            borderRadius: BorderRadius.all(Radius.circular(10))
        ),
      ),
    );
  }

}
