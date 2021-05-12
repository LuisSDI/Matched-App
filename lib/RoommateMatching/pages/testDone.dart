import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:matched_app/MatchingQuizz/result.dart';
import 'package:matched_app/MatchingQuizz/router.dart';
import 'package:matched_app/bloc/user_bloc.dart';
import 'package:matched_app/main_pages/home_page.dart';

class TestDonePage extends StatefulWidget {
  TestDonePage({Key key, this.identifier = ""}) : super(key: key);
  String identifier;
  @override
  _TestDonePageState createState() => _TestDonePageState();
}

class _TestDonePageState extends State<TestDonePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Test done'),
        ),
        body: Center(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Roommate matching result will be out soon!'),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.teal,
              ),
              child: Text("return"),
              onPressed: () async {
                UserBloc userBloc = BlocProvider.of(context);
                User currentUser = userBloc.currentUser;
                RouterCustom route = RouterCustom();
                Navigator.of(context).pushAndRemoveUntil(
                    route.toHomePage(currentUser.email), (route) => false);
              },
            )
          ],
        )));
  }
}
