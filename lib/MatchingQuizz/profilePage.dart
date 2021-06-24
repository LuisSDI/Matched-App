import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:matched_app/MatchingQuizz/router.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage(
      {Key key,
      this.username = "",
      this.image = "",
      this.email = "",
      @required this.identifier = "not known yet"})
      : super(key: key);
  final String username, image, email;
  String docID = "", identifier;

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text("Alert!!"),
          content: new Text("You can't send an invitation to yourself!!"),
          actions: <Widget>[
            new FlatButton(
              child: new Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<String> addInvitation() async {
    FirebaseFirestore databaseReference = FirebaseFirestore.instance;
    DocumentReference ref =
        await databaseReference.collection("Invitation").add({
      'from': identifier,
      'status': 0,
      'to': email,
      'valueOfFrom': '0',
      'valueOfTo': '0'
    });
    docID = ref.id;
    return ref.id;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Center(
          child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                height: MediaQuery.of(context).size.height / 3,
                width: MediaQuery.of(context).size.width / 3,
                child: Center(child: Image.network(image)),
              ),
              Container(
                  height: MediaQuery.of(context).size.height / 3,
                  width: MediaQuery.of(context).size.width * 2 / 3,
                  child: Center(child: Text(username))),
            ],
          ),
          Text('email : ' + email),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.purple,
            ),
            child: Text("send invitation"),
            onPressed: () async {
              if (identifier.compareTo(email) == 0) {
                _showDialog(context);
              } else {
                await addInvitation();
                RouterCustom route = RouterCustom();
                Navigator.of(context)
                    .push(route.profileToQuizz(docID, identifier));
              }
            },
          )
        ],
      )),
    );
  }
}
