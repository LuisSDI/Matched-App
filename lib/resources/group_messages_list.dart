import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matched_app/bloc/user_bloc.dart';
import 'package:matched_app/model/group.dart';
import 'package:matched_app/model/user.dart';
import 'package:matched_app/ui_resources/custom_colors.dart';

class GroupMessageList extends StatelessWidget {
  final String currentUserId;
  final String groupId;
  final GroupModel groupModel;

  const GroupMessageList(
      {Key key, this.currentUserId, this.groupId, this.groupModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenScaler scaler = ScreenScaler()..init(context);
    UserBloc userBloc = BlocProvider.of(context);
    return BlocProvider(
      bloc: userBloc,
      child: StreamBuilder(
        stream: userBloc.getChats(groupId),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.data == null) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return FutureBuilder(
              future: userBloc.getListMembers(groupModel),
              builder: (context, AsyncSnapshot<List<UserModel>> snapshot2) {
                if (snapshot2.data == null) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return ListView.builder(
                  padding: EdgeInsets.all(scaler.getWidth(2)),
                  itemBuilder: (context, index) {
                    Iterable<UserModel> users = snapshot2.data.where((element) =>
                        element.uid == snapshot.data.docs[index]['senderId']);
                    return chatMessageItem(context, snapshot.data.docs[index],users.first);
                  },
                  itemCount: snapshot.data.docs.length,
                  reverse: true,
                );
              });
        },
      ),
    );
  }

  Widget chatMessageItem(BuildContext context, DocumentSnapshot snapshot,UserModel user) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: snapshot['senderId'] == currentUserId
            ? senderLayout(context, snapshot, Alignment.centerRight,user)
            : recieverLayout(context, snapshot, Alignment.centerLeft,user),
      ),
    );
  }

  Widget senderLayout(
      BuildContext context, DocumentSnapshot snapshot, Alignment alignment,UserModel user) {
    ScreenScaler scaler = ScreenScaler()..init(context);
    return Align(
      alignment: Alignment.centerRight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            constraints: BoxConstraints(maxWidth: scaler.getWidth(60)),
            child: Padding(
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
                borderRadius: BorderRadius.all(Radius.circular(10))),
          ),
          Padding(
            padding:  EdgeInsets.only(left: scaler.getWidth(.5)),
            child: Column(
              children: [
                Container(
                  height: scaler.getWidth(6),
                  width: scaler.getWidth(6),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage(user.photoUrL,),
                          fit: BoxFit.cover

                      )
                  ),
                  // child: Image.network(user.photoUrL,
                  // fit: BoxFit.cover,),
                ),
                Text(user.name.split(' ').first,
                  style: GoogleFonts.lato(
                      fontSize: 10,
                      color: white
                  ),)
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget recieverLayout(
      BuildContext context, DocumentSnapshot snapshot, Alignment alignment,UserModel user) {
    ScreenScaler scaler = ScreenScaler()..init(context);
    return Align(
      alignment: alignment,
      child: Row(
        children: [
          Padding(
            padding:  EdgeInsets.only(right: scaler.getWidth(.5)),
            child: Column(
              children: [
                Container(
                  height: scaler.getWidth(6),
                  width: scaler.getWidth(6),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(user.photoUrL,),
                      fit: BoxFit.cover

                    )
                  ),
                  // child: Image.network(user.photoUrL,
                  // fit: BoxFit.cover,),
                ),
                Text(user.name.split(' ').first,
                  style: GoogleFonts.lato(
                      fontSize: 10,
                      color: white
                  ),)
              ],
            ),
          ),
          Container(
            constraints: BoxConstraints(maxWidth: scaler.getWidth(60)),
            child: Padding(
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
                borderRadius: BorderRadius.all(Radius.circular(10))),
          ),
        ],
      ),
    );
  }
}
