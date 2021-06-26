
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matched_app/main_pages/edit_profile.dart';
import 'package:matched_app/ui_resources/custom_colors.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:matched_app/bloc/user_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:matched_app/model/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:matched_app/login/sign_page.dart';

//import 'apply_tab.dart';


class ProfileTab extends StatelessWidget {
  UserBloc userBloc;
  FirebaseFirestore databaseReference = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    ScreenScaler scaler = ScreenScaler()..init(context);
    final Stream<int> _dummy = (() async* {
      await Future<void>.delayed(const Duration(seconds: 1));
      yield 1;
      await Future<void>.delayed(const Duration(seconds: 120));
    })();
    userBloc = BlocProvider.of(context);
    return BlocProvider(
      bloc: userBloc,
      child: StreamBuilder(
                stream: userBloc.listenUserData(userBloc.currentUser.uid),
                builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.active) {
                          DocumentSnapshot value = snapshot.data;
                          Map<String, dynamic> data = value.data();
                          UserModel user = UserModel(
                            personality: data['personality'],
                            name: data['full name'],
                            type: data['type'],
                            description: data['description'],
                            uid: data['uid'],
                            photoUrL: data['photoURL'],
                            email: data['email'],
                            caseSearch: data['caseSearch'],
                          );
                          return profile(scaler,
                              user,
                              context);
                        } else {
                          return Scaffold(
                            backgroundColor: dark,
                            body: Center(
                              child: CircularProgressIndicator(),
                            ),
                          );
                        }
                }));

  }

  Widget profile(ScreenScaler scaler, UserModel users, BuildContext context) {
    return SafeArea(
      top: false,
      child: Container(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
                left: scaler.getHeight(2), right: scaler.getHeight(2)),
            child: Column(
              children: <Widget>[
                //Profile Text
                Padding(
                  padding: EdgeInsets.only(
                      top: scaler.getHeight(7),
                      left: scaler.getWidth(7) - scaler.getHeight(2)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //Profile Text
                      Container(
                        height: scaler.getHeight(5),
                        alignment: Alignment.centerLeft,
                        child: FittedBox(
                          fit: BoxFit.contain,
                          child: Text(
                            "Profile",
                            style: GoogleFonts.lato(
                                textStyle: TextStyle(
                                    fontSize: 36,
                                    color: white,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                      //Edit Profile Button
                      Container(
                        child: IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EditProfile(
                                      user: users,
                                    )));
                          },
                          icon: Icon(
                            MaterialCommunityIcons.account_edit,
                            color: mainColor,
                            size: 36,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                //Profile Picture
                Padding(
                  padding: EdgeInsets.only(top: scaler.getHeight(2)),
                  child: Container(
                    height: scaler.getWidth(40),
                    width: scaler.getWidth(40),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(
                          Radius.circular(scaler.getWidth(20))),
                      child: FittedBox(
                          fit: BoxFit.cover,
                          child: Container(color: mainColor,
                            child:   Image(
                              image: NetworkImage(users.photoUrL),
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
                                          ? loadingProgress.cumulativeBytesLoaded /
                                          loadingProgress.expectedTotalBytes
                                          : null,
                                    ),
                                  ),
                                );
                              },
                            ),)



                      ),
                    ),
                  ),
                ),
                //Name Field
                Padding(
                  padding: EdgeInsets.only(top: scaler.getHeight(2)),
                  child: Stack(children: [

                    Container(
                      padding: EdgeInsets.only(right: scaler.getHeight(.5)),
                      alignment: Alignment.centerRight,
                      height: scaler.getHeight(5),
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: mainColor,
                          ),
                          color: white,
                          borderRadius: BorderRadius.circular(10)),
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: Text(users.name,
                          textAlign: TextAlign.right,
                          style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                  fontSize: 16,
                                  color: black,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ),
                    Container(
                      height: scaler.getHeight(5),
                      width: scaler.getHeight(12),
                      decoration: BoxDecoration(
                        gradient: turkish,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: FittedBox(
                          fit: BoxFit.cover,
                          child: Text(
                            'Name',
                            style: GoogleFonts.lato(
                                textStyle: TextStyle(
                                  fontSize: 18,
                                  color: white,
                                )),
                          ),
                        ),
                      ),
                    ),
                  ]),
                ),
                // I am a ... Field
                Padding(
                  padding: EdgeInsets.only(top: scaler.getHeight(2)),
                  child: Stack(children: [
                    Container(
                      padding: EdgeInsets.only(right: scaler.getHeight(.5)),
                      alignment: Alignment.centerRight,
                      height: scaler.getHeight(5),
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: mainColor,
                          ),
                          color: white,
                          borderRadius: BorderRadius.circular(10)),
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: Text(users.personality,
                          textAlign: TextAlign.right,
                          style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                  fontSize: 16,
                                  color: black,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ),
                    Container(
                      height: scaler.getHeight(5),
                      width: scaler.getHeight(12),
                      decoration: BoxDecoration(
                        gradient: turkish,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: FittedBox(
                          fit: BoxFit.cover,
                          child: Text(
                            'Personality',
                            style: GoogleFonts.lato(
                                textStyle: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                )),
                          ),
                        ),
                      ),
                    ),
                  ]),
                ),

                // College Field
                Padding(
                  padding: EdgeInsets.only(top: scaler.getHeight(2)),
                  child: Stack(children: [

                    Container(
                      padding: EdgeInsets.only(right: scaler.getHeight(.5)),
                      alignment: Alignment.centerRight,
                      height: scaler.getHeight(5),
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: mainColor,
                          ),
                          color: white,
                          borderRadius: BorderRadius.circular(10)),
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: Text(users.type,
                          textAlign: TextAlign.right,
                          style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                  fontSize: 16,
                                  color: black,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ),
                    Container(
                      height: scaler.getHeight(5),
                      width: scaler.getHeight(12),
                      decoration: BoxDecoration(
                        gradient: turkish,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: FittedBox(
                          fit: BoxFit.cover,
                          child: Text(
                            'College',
                            style: GoogleFonts.lato(
                                textStyle: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                )),
                          ),
                        ),
                      ),
                    ),
                  ]),
                ),
                // Description Field
                Padding(
                  padding: EdgeInsets.only(top: scaler.getHeight(2)),
                  child: Container(
                    child: Stack(children: [

                      Container(
                        padding: EdgeInsets.only(left: scaler.getHeight(.5)),
                        alignment: Alignment.topLeft,
                        height: scaler.getHeight(20),
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: mainColor,
                            ),
                            color: white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: EdgeInsets.only(top: scaler.getHeight(5)),
                          child: Text(users.description,
                            textAlign: TextAlign.left,
                            style: GoogleFonts.lato(
                                textStyle: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                )),
                          ),
                        ),
                      ),
                      Container(
                        height: scaler.getHeight(5),
                        alignment: Alignment(0, .5),
                        decoration: BoxDecoration(
                          gradient: turkish,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: FittedBox(
                            fit: BoxFit.cover,
                            child: Text(
                              'Description',
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
                ),
                //Sign out button
                Padding(
                  padding: EdgeInsets.only(
                      top: scaler.getHeight(2), bottom: scaler.getHeight(2)),
                  child: Container(
                    padding: EdgeInsets.all(scaler.getHeight(.5)),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: turkish,
                    ),
                    child: IconButton(
                      onPressed: () async {
                        //Signout
                        await FirebaseAuth.instance
                            .signOut()
                            .then((value) => print("Session Ended"));
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignPage()));
                      },
                      icon: Icon(
                        Icons.exit_to_app,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  updateUser(UserModel users, String photoURL){
    List<String> substring = List<String>();
    substring.add(" ");
    for(int i=0; i<users.name.length; i++){
      substring.add(users.name.substring(0,i+1));
    }
    DocumentReference ref = FirebaseFirestore.instance.collection("userInfo").doc(users.uid);
    Map<String,dynamic> data = {
      "caseSearch": substring,
      "description": users.description,
        "email": users.email,
        "full name": users.name,
        "lastSignIn": DateTime.now(),
      "photoURL": photoURL,
      "type": users.type,
        "uid": users.uid
    };
    ref.set(data).whenComplete((){
      print("success");
    });
  }
}