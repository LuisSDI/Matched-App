import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:matched_app/MatchingQuizz/router.dart';

class ListUsers extends StatefulWidget {
  ListUsers({Key key}) : super(key: key);

  @override
  _ListUsersState createState() => _ListUsersState();
}

class _ListUsersState extends State<ListUsers> {
  TextEditingController myController = TextEditingController();
  String searchValue = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    myController = TextEditingController();
    myController.addListener(_changeSearchVal);

    searchValue = "";
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  _changeSearchVal() {
    setState(() {
      searchValue = myController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    CollectionReference profiles =
        FirebaseFirestore.instance.collection('Profile');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextField(
          controller: myController,
          decoration: InputDecoration(hintText: 'Please enter a search term'),
        ),
        Container(
          height: MediaQuery.of(context).size.width / 1.5,
          child: StreamBuilder(
              stream: profiles
                  .where("caseSearch", arrayContains: searchValue)
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
                        height: MediaQuery.of(context).size.height / 20,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.network(document['image']),
                            Text("" + document['username']),
                            ElevatedButton(
                                child: Text('see'),
                                onPressed: () {
                                  RouterCustom route = RouterCustom();
                                  Navigator.of(context).push(
                                      route.listToProfile(
                                          document['username'],
                                          document['image'],
                                          document['identifier']));
                                }),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                );
              }),
        ),
      ],
    );
  }
}
