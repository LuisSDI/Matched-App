import 'package:flutter/material.dart';
import 'package:matched_app/model/personality_result.dart';

class PersonalityTestResult extends StatelessWidget {
  const PersonalityTestResult({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  //TODO Find a smarter way to do it
  PersonalityResult calculatePersonality(List<int> anwsers) {
    int eScore=0;
    int iScore=0;
    int sScore=0;
    int nScore=0;
    int tScore=0;
    int fScore=0;
    int jScore=0;
    int pScore=0;
    String personality = '';
    for (var i = 0; i < anwsers.length; i++) {
      switch (i) {
        case 0:
          {
            if (anwsers[i] == 0)
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
            if (anwsers[i] == 0)
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
            if (anwsers[i] == 0)
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
            if (anwsers[i] == 0)
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
            if (anwsers[i] == 1)
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
            if (anwsers[i] == 0)
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
            if (anwsers[i] == 0)
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
            if (anwsers[i] == 0)
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
            if (anwsers[i] == 0)
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
            if (anwsers[i] == 1)
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
            if (anwsers[i] == 0)
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
            if (anwsers[i] == 1)
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
            if (anwsers[i] == 0)
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
            if (anwsers[i] == 0)
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
            if (anwsers[i] == 1)
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
            if (anwsers[i] == 0)
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
            if (anwsers[i] == 0)
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
            if (anwsers[i] == 0)
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
            if (anwsers[i] == 0)
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
            if (anwsers[i] == 0)
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
            if (anwsers[i] == 0)
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
            if (anwsers[i] == 0)
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
            if (anwsers[i] == 1)
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
            if (anwsers[i] == 0)
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
            List<String> splitans = anwsers[i].toString().split('');
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
            if (anwsers[i] == 0)
            {

            }
            else
            {

            }
            break;
          }

        case 26:
          {
            if (anwsers[i] == 0)
            {

            }
            else
            {

            }
            break;
          }

        case 27:
          {
            if (anwsers[i] == 0)
            {

            }
            else
            {

            }
            break;
          }

        case 28:
          {
            if (anwsers[i] == 0)
            {

            }
            else
            {

            }
            break;
          }

        case 29:
          {
            if (anwsers[i] == 0)
            {

            }
            else
            {

            }
            break;
          }

        case 30:
          {
            if (anwsers[i] == 0)
            {

            }
            else
            {

            }
            break;
          }

        case 31:
          {
            if (anwsers[i] == 0)
            {

            }
            else
            {

            }
            break;
          }

        case 32:
          {
            if (anwsers[i] == 0)
            {

            }
            else
            {

            }
            break;
          }

        case 33:
          {
            if (anwsers[i] == 0)
            {

            }
            else
            {

            }
            break;
          }

        case 34:
          {
            if (anwsers[i] == 0)
            {

            }
            else
            {

            }
            break;
          }

        case 35:
          {
            if (anwsers[i] == 0)
            {

            }
            else
            {

            }
            break;
          }

        case 36:
          {
            if (anwsers[i] == 0)
            {

            }
            else
            {

            }
            break;
          }

        case 37:
          {
            if (anwsers[i] == 0)
            {

            }
            else
            {

            }
            break;
          }

        case 38:
          {
            if (anwsers[i] == 0)
            {

            }
            else
            {

            }
            break;
          }

        case 39:
          {
            if (anwsers[i] == 0)
            {

            }
            else
            {

            }
            break;
          }

        case 40:
          {
            if (anwsers[i] == 0)
            {

            }
            else
            {

            }
            break;
          }

        case 41:
          {
            if (anwsers[i] == 0)
            {

            }
            else
            {

            }
            break;
          }

        case 42:
          {
            if (anwsers[i] == 0)
            {

            }
            else
            {

            }
            break;
          }

        case 43:
          {
            if (anwsers[i] == 0)
            {

            }
            else
            {

            }
            break;
          }

        case 44:
          {
            if (anwsers[i] == 0)
            {

            }
            else
            {

            }
            break;
          }

        case 45:
          {
            if (anwsers[i] == 0)
            {

            }
            else
            {

            }
            break;
          }

        case 46:
          {
            if (anwsers[i] == 0)
            {

            }
            else
            {

            }
            break;
          }

        case 47:
          {
            if (anwsers[i] == 0)
            {

            }
            else
            {

            }
            break;
          }

        case 48:
          {
            if (anwsers[i] == 0)
            {

            }
            else
            {

            }
            break;
          }

        case 49:
          {
            if (anwsers[i] == 0)
            {

            }
            else
            {

            }
            break;
          }

        default:
          {
            print("Invalid list of answers");
            print(anwsers);
          }
          break;
      }
    }
  }
}
