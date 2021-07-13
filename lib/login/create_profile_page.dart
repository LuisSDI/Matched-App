
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matched_app/bloc/user_bloc.dart';
import 'package:matched_app/main_pages/home_page.dart';
import 'package:matched_app/model/group.dart';
import 'package:matched_app/model/user.dart';
import 'package:matched_app/resources/arrow_button.dart';
import 'package:matched_app/ui_resources/custom_colors.dart';
import 'package:matched_app/ui_resources/textfield_styles.dart';

class CreateProfilePage extends StatefulWidget {
  UserBloc userBloc;
  FirebaseAuth auth;
  AuthCredential credential;
  String email;
  String password;
  final GlobalKey<State> keyLoader = new GlobalKey<State>();

  CreateProfilePage(
      {Key key, this.email, this.password,
        this.credential,
        this.auth
      })
      : super(key: key);
  @override
  _CreateProfilePageState createState() => _CreateProfilePageState();
}

class _CreateProfilePageState extends State<CreateProfilePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String dropdownCollege = 'Shaw';
  String name, studentID, description;
  String dropdownGender = 'Male';

  @override
  Widget build(BuildContext context) {
    ScreenScaler scaler = ScreenScaler()..init(context);
    return BlocProvider(
      bloc: UserBloc(),
      child: Scaffold(
        backgroundColor: dark,
          body: Form(
              key: _formKey,
              child: SingleChildScrollView(
                  child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(
                        left: scaler.getWidth(3), top: scaler.getWidth(7)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Container(
                            alignment: Alignment.center,
                            child: FittedBox(
                                fit: BoxFit.contain,
                                child: Icon(
                                  AntDesign.left,
                                  color: mainColor ,
                                  size: 30,
                                )),
                            width: scaler.getWidth(6),
                            height: scaler.getWidth(8),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: scaler.getWidth(4)),
                          height: scaler.getWidth(7),
                          child: FittedBox(
                              fit: BoxFit.contain,
                              child: Text(
                                'Create Profile',
                                style: GoogleFonts.lato(
                                    textStyle: TextStyle(
                                        fontSize: 31,
                                        fontWeight: FontWeight.bold,
                                    color: white)
                                ),
                              )),
                        ),
                        // Dont worry... Text
                        Container(
                          height: scaler.getWidth(10),
                          margin: EdgeInsets.only(
                              top: scaler.getWidth(1),
                              bottom: scaler.getWidth(1)),
                          child: FittedBox(
                              fit: BoxFit.contain,
                              child: Text(
                                """Dont worry...
  you can change this info later"""
                                    .trim(),
                                style: GoogleFonts.lato(
                                    textStyle: TextStyle(
                                        fontSize: 20,
                                        color: whiteish)),
                              )),
                        ),
                        // Full Name Text
                        Container(
                          height: scaler.getWidth(5),
                          margin: EdgeInsets.only(
                              top: scaler.getWidth(1),
                              bottom: scaler.getWidth(1)),
                          child: FittedBox(
                              fit: BoxFit.contain,
                              child: Text(
                                "Full Name",
                                style: GoogleFonts.lato(
                                    textStyle: TextStyle(
                                        fontSize: 20,
                                        color: white,
                                        fontWeight: FontWeight.bold)),
                              )),
                        ),
                        // Full Name TextField
                        Container(
                          width: scaler.getWidth(80),
                          height: scaler.getWidth(12),
                          child: TextFormField(
                            validator: (input) {
                              if (input.isEmpty) {
                                return 'Please type a name';
                              }
                            },
                            onSaved: (input) {
                              name = input;
                            },
                            style: GoogleFonts.lato(
                                textStyle: TextStyle(fontSize: 18,
                                color: white)),
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.only(left: scaler.getWidth(0.8)),
                              hintText: 'Aa',
                              hintStyle: GoogleFonts.lato(
                                  textStyle: TextStyle(
                                fontSize: 18,
                                    color: white
                              )),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      BorderSide(color:mainColor)),
                              focusColor: mainColor,
                              focusedBorder: textfieldBorder,
                              enabledBorder: textfieldBorder,
                            ),
                          ),
                        ),
                        // Student ID Text
                        // Container(
                        //   height: scaler.getWidth(5),
                        //   margin: EdgeInsets.only(
                        //       top: scaler.getWidth(1),
                        //       bottom: scaler.getWidth(1)),
                        //   child: FittedBox(
                        //       fit: BoxFit.contain,
                        //       child: Text(
                        //         "Student ID",
                        //         style: GoogleFonts.lato(
                        //             textStyle: TextStyle(
                        //                 fontSize: 20,
                        //                 color: white,
                        //                 fontWeight: FontWeight.bold)),
                        //       )),
                        // ),
                        // Full Name TextField
                        // Container(
                        //   width: scaler.getWidth(80),
                        //   height: scaler.getWidth(12),
                        //   child: TextFormField(
                        //     validator: (input) {
                        //       if (input.isEmpty) {
                        //         return 'Please type a name';
                        //       }
                        //     },
                        //     onSaved: (input) {
                        //       studentID = input;
                        //     },
                        //     style: GoogleFonts.lato(
                        //         textStyle: TextStyle(fontSize: 18,
                        //             color: white)),
                        //     decoration: InputDecoration(
                        //       contentPadding:
                        //       EdgeInsets.only(left: scaler.getWidth(0.8)),
                        //       hintText: 'Aa',
                        //       hintStyle: GoogleFonts.lato(
                        //           textStyle: TextStyle(
                        //               fontSize: 18,
                        //               color: white
                        //           )),
                        //       border: OutlineInputBorder(
                        //           borderRadius: BorderRadius.circular(10),
                        //           borderSide:
                        //           BorderSide(color:mainColor)),
                        //       focusColor: mainColor,
                        //       focusedBorder: textfieldBorder,
                        //       enabledBorder: textfieldBorder,
                        //     ),
                        //   ),
                        // ),
                        Row(
                          children: <Widget>[
                            // College Container
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                // College Text
                                Container(
                                  height: scaler.getWidth(5),
                                  margin: EdgeInsets.only(
                                      top: scaler.getWidth(1),
                                      bottom: scaler.getWidth(1)),
                                  child: FittedBox(
                                      fit: BoxFit.contain,
                                      child: Text(
                                        "Gender",
                                        style: GoogleFonts.lato(
                                            textStyle: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                            color: Colors.white),
                                      )),
                                ),
                                Container(
                                  width: scaler.getWidth(30),
                                  //height: scaler.getWidth(10),
                                  child: Theme(
                                    data: Theme.of(context).copyWith(
                                      canvasColor: dark,
                                    ),
                                    child: DropdownButtonFormField(
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.only(
                                            left: scaler.getWidth(3)),
                                        border: textfieldBorder,
                                        focusColor: mainColor,
                                        focusedBorder: textfieldBorder,
                                        enabledBorder:textfieldBorder,
                                      ),
                                      value: dropdownGender,
                                      icon: Icon(Icons.keyboard_arrow_down,color: mainColor,),
                                      iconSize: 24,
                                      elevation: 16,
                                      onChanged: (String newValue) {
                                        setState(() {
                                          print(newValue);
                                          dropdownGender = newValue;
                                        });
                                      },
                                      items: <String>[
                                        'Male',
                                        'Female',
                                      ].map<DropdownMenuItem<String>>(
                                              (String value) {
                                            return DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(
                                                  value,
                                                  style: GoogleFonts.lato(
                                                    textStyle: TextStyle(
                                                        fontSize: 16,
                                                        color: white),
                                                  ),
                                                ));
                                          }).toList(),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            // Number Container
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            // College Container
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                // College Text
                                Container(
                                  height: scaler.getWidth(5),
                                  margin: EdgeInsets.only(
                                      top: scaler.getWidth(1),
                                      bottom: scaler.getWidth(1)),
                                  child: FittedBox(
                                      fit: BoxFit.contain,
                                      child: Text(
                                        "College",
                                        style: GoogleFonts.lato(
                                            textStyle: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                         color: Colors.white),
                                      )),
                                ),
                                // I am a ... Field
                                Container(
                                  width: scaler.getWidth(30),
                                  //height: scaler.getWidth(10),
                                  child: Theme(
                                    data: Theme.of(context).copyWith(
                                      canvasColor: dark,
                                    ),
                                    child: DropdownButtonFormField(
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.only(
                                            left: scaler.getWidth(3)),
                                        border: textfieldBorder,
                                        focusColor: mainColor,
                                        focusedBorder: textfieldBorder,
                                        enabledBorder:textfieldBorder,
                                      ),
                                      value: dropdownCollege,
                                      icon: Icon(Icons.keyboard_arrow_down,color: mainColor,),
                                      iconSize: 24,
                                      elevation: 16,
                                      onChanged: (String newValue) {
                                        setState(() {
                                          print(newValue);
                                          dropdownCollege = newValue;
                                        });
                                      },
                                      items: <String>[
                                        'Shaw',
                                        'Muse',
                                        'Diligentia',
                                        'Harmonia'
                                      ].map<DropdownMenuItem<String>>(
                                          (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(
                                            value,
                                            style: GoogleFonts.lato(
                                                textStyle: TextStyle(
                                                    fontSize: 16,
                                                    color: white),
                                          ),
                                        ));
                                      }).toList(),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            // Number Container
                          ],
                        ),
                        // Personal Description Text
                        Container(
                          height: scaler.getWidth(5),
                          margin: EdgeInsets.only(
                              top: scaler.getWidth(1),
                              bottom: scaler.getWidth(1)),
                          child: FittedBox(
                              fit: BoxFit.contain,
                              child: Text(
                                "Personal Description",
                                style: GoogleFonts.lato(
                                    textStyle: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                color: white),
                              )),
                        ),
                        // Personal Description TextField
                        Container(
                          width: scaler.getWidth(80),
                          height: scaler.getWidth(40),
                          child: TextFormField(
                            validator: (input) {
                              if (input.isEmpty) {
                                return 'Please do not leave the field empty';
                              }
                            },
                            onSaved: (input) {
                              description = input;
                              print(description);
                            },
                            maxLines: 5,
                            keyboardType: TextInputType.multiline,
                            style: GoogleFonts.lato(
                                textStyle: TextStyle(fontSize: 18,
                                color: white)),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(
                                  left: scaler.getWidth(1),
                                  top: scaler.getWidth(1)),
                              hintText: 'Aa',
                              hintStyle: GoogleFonts.lato(
                                  textStyle: TextStyle(
                                fontSize: 18,
                                    color: white
                              )),
                              border: textfieldBorder,
                              focusColor: mainColor,
                              focusedBorder:textfieldBorder,
                              enabledBorder: textfieldBorder,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ArrowButtom(
                    key: Key('1234'),
                    onTap: () async {
                      registerUser();
                             Navigator.pushReplacement(
                          context,
             MaterialPageRoute(
                 builder: (context) => HomePage()));
                    },
                  )
                ],
              )))),
    );
  }

  Future<void> registerUser() async {
    {
      final formState = _formKey.currentState;
      widget.userBloc = BlocProvider.of<UserBloc>(context);
      UserCredential authResult;
      User firebaseUser;
      if (formState.validate()) {
        formState.save();
        try {
          print(widget.credential);
          if (widget.credential != null) {
            authResult =
            await widget.userBloc.signInCredential(widget.credential);
            firebaseUser = authResult.user;
          } else {
            firebaseUser =
            await widget.userBloc.signUp(widget.email, widget.password);
          }
          List<String> groups = [];
          GroupModel group = await widget.userBloc.searchGroup('General');
          print(group.groupId);
          groups.add(group.groupId);
          UserModel user = UserModel(
              email: firebaseUser.email,
              gender: dropdownGender,
              name: name,
              personality: 'None',
              photoUrL: (firebaseUser.photoURL == null)
                  ? 'https://firebasestorage.googleapis.com/v0/b/matched-app-9cb6a.appspot.com/o/default_photo.png?alt=media&token=0fd6fc78-4558-4731-a707-d8068bae2069'
                  : firebaseUser.photoURL,
              uid: firebaseUser.uid,
              description: description,
              groups: groups,
              type: dropdownCollege);
          widget.userBloc.setUserData(user);
          widget.userBloc.addToGroup(firebaseUser.uid, group.groupId);
          print("Funciona");
        } catch (e) {
          print(e.message);
          Navigator.of(context).pop();
        }
      }
    }
  }
}

