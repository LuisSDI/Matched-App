import 'package:flutter/material.dart';
import 'package:matched_app/MatchingQuizz/invitationTab.dart';
import 'package:matched_app/MatchingQuizz/quizzPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:matched_app/bloc/user_bloc.dart';

import 'listUsers.dart';

class MatchingScreens extends StatefulWidget {
  MatchingScreens(
      {Key key,
      @required this.title,
      this.identifier = "need to be initialized"})
      : super(key: key);
  final String title, identifier;

  @override
  _MatchingScreensState createState() => _MatchingScreensState();
}

class _MatchingScreensState extends State<MatchingScreens> {
  String identifier;

  @override
  void initState() async {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(
                  text: "search, Your email is " + widget.identifier,

                  icon: Icon(Icons.search),
                ),
                Tab(text: "Invitations sent", icon: Icon(Icons.send)),
                Tab(text: "Requests", icon: Icon(Icons.insert_invitation)),
              ],
              labelColor: Colors.white,
            ),
            // Here we take the value from the MyHomePage object that was created by
            // the App.build method, and use it to set our appbar title.
            title: Text(widget.title),
          ),
          body: TabBarView(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 1.2,
                child: ListUsers(identifier: widget.identifier),
              ),
              // Center(
              //   child: QuizzPage(),
              // ),
              InvitationTab(gotInvitation: 1, identifier: widget.identifier),
              InvitationTab(identifier: widget.identifier),
            ],
          ),
          // body: Center(

          //   //child: QuizzPage(),

          // ),
        ));
  }
}

class MatchingScreen extends StatelessWidget {
  const MatchingScreen(
      {Key key, @required this.title, @required this.identifier})
      : super(key: key);
  final String title, identifier;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(
                  text: "search " + identifier,
                  icon: Icon(Icons.search),
                ),
                Tab(text: "Invitations sent", icon: Icon(Icons.send)),
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
              InvitationTab(gotInvitation: 1, identifier: identifier),
              InvitationTab(identifier: identifier),
            ],
          ),
          // body: Center(

          //   //child: QuizzPage(),

          // ),
        ));
  }
}
