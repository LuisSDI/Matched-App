import 'package:flutter/material.dart';
import 'package:matched_app/MatchingQuizz/invitationTab.dart';
import 'package:matched_app/MatchingQuizz/matchingScreen.dart';
import 'package:matched_app/MatchingQuizz/matchingScreenPage.dart';
import 'package:matched_app/MatchingQuizz/result.dart';
import 'package:matched_app/PersonalityTest/pages/personalityQuizzPage.dart';
import 'package:matched_app/PersonalityTest/pages/personalityResultPage.dart';
import 'package:matched_app/RoommateMatching/pages/testDone.dart';
import 'package:matched_app/main_pages/home_page.dart';

import 'profilePage.dart';
import 'quizzPage.dart';
import 'resultPage.dart';

class RouterCustom {
  Route toPersonalityQuizz(String identifier) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          PersonnalityQuizzPage(identifier: identifier),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(0.0, 0.1);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  Route toHomePage(String identifier) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          HomePage(identifier: identifier),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(0.0, 0.1);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  Route quizzToResult(Result r) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          ResultPage(myResult: r),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(0.0, 0.1);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  Route quizzToFinalResult(Result r, Result r2, String email) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          ResultPage(myResult: r, otherResult: r2, otherName: email),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(0.0, 0.1);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  Route listToProfile(
      String username, String image, String email, String identifier) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => ProfilePage(
          username: username,
          image: image,
          email: email,
          ),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(0.0, 0.1);
        var end = Offset.zero;
        var curve = Curves.bounceIn;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  Route resultToQuizz(String identifier) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          QuizzPage(identifier: identifier),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(0.0, 1.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  Route invitationToQuizz(
      String otherResult, String identifier, String otherEmail) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => QuizzPage(
          gotInvitation: 2,
          otherResult: otherResult,
          identifier: identifier,
          otherEmail: otherEmail),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(0.0, 1.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  Route invitationToResult(
      Result myResult, Result otherResult, String otherEmail) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => ResultPage(
          myResult: myResult, otherResult: otherResult, otherName: otherEmail),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(0.0, 1.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  Route quizzToInvitation(String identifier) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          InvitationTab(gotInvitation: 1, identifier: identifier),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(0.0, 1.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  Route personalityQuizzToResult(Result r, String identifier, String uid) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          PersonalityResultPage(myResult: r, identifier: identifier, uid: uid),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(0.0, 1.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  Route toMatchingScreen(String identifier) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          MatchingScreenPage(identifier: identifier),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(0.0, 1.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  Route toTestDone() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => TestDonePage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(0.0, 1.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  Route invitationReturn(String identifier) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          MatchingScreen(identifier: identifier, title: "Do we match?"),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(0.0, 1.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  Route toPersonalityResult(String identifier, String val) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          PersonalityResultPage(
        identifier: identifier,
        result: val,
        hasValue: true,
        myResult: Result.reinit(24, val),
      ),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(0.0, 1.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  Route profileToQuizz(String docID, String identifier) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          QuizzPage(gotInvitation: 1, docID: docID, identifier: identifier),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(0.0, 1.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
