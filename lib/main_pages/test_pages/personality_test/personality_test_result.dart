import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matched_app/bloc/user_bloc.dart';
import 'package:matched_app/main_pages/home_page.dart';
import 'package:matched_app/main_pages/test_pages/personality_test/personality_test_info.dart';
import 'package:matched_app/model/personality_result.dart';
import 'package:matched_app/model/user.dart';
import 'package:matched_app/resources/versus_percent_bar.dart';
import 'package:matched_app/ui_resources/custom_colors.dart';

class PersonalityTestResult extends StatelessWidget {
  const PersonalityTestResult({Key key, this.results}) : super(key: key);
  final List<int> results;

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
            PersonalityResult personalityResult =
                calculatePersonality(results, user);
            return FutureBuilder(
              future: userBloc.sendPersonalityResult(user, personalityResult),
              builder: (context, snapshot) {
                print('Here 2');
                print(snapshot.connectionState);
                if (snapshot.connectionState == ConnectionState.none) {
                  print('Here 3');
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
                                          Navigator.pushReplacement(
                                              context, MaterialPageRoute(builder: (context) => HomePage(
                                          currentIndex: 3,)));
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

  //TODO Find a smarter way to do it
  PersonalityResult calculatePersonality(
      List<int> answers, UserModel userModel) {
    int eScore = 0;
    int iScore = 0;
    int sScore = 0;
    int nScore = 0;
    int tScore = 0;
    int fScore = 0;
    int jScore = 0;
    int pScore = 0;
    String personality = '';
    for (var i = 0; i < answers.length; i++) {
      switch (i) {
        case 0:
          {
            if (answers[i] == 0) {
              jScore += 2;
            } else {
              pScore += 2;
            }
            break;
          }

        case 1:
          {
            if (answers[i] == 0) {
              sScore += 2;
            } else {
              nScore += 2;
            }
            break;
          }

        case 2:
          {
            if (answers[i] == 0) {
              eScore += 2;
            } else {
              iScore += 2;
            }
            break;
          }

        case 3:
          {
            if (answers[i] == 0) {
              fScore += 1;
            } else {
              tScore += 2;
            }
            break;
          }

        case 4:
          {
            if (answers[i] == 1) {
              sScore += 1;
            } else {
              nScore += 1;
            }
            break;
          }

        case 5:
          {
            if (answers[i] == 0) {
              eScore += 2;
            } else {
              iScore += 1;
            }
            break;
          }

        case 6:
          {
            if (answers[i] == 0) {
              jScore += 1;
            } else {
              pScore += 1;
            }
            break;
          }

        case 7:
          {
            if (answers[i] == 0) {
              jScore += 1;
            } else {
              pScore += 2;
            }
            break;
          }

        case 8:
          {
            if (answers[i] == 0) {
              eScore += 2;
            } else {
              iScore += 1;
            }
            break;
          }

        case 9:
          {
            if (answers[i] == 1) {
              sScore += 1;
            } else {
              nScore += 2;
            }
            break;
          }

        case 10:
          {
            if (answers[i] == 0) {
              jScore += 2;
            } else {
              pScore += 1;
            }
            break;
          }

        case 11:
          {
            if (answers[i] == 1) {
              sScore += 1;
            } else {
              nScore += 2;
            }
            break;
          }

        case 12:
          {
            if (answers[i] == 0) {
              eScore += 1;
            } else {
              iScore += 2;
            }
            break;
          }

        case 13:
          {
            if (answers[i] == 0) {
              fScore += 1;
            } else {
              tScore += 2;
            }
            break;
          }

        case 14:
          {
            if (answers[i] == 1) {
              sScore += 1;
            } else {
              nScore += 0;
            }
            break;
          }

        case 15:
          {
            if (answers[i] == 0) {
              eScore += 2;
            } else {
              iScore += 2;
            }
            break;
          }

        case 16:
          {
            if (answers[i] == 0) {
              jScore += 2;
            } else {
              pScore += 2;
            }
            break;
          }

        case 17:
          {
            if (answers[i] == 0) {
              jScore += 1;
            } else {
              pScore += 1;
            }
            break;
          }

        case 18:
          {
            if (answers[i] == 0) {
              jScore += 1;
            } else {
              pScore += 1;
            }
            break;
          }

        case 19:
          {
            if (answers[i] == 0) {
              sScore += 2;
            } else {
              nScore += 2;
            }
            break;
          }

        case 20:
          {
            if (answers[i] == 0) {
              eScore += 2;
            } else {
              iScore += 2;
            }
            break;
          }

        case 21:
          {
            if (answers[i] == 0) {
              fScore += 1;
            } else {
              tScore += 2;
            }
            break;
          }

        case 22:
          {
            if (answers[i] == 1) {
              sScore += 2;
            } else {
              nScore += 1;
            }
            break;
          }

        case 23:
          {
            if (answers[i] == 0) {
              eScore += 1;
            } else {
              iScore += 1;
            }
            break;
          }

        case 24:
          {
            List<String> splitans = answers[i].toString().split('');
            for (var j = 0; j < splitans.length; j++) {
              if (splitans[j] == '1') {
                jScore += 1;
              } else if (splitans[j] == '2') {
                pScore += 1;
              } else if (splitans[j] == '3') {
                jScore += 0;
              }
            }

            break;
          }

        case 25:
          {
            if (answers[i] == 0) {
              eScore += 1;
            } else {
              iScore += 0;
            }
            break;
          }

        case 26:
          {
            if (answers[i] == 0) {
              jScore += 2;
            } else {
              pScore += 2;
            }
            break;
          }

        case 27:
          {
            if (answers[i] == 0) {
              sScore += 2;
            } else {
              nScore += 2;
            }
            break;
          }

        case 28:
          {
            if (answers[i] == 1) {
              eScore += 2;
            } else {
              iScore += 2;
            }
            break;
          }

        case 29:
          {
            if (answers[i] == 0) {
              tScore += 2;
            } else {
              fScore += 1;
            }
            break;
          }

        case 30:
          {
            if (answers[i] == 1) {
              sScore += 2;
            } else {
              nScore += 1;
            }
            break;
          }

        case 31:
          {
            if (answers[i] == 0) {
              tScore += 1;
            } else {
              fScore += 1;
            }
            break;
          }

        case 32:
          {
            if (answers[i] == 1) {
              tScore += 2;
            } else {
              fScore += 0;
            }
            break;
          }

        case 33:
          {
            if (answers[i] == 0) {
              jScore += 2;
            } else {
              pScore += 2;
            }
            break;
          }

        case 34:
          {
            if (answers[i] == 0) {
              sScore += 2;
            } else {
              nScore += 1;
            }
            break;
          }

        case 35:
          {
            if (answers[i] == 1) {
              eScore += 2;
            } else {
              iScore += 1;
            }
            break;
          }

        case 36:
          {
            if (answers[i] == 0) {
              tScore += 1;
            } else {
              fScore += 2;
            }
            break;
          }

        case 37:
          {
            if (answers[i] == 1) {
              sScore += 2;
            } else {
              nScore += 0;
            }
            break;
          }

        case 38:
          {
            if (answers[i] == 0) {
              tScore += 1;
            } else {
              fScore += 1;
            }
            break;
          }

        case 39:
          {
            if (answers[i] == 1) {
              tScore += 2;
            } else {
              fScore += 1;
            }
            break;
          }

        case 40:
          {
            if (answers[i] == 0) {
              jScore += 2;
            } else {
              pScore += 2;
            }
            break;
          }

        case 41:
          {
            if (answers[i] == 0) {
              sScore += 1;
            } else {
              nScore += 2;
            }
            break;
          }

        case 42:
          {
            if (answers[i] == 1) {
              eScore += 1;
            } else {
              iScore += 1;
            }
            break;
          }

        case 43:
          {
            if (answers[i] == 0) {
              tScore += 1;
            } else {
              fScore += 2;
            }
            break;
          }

        case 44:
          {
            if (answers[i] == 1) {
              sScore += 2;
            } else {
              nScore += 0;
            }
            break;
          }

        case 45:
          {
            if (answers[i] == 0) {
              tScore += 2;
            } else {
              fScore += 0;
            }
            break;
          }

        case 46:
          {
            if (answers[i] == 1) {
              tScore += 2;
            } else {
              fScore += 1;
            }
            break;
          }

        case 47:
          {
            if (answers[i] == 0) {
              sScore += 1;
            } else {
              nScore += 1;
            }
            break;
          }

        case 48:
          {
            if (answers[i] == 0) {
              tScore += 2;
            } else {
              fScore += 1;
            }
            break;
          }

        case 49:
          {
            if (answers[i] == 0) {
              tScore += 2;
            } else {
              fScore += 0;
            }
            break;
          }

        default:
          {
            print("Invalid list of answers");
            print(answers);
          }
          break;
      }
    }
    if (eScore > iScore) {
      personality += 'E';
    } else {
      personality += 'I';
    }
    if (sScore > nScore) {
      personality += 'S';
    } else {
      personality += 'N';
    }
    if (tScore > fScore) {
      personality += 'T';
    }
    else if (tScore == fScore) {
      if (userModel.gender == 'Male') {
        personality += 'T';
      } else {
        personality += 'F';
      }
    } else {
      personality += 'F';
    }
    if (jScore > pScore) {
      personality += 'J';
    } else {
      personality += 'P';
    }

    print('E: + $eScore');
    print('I: + $iScore');
    print('S: + $sScore');
    print('N: + $nScore');
    print('T: + $tScore');
    print('F: + $fScore');
    print('J: + $jScore');
    print('P: + $pScore');
    PersonalityResult personalityResult = PersonalityResult(
        eScore: eScore,
        iScore: iScore,
        sScore: sScore,
        nScore: nScore,
        tScore: tScore,
        fScore: fScore,
        jScore: jScore,
        pScore: pScore,
        personality: personality);
    return personalityResult;
  }
}
