import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matched_app/model/personality_result.dart';
import 'package:matched_app/ui_resources/custom_colors.dart';

class PersonalityTestResult extends StatelessWidget {
  const PersonalityTestResult({Key key, this.results}) : super(key: key);
  final List<int> results;

  @override
  Widget build(BuildContext context) {
    PersonalityResult personalityResult = calculatePersonality(results);
    return Scaffold(
      backgroundColor: dark,
      body: Center(
        child: Text(personalityResult.personality,
        style: GoogleFonts.lato(
          fontSize: 20,
          color: white
        )),
      ),
    );
  }

  //TODO Find a smarter way to do it
  //TODO Incorporate the User for the Gender
  PersonalityResult calculatePersonality(List<int> answers) {
    int eScore=0;
    int iScore=0;
    int sScore=0;
    int nScore=0;
    int tScore=0;
    int fScore=0;
    int jScore=0;
    int pScore=0;
    String personality = '';
    for (var i = 0; i < answers.length; i++) {
      switch (i) {
        case 0:
          {
            if (answers[i] == 0)
            {
              jScore+=2;
            }
            else
            {
              pScore+=2;
            }
            break;
          }

        case 1:
          {
            if (answers[i] == 0)
            {
              sScore +=2;
            }
            else
            {
              nScore+=2;
            }
            break;
          }

        case 2:
          {
            if (answers[i] == 0)
            {
              eScore+=2;
            }
            else
            {
              iScore+=2;
            }
            break;
          }

        case 3:
          {
            if (answers[i] == 0)
            {
              fScore+=1;
            }
            else
            {
              tScore+=2;
            }
            break;
          }

        case 4:
          {
            if (answers[i] == 1)
            {
              sScore +=1;
            }
            else
            {
              nScore+=1;
            }
            break;
          }

        case 5:
          {
            if (answers[i] == 0)
            {
              eScore+=2;
            }
            else
            {
              iScore+=1;
            }
            break;
          }

        case 6:
          {
            if (answers[i] == 0)
            {
              jScore+=1;
            }
            else
            {
              pScore+=1;
            }
            break;
          }

        case 7:
          {
            if (answers[i] == 0)
            {
              jScore+=1;
            }
            else
            {
              pScore+=2;
            }
            break;
          }

        case 8:
          {
            if (answers[i] == 0)
            {
              eScore+=2;
            }
            else
            {
              iScore+=1;
            }
            break;
          }

        case 9:
          {
            if (answers[i] == 1)
            {
              sScore +=1;
            }
            else
            {
              nScore+=2;
            }
            break;
          }

        case 10:
          {
            if (answers[i] == 0)
            {
              jScore+=2;
            }
            else
            {
              pScore+=1;
            }
            break;
          }

        case 11:
          {
            if (answers[i] == 1)
            {
              sScore +=1;
            }
            else
            {
              nScore+=2;
            }
            break;
          }

        case 12:
          {
            if (answers[i] == 0)
            {
              eScore+=1;
            }
            else
            {
              iScore+=2;
            }
            break;
          }

        case 13:
          {
            if (answers[i] == 0)
            {
              fScore+=1;
            }
            else
            {
              tScore+=2;
            }
            break;
          }

        case 14:
          {
            if (answers[i] == 1)
            {
              sScore +=1;
            }
            else
            {
              nScore+=0;
            }
            break;
          }

        case 15:
          {
            if (answers[i] == 0)
            {
              eScore+=2;
            }
            else
            {
              iScore+=2;
            }
            break;
          }

        case 16:
          {
            if (answers[i] == 0)
            {
              jScore+=2;
            }
            else
            {
              pScore+=2;
            }
            break;
          }

        case 17:
          {
            if (answers[i] == 0)
            {
              jScore+=1;
            }
            else
            {
              pScore+=1;
            }
            break;
          }

        case 18:
          {
            if (answers[i] == 0)
            {
              jScore+=1;
            }
            else
            {
              pScore+=1;
            }
            break;
          }

        case 19:
          {
            if (answers[i] == 0)
            {
              sScore +=2;
            }
            else
            {
              nScore+=2;
            }
            break;
          }

        case 20:
          {
            if (answers[i] == 0)
            {
              eScore+=2;
            }
            else
            {
              iScore+=2;
            }
            break;
          }

        case 21:
          {
            if (answers[i] == 0)
            {
              fScore+=1;
            }
            else
            {
              tScore+=2;
            }
            break;
          }

        case 22:
          {
            if (answers[i] == 1)
            {
              sScore +=2;
            }
            else
            {
              nScore+=1;
            }
            break;
          }

        case 23:
          {
            if (answers[i] == 0)
            {
              eScore+=1;
            }
            else
            {
              iScore+=1;
            }
            break;
          }

        case 24:
          {
            List<String> splitans = answers[i].toString().split('');
            for(var j = 0 ; j < splitans.length ; j++)
            {
              if (splitans[j] == '1') {
                jScore+=1;
              }
              else if ( splitans[j] == '2') {
                pScore+=1;
              }
              else if (splitans[j] == '3') {
                jScore+=0;
              }
            }

            break;
          }

        case 25:
          {
            if (answers[i] == 0)
            {
              eScore+=1;
            }
            else
            {
              iScore+=0;
            }
            break;
          }

        case 26:
          {
            if (answers[i] == 0)
            {
              jScore+=2;
            }
            else
            {
              pScore+=2;
            }
            break;
          }

        case 27:
          {
            if (answers[i] == 0)
            {
              sScore +=2;
            }
            else
            {
              nScore+=2;
            }
            break;
          }

        case 28:
          {
            if (answers[i] == 1)
            {
              eScore+=2;
            }
            else
            {
              iScore+=2;
            }
            break;
          }

        case 29:
          {
            if (answers[i] == 0)
            {
              tScore+=2;
            }
            else
            {
              fScore+=1;
            }
            break;
          }

        case 30:
          {
            if (answers[i] == 1)
            {
              sScore +=2;
            }
            else
            {
              nScore+=1;
            }
            break;
          }

        case 31:
          {
            if (answers[i] == 0)
            {
              tScore+=1;
            }
            else
            {
              fScore+=1;
            }
            break;
          }

        case 32:
          {
            if (answers[i] == 1)
            {
              tScore+=2;
            }
            else
            {
              fScore+=0;
            }
            break;
          }

        case 33:
          {
            if (answers[i] == 0)
            {
              jScore+=2;
            }
            else
            {
              pScore+=2;
            }
            break;
          }

        case 34:
          {
            if (answers[i] == 0)
            {
              sScore+=2;
            }
            else
            {
              nScore+=1;
            }
            break;
          }

        case 35:
          {
            if (answers[i] == 1)
            {
              eScore+=2;
            }
            else
            {
              iScore+=1;
            }
            break;
          }

        case 36:
          {
            if (answers[i] == 0)
            {
              tScore+=1;
            }
            else
            {
              fScore+=2;
            }
            break;
          }

        case 37:
          {
            if (answers[i] == 1)
            {
              sScore+=2;
            }
            else
            {
              nScore+=0;
            }
            break;
          }

        case 38:
          {
            if (answers[i] == 0)
            {
              tScore+=1;
            }
            else
            {
              fScore+=1;
            }
            break;
          }

        case 39:
          {
            if (answers[i] == 1)
            {
              tScore+=2;
            }
            else
            {
              fScore+=1;
            }
            break;
          }

        case 40:
          {
            if (answers[i] == 0)
            {
              jScore+=2;
            }
            else
            {
              pScore+=2;
            }
            break;
          }

        case 41:
          {
            if (answers[i] == 0)
            {
              sScore+=1;
            }
            else
            {
              nScore+=2;
            }
            break;
          }

        case 42:
          {
            if (answers[i] == 1)
            {
              eScore+=1;
            }
            else
            {
              iScore+=1;
            }
            break;
          }

        case 43:
          {
            if (answers[i] == 0)
            {
              tScore+=1;
            }
            else
            {
              fScore+=2;
            }
            break;
          }

        case 44:
          {
            if (answers[i] == 1)
            {
              sScore+=2;
            }
            else
            {
              nScore+=0;
            }
            break;
          }

        case 45:
          {
            if (answers[i] == 0)
            {
              tScore+=2;
            }
            else
            {
              fScore+=0;
            }
            break;
          }

        case 46:
          {
            if (answers[i] == 1)
            {
              tScore+=2;
            }
            else
            {
              fScore+=1;
            }
            break;
          }

        case 47:
          {
            if (answers[i] == 0)
            {
              sScore+=1;
            }
            else
            {
              nScore+=1;
            }
            break;
          }

        case 48:
          {
            if (answers[i] == 0)
            {
              tScore+=2;
            }
            else
            {
              fScore+=1;
            }
            break;
          }

        case 49:
          {
            if (answers[i] == 0)
            {
              tScore+=2;
            }
            else
            {
              fScore+=0;
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
      personality+='E';
    } else {
      personality+='I';
    }
    if (sScore > nScore) {
      personality+='S';
    } else {
      personality+='N';
    }
    //TODO Include Gender Tie Breaker
    if (tScore > fScore) {
      personality+='T';
    } else {
      personality+='F';
    }
    if (tScore > fScore) {
      personality+='J';
    } else {
      personality+='P';
    }
    PersonalityResult personalityResult = PersonalityResult(eScore: eScore, iScore: iScore, sScore: sScore, nScore: nScore, tScore: tScore, fScore: fScore, jScore: jScore, pScore: pScore, personality: personality);
    return personalityResult;
  }
}
