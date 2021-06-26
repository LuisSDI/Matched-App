import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matched_app/bloc/user_bloc.dart';
import 'package:matched_app/main_pages/test_pages/personality_test/personality_test_info.dart';
import 'package:matched_app/model/personality_result.dart';
import 'package:matched_app/model/user.dart';
import 'package:matched_app/resources/versus_percent_bar.dart';
import 'package:matched_app/ui_resources/custom_colors.dart';

class PersonalityTestResultFixed extends StatelessWidget {
  const PersonalityTestResultFixed({Key key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenScaler scaler = ScreenScaler()..init(context);
    UserBloc userBloc = BlocProvider.of(context);
    return BlocProvider(
      bloc: userBloc,
      child: FutureBuilder(
        future: userBloc.getUserData(FirebaseAuth.instance.currentUser.uid),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            print('Here 1');
            UserModel user = snapshot.data;
            return FutureBuilder(
              future: userBloc.getPersonalityResult(user.uid),
              builder: (context, snapshot) {
                print('Here 2');
                print(snapshot.connectionState);
                print(snapshot.data);
                if (snapshot.connectionState == ConnectionState.done) {
                  print('Here 3');
                  PersonalityResult personalityResult = snapshot.data;
                  Map<String, String> personalityIntro =
                      PersonalityTestInfo().personalityIntro;
                  Map<String, String> personalityName =
                      PersonalityTestInfo().personalityName;
                  Map<String, String> personalityRoles =
                      PersonalityTestInfo().personalityRoles;
                  Map<String, String> personalityDesc =
                      PersonalityTestInfo().personalityDesc;
                  Map<String, String> personalityIconsPath =
                      PersonalityTestInfo().personalityIconsPath;
                  List<List<String>> pairValues =
                      PersonalityTestInfo().pairValues;
                  List<List<int>> pairScores = [
                    [personalityResult.iScore, personalityResult.eScore],
                    [personalityResult.sScore, personalityResult.nScore],
                    [personalityResult.tScore, personalityResult.fScore],
                    [personalityResult.jScore, personalityResult.pScore]
                  ];
                  return Scaffold(
                    backgroundColor: dark,
                    bottomNavigationBar: Container(
                      height: scaler.getHeight(10),
                      decoration: BoxDecoration(
                          gradient: turkish),
                    ),
                    body: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                top: scaler.getHeight(3),
                                bottom: scaler.getHeight(1.5)),
                            child: Stack(
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    '${personalityResult.personality} - ${personalityName[personalityResult.personality]}',
                                    style: GoogleFonts.lato(
                                        textStyle: TextStyle(
                                            fontSize: 36,
                                            color: white,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ),
                                Row(
                                  children: <Widget>[
                                    //Buttom for back
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      child: IconButton(
                                        icon: Icon(
                                          Ionicons.ios_arrow_back,
                                          color: mainColor,
                                          size: 30,
                                        ),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: scaler.getWidth(90),
                            height: scaler.getWidth(45),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: scaler.getWidth(45),
                                  alignment: Alignment.center,
                                  child: Stack(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            gradient: turkish),
                                        height: scaler.getWidth(45),
                                        width: scaler.getWidth(45),
                                      ),
                                      Align(
                                        alignment: Alignment.center,
                                        child: Container(
                                          width: scaler.getWidth(32) ,
                                          height: scaler.getWidth(32),

                                          child: Image(
                                            image: AssetImage(personalityIconsPath[personalityResult.personality]),
                                            fit: BoxFit.contain,
                                            //width: scaler.getWidth(110),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Expanded(
                                    child: Container(

                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            child: Text(
                                              '${personalityName[personalityResult.personality]}',
                                              style: GoogleFonts.lato(
                                                  textStyle: TextStyle(
                                                      fontSize: 30,
                                                      color: white,
                                                      fontWeight: FontWeight.bold)),
                                            ),
                                          ),
                                          Container(
                                            child: RichText(
                                                text: TextSpan(
                                                  text: 'Role: ',
                                                  style: GoogleFonts.lato(
                                                      textStyle: TextStyle(
                                                          fontSize: 14,
                                                          color: white,
                                                          fontWeight: FontWeight.normal)),
                                                  children: [
                                                    TextSpan(
                                                      text:
                                                      '${personalityRoles[personalityResult.personality]}',
                                                      style: GoogleFonts.lato(
                                                          textStyle: TextStyle(
                                                              fontSize: 16,
                                                              color: white,
                                                              fontWeight:
                                                              FontWeight.bold)),
                                                    )
                                                  ],
                                                )),
                                          ),
                                          Container(
                                            margin: EdgeInsets.symmetric(
                                                horizontal: scaler.getWidth(scaler.getWidth(.125),),
                                                vertical: scaler.getWidth(1)),
                                            child: Text(
                                              '"${personalityIntro[personalityResult.personality]}"',
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.lato(
                                                  textStyle: TextStyle(
                                                      fontSize: 16,
                                                      color: white,
                                                      fontStyle: FontStyle.italic,
                                                      fontWeight: FontWeight.normal)),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ))
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              //Title Text
                              Container(
                                height: scaler.getHeight(5),
                                width: scaler.getWidth(80),
                                alignment: Alignment.center,
                                child: Text(
                                  'Overview',
                                  style: GoogleFonts.lato(
                                      textStyle: TextStyle(
                                          fontSize: 36,
                                          color: white,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.all(scaler.getWidth(2)),
                            child: Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                personalityDesc[personalityResult.personality],
                                style: GoogleFonts.lato(
                                    textStyle: TextStyle(
                                        fontSize: 16,
                                        color: white,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                          ),
                          ListView.builder(
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.all(scaler.getHeight(1)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Center(
                                        child: VersusPercentBar(
                                          names: pairValues[index],
                                          scores: pairScores[index],
                                        )),
                                  ],
                                ),
                              );
                            },
                            itemCount: pairValues.length,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.zero,
                          ),

                        ],
                      ),
                    ),
                  );
                } else {
                  return Scaffold(
                    backgroundColor: dark,
                    body: Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(mainColor),
                      ),
                    ),
                  );
                }
              },
            );
          } else {
            return Scaffold(
              backgroundColor: dark,
              body: Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(mainColor),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}