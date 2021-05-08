import 'package:flutter/material.dart';
import 'package:matched_app/MatchingQuizz/invitationTab.dart';
import 'package:matched_app/MatchingQuizz/quizzPage.dart';

import 'listUsers.dart';

class MatchingScreen extends StatelessWidget {
  const MatchingScreen(
      {Key key,
      @required this.title,
      @required this.identifier = "need to be initialized"})
      : super(key: key);
  final String title, identifier;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(
                  text: "Home",
                  icon: Icon(Icons.home),
                ),
                // Tab(text: "Questions", icon: Icon(Icons.question_answer)),
                Tab(text: "Requests", icon: Icon(Icons.insert_invitation)),
              ],
              labelColor: Colors.white,
            ),
            // Here we take the value from the MyHomePage object that was created by
            // the App.build method, and use it to set our appbar title.
            title: Text(title),
          ),
          body: TabBarView(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 1.2,
                child: ListUsers(identifier: identifier),
              ),
              // Center(
              //   child: QuizzPage(),
              // ),
              InvitationTab(),
            ],
          ),
          // body: Center(

          //   //child: QuizzPage(),

          // ),
        ));
  }
}
