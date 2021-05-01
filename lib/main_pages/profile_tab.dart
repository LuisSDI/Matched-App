
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matched_app/main_pages/edit_profile.dart';
import 'package:matched_app/ui_resources/custom_colors.dart';

import 'apply_tab.dart';


class ProfileTab extends StatelessWidget {
  //UserBloc userBloc;

  @override
  Widget build(BuildContext context) {
    ScreenScaler scaler = ScreenScaler()..init(context);
    //User firebaseUser = FirebaseAuth.instance.currentUser;
    //userBloc = BlocProvider.of(context);
    final Stream<int> _dummy = (() async* {
      await Future<void>.delayed(const Duration(seconds: 1));
      yield 1;
      await Future<void>.delayed(const Duration(seconds: 1));
    })();
    return StreamBuilder(
              stream: _dummy,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.active) {
                  //DocumentSnapshot value = snapshot.data;
                  //Map<String, dynamic> data =value.data();
                  // UserApp user = UserApp(
                  //   name: data['full name'],
                  //   type: data['type'],
                  //   phone: data['phone'],
                  //   description: data['description'],
                  //   country: data['country'],
                  //   uid: data['uid'],
                  //   photoUrL: data['photoURL'],
                  //   email: data['email'],
                  // );
                  return profile(scaler,
                      //user,
                      context);
                } else {
                  return Scaffold(
                    body: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
              });
  }

  Widget profile(ScreenScaler scaler,
      //UserApp user,
      BuildContext context) {
    return SafeArea(
      top: false,
      child: Container(
        child: Padding(
          padding: EdgeInsets.only(
              left: scaler.getHeight(2), right: scaler.getHeight(2)),
          child: SingleChildScrollView(
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
                            "Profile,",
                            style: GoogleFonts.lato(
                                textStyle: TextStyle(
                                    fontSize: 36,
                                    color: Colors.black,
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
                                          //user: user,
                                        )));
                          },
                          icon: Icon(
                            MaterialCommunityIcons.account_edit,
                            color: Color(0xff6747CD),
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
                        child: Container(color: mainColor,)
                        // Image(
                        //   image: NetworkImage(user.photoUrL),
                        //   loadingBuilder: (BuildContext context, Widget child,
                        //       ImageChunkEvent loadingProgress) {
                        //     if (loadingProgress == null) return child;
                        //     return Container(
                        //       height: scaler.getWidth(40),
                        //       width: scaler.getWidth(40),
                        //       child: Center(
                        //         child: CircularProgressIndicator(
                        //           value: loadingProgress.expectedTotalBytes !=
                        //                   null
                        //               ? loadingProgress.cumulativeBytesLoaded /
                        //                   loadingProgress.expectedTotalBytes
                        //               : null,
                        //         ),
                        //       ),
                        //     );
                        //   },
                        // ),
                      ),
                    ),
                  ),
                ),
                //Name Field
                Padding(
                  padding: EdgeInsets.only(top: scaler.getHeight(2)),
                  child: Stack(children: [
                    Container(
                      height: scaler.getHeight(5),
                      width: scaler.getHeight(10),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Color(0xff6747CD), Color(0x8C3300D6)]),
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
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(right: scaler.getHeight(.5)),
                      alignment: Alignment.centerRight,
                      height: scaler.getHeight(5),
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xff6747CD),
                          ),
                          borderRadius: BorderRadius.circular(10)),
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: Text(
                          "Dummy",
                          //user.name,
                          textAlign: TextAlign.right,
                          style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
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
                      height: scaler.getHeight(5),
                      width: scaler.getHeight(10),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Color(0xff6747CD), Color(0x8C3300D6)]),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: FittedBox(
                          fit: BoxFit.cover,
                          child: Text(
                            'I am a ...',
                            style: GoogleFonts.lato(
                                textStyle: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(right: scaler.getHeight(.5)),
                      alignment: Alignment.centerRight,
                      height: scaler.getHeight(5),
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xff6747CD),
                          ),
                          borderRadius: BorderRadius.circular(10)),
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: Text("Dummy",
                          //user.type,
                          textAlign: TextAlign.right,
                          style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
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
                        height: scaler.getHeight(5),
                        alignment: Alignment(0, .5),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Color(0xff6747CD), Color(0x8C3300D6)]),
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
                      Container(
                        padding: EdgeInsets.only(left: scaler.getHeight(.5)),
                        alignment: Alignment.topLeft,
                        height: scaler.getHeight(20),
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Color(0xff6747CD),
                            ),
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: EdgeInsets.only(top: scaler.getHeight(5)),
                          child: Text(
                            "Dummy",
                            //user.description,
                            textAlign: TextAlign.left,
                            style: GoogleFonts.lato(
                                textStyle: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            )),
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
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Color(0xff6747CD), Color(0x8C3300D6)]),
                    ),
                    child: IconButton(
                      onPressed: () async {
                        //Signout
                        // await FirebaseAuth.instance
                        //     .signOut()
                        //     .then((value) => print("Sesion Cerrada"));
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
}
