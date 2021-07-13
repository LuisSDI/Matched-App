import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matched_app/bloc/user_bloc.dart';
import 'package:matched_app/model/user.dart';
import 'package:matched_app/ui_resources/custom_colors.dart';

class MessageList extends StatelessWidget {

  final String currentUserId;
  final UserModel receiverUser;

  const MessageList({Key key, this.currentUserId, this.receiverUser}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenScaler scaler = ScreenScaler()..init(context);
    UserBloc userBloc = BlocProvider.of(context);
    return BlocProvider(
      bloc: userBloc,
      child: FutureBuilder(
        future: userBloc.getUserData(userBloc.currentUser.uid),
        builder: (context, AsyncSnapshot<UserModel> snapshot2) {
          if(snapshot2.data == null){
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return StreamBuilder(
            stream: FirebaseFirestore.instance.collection('messages').doc(currentUserId)
                .collection(receiverUser.uid).orderBy('timeStamp',descending: true).snapshots()
            ,
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot){
              if(snapshot.data == null){
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
                  return ListView.builder(
                    padding: EdgeInsets.all(scaler.getWidth(2)),
                    itemBuilder: (context, index) {
                      UserModel user;
                      if (snapshot.data.docs[index]['senderId'] == userBloc.currentUser.uid) {
                        user = snapshot2.data;
                      }
                      else{
                        user = receiverUser;
                      }
                      return chatMessageItem(context, snapshot.data.docs[index],user);
                    },
                    itemCount: snapshot.data.docs.length,
                    reverse: true,
                  );
            },
          );
        }
      ),
    );
  }

  Widget chatMessageItem(BuildContext context, DocumentSnapshot snapshot, UserModel userModel){
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: snapshot['senderId'] == currentUserId ? senderLayout(context , snapshot , Alignment.centerRight,userModel) :
        recieverLayout(context,snapshot, Alignment.centerLeft, userModel),
      ),
    );
  }

  Widget senderLayout(BuildContext context , DocumentSnapshot snapshot , Alignment alignment,UserModel user) {
    ScreenScaler scaler = ScreenScaler()..init(context);
    return Align(
      alignment: alignment,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
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
                // Text(user.name.split(' ').first,
                //   style: GoogleFonts.lato(
                //       fontSize: 10,
                //       color: white
                //   ),)
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget recieverLayout(BuildContext context,DocumentSnapshot snapshot, Alignment alignment, UserModel user) {
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
                // Text(user.name.split(' ').first,
                //   style: GoogleFonts.lato(
                //       fontSize: 10,
                //       color: white
                //   ),)
              ],
            ),
          ),
          Container(
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
        ],
      ),
    );
  }

}
