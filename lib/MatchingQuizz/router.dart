import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:matched_app/MatchingQuizz/invitationTab.dart';
import 'package:matched_app/MatchingQuizz/result.dart';
import 'quizzPage.dart';
import 'resultPage.dart';
import 'profilePage.dart';
import 'listUsers.dart';
import 'package:matched_app/PersonalityTest/pages/personalityQuizzPage.dart';
import 'package:matched_app/PersonalityTest/pages/personalityResultPage.dart';

class RouterCustom {
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

  Route quizzToFinalResult(Result r, Result r2) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          ResultPage(myResult: r, otherResult: r2),
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
          identifier: identifier),
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

  Route resultToQuizz() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => QuizzPage(),
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

  Route invitationToQuizz(String otherResult) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => QuizzPage(
        gotInvitation: 2,
        otherResult: otherResult,
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

  Route quizzToInvitation() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => InvitationTab(
        gotInvitation: 1,
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

  Route personalityQuizzToResult(Result r) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          PersonalityResultPage(myResult: r),
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

  Route profileToQuizz(String docID) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          QuizzPage(gotInvitation: 1, docID: docID),
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
