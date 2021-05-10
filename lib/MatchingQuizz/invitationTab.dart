import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:matched_app/MatchingQuizz/router.dart';
import 'package:matched_app/MatchingQuizz/result.dart';

class InvitationTab extends StatelessWidget {
  const InvitationTab(
      {Key key, this.gotInvitation = 0, @required this.identifier})
      : super(key: key);
  final int gotInvitation;
  final String identifier;

  @override
  Widget build(BuildContext context) {
    CollectionReference invitations =
        FirebaseFirestore.instance.collection('Invitation');
    if (gotInvitation == 0) {
      return StreamBuilder(
          stream: invitations
              .where("to", isEqualTo: identifier)
              .where("status", isEqualTo: 0)
              .snapshots(includeMetadataChanges: true),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            return ListView(
              children: snapshot.data.docs.map((document) {
                return Center(
                  child: Container(
                    margin: EdgeInsets.all(20),
                    width: MediaQuery.of(context).size.width / 1.2,
                    // height: MediaQuery.of(context).size.height / 20,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("" + document['from']),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.purple,
                            ),
                            child: Text('accept'),
                            onPressed: () async {
                              await invitations.doc(document.id).update(
                                  {'status': 1}).then((value) async {
                                await FirebaseFirestore.instance
                                    .collection('MatchingTest')
                                    .where("user", isEqualTo: document['from'])
                                    .limit(1)
                                    .get()
                                    .then((QuerySnapshot value) {
                                  if (value.docs.isNotEmpty) {
                                    RouterCustom route = RouterCustom();
                                    Navigator.of(context).push(
                                        route.invitationToQuizz(
                                            value.docs.first
                                                .get("result")
                                                .toString(),
                                            identifier));
                                  }
                                });
                              }).catchError((error) =>
                                  print("Failed to update invitation: $error"));
                            }),
                      ],
                    ),
                  ),
                );
              }).toList(),
            );
          });
    } else {
      return Scaffold(
          appBar: AppBar(
            title: Text('Results'),
          ),
          body: StreamBuilder(
              stream: invitations
                  .where("status", isEqualTo: 1)
                  .where("from", isEqualTo: identifier)
//                  .where("to", isNotEqualTo: identifier)
                  .snapshots(includeMetadataChanges: true),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                return ListView(
                  children: snapshot.data.docs.map((document) {
                    return Center(
                      child: Container(
                        margin: EdgeInsets.all(20),
                        width: MediaQuery.of(context).size.width / 1.2,
                        // height: MediaQuery.of(context).size.height / 20,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("" + document['to']),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.purple,
                                ),
                                child: Text('See Result'),
                                onPressed: () async {
                                  // await invitations
                                  //     .doc(document.id)
                                  //     .update({'status': 1})
                                  //     .then((value) => print("Updated"))
                                  //     .catchError((error) => print(
                                  //         "Failed to update invitation: $error"));
                                  String res1 = document['valueOfFrom'];
                                  await FirebaseFirestore.instance
                                      .collection('MatchingTest')
                                      .where("user",
                                          isEqualTo: document['from'])
                                      .limit(1)
                                      .get()
                                      .then((QuerySnapshot value) {
                                    if (value.docs.isNotEmpty) {
                                      res1 = value.docs.first
                                          .get("result")
                                          .toString();
                                    }
                                  }).then((value) async {
                                    String res2 = document['valueOfTo'];
                                    await FirebaseFirestore.instance
                                        .collection('MatchingTest')
                                        .where("user",
                                            isEqualTo: document['to'])
                                        .limit(1)
                                        .get()
                                        .then((QuerySnapshot value) {
                                      if (value.docs.isNotEmpty) {
                                        res2 = value.docs.first
                                            .get("result")
                                            .toString();
                                      }
                                    }).then((value) {
                                      Result r1 = Result(res1),
                                          r2 = Result(res2);
                                      RouterCustom route = RouterCustom();
                                      Navigator.of(context).push(
                                          route.invitationToResult(r1, r2));
                                    });
                                  });
                                }),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                );
              }));
    }
  }
}
