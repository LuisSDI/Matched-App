import 'package:matched_app/login/create_profile_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matched_app/login/sign_in_content.dart';
import 'package:matched_app/login/sign_up_content.dart';
import 'package:matched_app/resources/arrow_button.dart';
import 'package:matched_app/ui_resources/custom_colors.dart';
import 'package:matched_app/ui_resources/icons/dorm_icon_icons.dart';
import 'package:matched_app/bloc/user_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:matched_app/main_pages/home_page.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:matched_app/resources/async_loader.dart';

class SignPage extends StatefulWidget {
  @override
  SignPageState createState() => SignPageState();
}

class SignPageState extends State<SignPage> {
  String email, password;
  UserBloc userBloc;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  GlobalKey<ScaffoldState> scaffkey = GlobalKey();
  Widget _myAnimatedWidget;
  bool isSignIn = true;
  final GlobalKey<State> keyLoader = new GlobalKey<State>();

  @override
  Widget build(BuildContext context) {
    return signInUI();
  }

  Widget signInUI() {
    ScreenScaler scaler = ScreenScaler()..init(context);
    if (isSignIn) {
      _myAnimatedWidget = SignInContent(this);
    }
    return Scaffold(
      key: scaffkey,
      backgroundColor: dark,
      body: Form(
        key: _formKey,
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,

              children: <Widget>[
                Container(
                    margin: EdgeInsets.only(
                        top: scaler.getHeight(5), bottom: scaler.getWidth(2)),
                    width: scaler.getWidth(30),
                    height: scaler.getWidth(30),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        gradient: turkish),
                    child: Container(
                      margin: EdgeInsets.only(
                        bottom: scaler.getWidth(0),
                        left: scaler.getWidth(2),
                        right: scaler.getWidth(1),
                        top: scaler.getWidth(3),
                      ),
                      color: Colors.transparent,
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: Icon(
                          DormIcon.noun_real_estate_network_1874757_1,
                          color: white,
                        ),
                      ),
                    )
                    // child: Image(
                    //   image:
                    //       AssetImage("assets/images_onboarding/rounded icon.png"),
                    // ),
                    ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      //Sign In Container
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: scaler.getWidth(8),
                            vertical: scaler.getWidth(2.5)),
                        height: scaler.getWidth(15),
                        width: scaler.getWidth(45),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              _myAnimatedWidget = SignInContent(this);
                              isSignIn = true;
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: isSignIn
                                    ? scaler.getWidth(0.5)
                                    : scaler.getWidth(0.9)),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: isSignIn
                                            ? whiteish
                                            : Colors.transparent,
                                        width: 2))),
                            child: FittedBox(
                                fit: BoxFit.contain,
                                child: Text(
                                  "Sign In",
                                  style: GoogleFonts.lato(
                                      textStyle: TextStyle(
                                          fontSize: 28,
                                          color: isSignIn ? white : whiteish,
                                          fontWeight: isSignIn
                                              ? FontWeight.bold
                                              : FontWeight.normal)),
                                )),
                          ),
                        ),
                      ),
                      //Sign Up Contanier
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: scaler.getWidth(8),
                            vertical: scaler.getWidth(2.5)),
                        height: scaler.getWidth(15),
                        width: scaler.getWidth(45),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              _myAnimatedWidget = SignUpContent(this);
                              isSignIn = false;
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: !isSignIn
                                    ? scaler.getWidth(0.5)
                                    : scaler.getWidth(0.9)),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: isSignIn
                                            ? Colors.transparent
                                            : whiteish,
                                        width: 2))),
                            child: FittedBox(
                                fit: BoxFit.contain,
                                child: Text(
                                  "Sign Up",
                                  style: GoogleFonts.lato(
                                      textStyle: TextStyle(
                                          fontSize: !isSignIn ? 28 : 20,
                                          color: !isSignIn ? white : whiteish,
                                          fontWeight: !isSignIn
                                              ? FontWeight.bold
                                              : FontWeight.normal)),
                                )),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                //Column of Sign In Content
                Container(
                  width: scaler.getWidth(100),
                  height: scaler.getHeight(60),
                  child: AnimatedSwitcher(
                    child: _myAnimatedWidget,
                    duration: Duration(milliseconds: 1600),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.all(scaler.getHeight(1)),
                ),
                ArrowButtom(
                  key: Key('1234'),
                  onTap: () {
                    isSignIn ? signIn(context) : signUp();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> signIn(BuildContext context) async {
    final formState = _formKey.currentState;
    if (formState.validate()) {
      formState.save();
      try {
        AsyncLoader.showLoadingDialog(context);
        userBloc = BlocProvider.of(context);
        Navigator.pop(context);
        userBloc.signIn(email, password).then((value) {
          if (value == null) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              duration: Duration(seconds: 3),
              content: Container(
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height * 0.05,
                child: Text(
                  userBloc.getError(),
                  style: GoogleFonts.lato(
                      textStyle: TextStyle(
                    fontSize: 14,
                  )),
                ),
              ),
            ));
            userBloc.resetError();
            Navigator.pop(context);
          } else {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => HomePage(identifier: email)));
          }
        });
      } catch (e) {
        print(e.message);
      }
    }

  }

  Future<void> signUp() async {
    final formState = _formKey.currentState;
    if (formState.validate()) {
      formState.save();
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => CreateProfilePage(
                    email: email,
                    password: password,
                    auth: FirebaseAuth.instance,
                  )));

    }
  }
}
