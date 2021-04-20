import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matched_app/login/sign_page.dart';
import 'package:matched_app/ui_resources/custom_colors.dart';
import 'create_profile_page.dart';

class SignInContent extends StatefulWidget {
  SignPageState parent;
  SignInContent(this.parent);
  @override
  _SignInContentState createState() => _SignInContentState();
}

class _SignInContentState extends State<SignInContent> {
  //UserBloc userBloc;
  @override
  Widget build(BuildContext context) {
    ScreenScaler scaler = ScreenScaler()..init(context);
    //Column of Sign In Content
    return Padding(
      padding:
          EdgeInsets.only(left: scaler.getWidth(7), right: scaler.getWidth(7)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Welcome Back Text
          Container(
            height: scaler.getWidth(7),
            child: FittedBox(
                fit: BoxFit.contain,
                child: Text(
                  'Welcome Back,',
                  style: GoogleFonts.lato(
                      textStyle: TextStyle(
                          fontSize: 31,
                          color: white,
                          fontWeight: FontWeight.bold)),
                )),
          ),
          //Sign in to continue Text
          Container(
            height: scaler.getWidth(4),
            margin: EdgeInsets.only(
                top: scaler.getWidth(1), bottom: scaler.getWidth(7.5)),
            child: FittedBox(
                fit: BoxFit.contain,
                child: Text(
                  'Sign in to continue',
                  style: GoogleFonts.lato(
                      textStyle: TextStyle(fontSize: 20, color: whiteish)),
                )),
          ),
          // Email TextField
          Container(
            width: scaler.getWidth(80),
            height: scaler.getWidth(5),
            margin: EdgeInsets.only(bottom: scaler.getWidth(6.5)),
            child: TextFormField(
              validator: (input) {
                if (input.isEmpty) {
                  return 'Please type an email';
                }
              },
              onSaved: (input) {
                this.widget.parent.setState(() {
                  this.widget.parent.email = input;
                });
              },
              style: TextStyle(fontSize: 18, color: whiteish),
              decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: whiteish,
                    ),
                  ),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                    color: whiteish,
                  )),
                  hintText: 'Email address',
                  hintStyle: GoogleFonts.lato(
                      textStyle: TextStyle(
                    fontSize: 18,
                    color: whiteish,
                  ))),
            ),
          ),
          // Password TextField
          Container(
            width: scaler.getWidth(80),
            height: scaler.getWidth(5),
            child: TextFormField(
              validator: (input) {
                if (input.length < 6) {
                  return 'Your password needs to be at least 6 characters';
                }
              },
              onSaved: (input) {
                this.widget.parent.setState(() {
                  this.widget.parent.password = input;
                });
              },
              obscureText: true,
              style: TextStyle(fontSize: 18, color: whiteish),
              decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: whiteish,
                    ),
                  ),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                    color: whiteish,
                  )),
                  hintText: 'Password',
                  hintStyle: TextStyle(fontSize: 18, color: whiteish)),
            ),
          ),
          // Facebook and Google Icons
          Row(
            children: <Widget>[
              //FACEBOOK
              GestureDetector(
                onTap: () async {
                  // userBloc = BlocProvider.of(context);
                  // AuthCredential credential =
                  //     await userBloc.credentialFacebook();
                  // AuthResult authResult =
                  //     await userBloc.signInCredential(credential);
                  // if (authResult.additionalUserInfo.isNewUser) {
                  //   authResult.user.delete();
                  //   Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //           builder: (context) => CreateProfilePage(
                  //                 auth: FirebaseAuth.instance,
                  //                 credential: credential,
                  //               )));
                  // } else {
                  //   Navigator.pushReplacement(context,
                  //       MaterialPageRoute(builder: (context) => HomePage()));
                  // }
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CreateProfilePage(
                              // auth: FirebaseAuth.instance,
                              // credential: credential,
                              )));
                },
                child: Container(
                  margin: EdgeInsets.only(
                    top: scaler.getWidth(3),
                  ),
                  alignment: Alignment.center,
                  child: FittedBox(
                      fit: BoxFit.contain,
                      child: Icon(
                        FontAwesome.facebook,
                        color: white,
                        size: 35,
                      )),
                  width: scaler.getWidth(10),
                  height: scaler.getWidth(10),
                ),
              ), // GOOGLE
              GestureDetector(
                onTap: () async {
                  // userBloc = BlocProvider.of(context);
                  // AuthCredential credential =
                  //     await userBloc.credentialGoogle();
                  // AuthResult authResult =
                  //     await userBloc.signInCredential(credential);
                  // if (authResult.additionalUserInfo.isNewUser) {
                  //   authResult.user.delete();
                  //   Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //           builder: (context) => CreateProfilePage(
                  //                 auth: FirebaseAuth.instance,
                  //                 credential: credential,
                  //               )));
                  // } else {
                  //   Navigator.pushReplacement(context,
                  //       MaterialPageRoute(builder: (context) => HomePage()));
                  // }
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CreateProfilePage(
                              // auth: FirebaseAuth.instance,
                              // credential: credential,
                              )));
                },
                child: Container(
                  margin: EdgeInsets.only(
                    top: scaler.getWidth(3),
                  ),
                  alignment: Alignment.center,
                  child: FittedBox(
                      fit: BoxFit.contain,
                      child: Icon(
                        FontAwesome.google,
                        color: white,
                        size: 35,
                      )),
                  width: scaler.getWidth(10),
                  height: scaler.getWidth(10),
                ),
              ),
            ],
          ),
          SizedBox(
            height: scaler.getWidth(10),
          ),
          // Forgot password Text
          Container(
            alignment: Alignment.centerLeft,
            height: scaler.getWidth(4),
            margin: EdgeInsets.only(bottom: scaler.getWidth(3.5)),
            child: FittedBox(
                fit: BoxFit.contain,
                child: Text(
                  'Forgot password?',
                  style: GoogleFonts.lato(
                      textStyle:
                          TextStyle(fontSize: 16, color: whiteish)),
                )),
          ),
        ],
      ),
    );
  }
}
