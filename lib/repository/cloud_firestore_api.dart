import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:matched_app/Model/user.dart';
import 'package:matched_app/Model/messages.dart';


class CloudFireStoreAPI {
  final CollectionReference userInfo =
  FirebaseFirestore.instance.collection('userInfo');

  final CollectionReference messages =
  FirebaseFirestore.instance.collection('messages');

  final CollectionReference personality =
  FirebaseFirestore.instance.collection('Personality');

  final CollectionReference roommate =
  FirebaseFirestore.instance.collection('Roommate');

  String errorMessage;

  String getErrorCloud() {
    return errorMessage;
  }

  void resetErrorCloud() {
    errorMessage = null;
  }

  Future<void> setUserData(UserModel user) async {
    try {
      List<String> substring = List<String>();
      substring.add(" ");
      for(int i=0; i<user.name.length; i++){
        substring.add(user.name.substring(0,i+1));
      }
      return await userInfo.doc(user.uid).set({
        'uid': user.uid,
        'caseSearch': substring,
        'full name': user.name,
        'email': user.email,
        'photoURL': user.photoUrL,
        'type': user.type,
        'description': user.description,
        'lastSignIn': DateTime.now()
      }, SetOptions(merge: true));
    } catch (error) {
      print(error.code);
      switch (error.code) {
        case "ERROR_NETWORK_REQUEST_FAILED":
          errorMessage = "You are unable to connect";
          break;
        default:
          errorMessage = "An undefined Error happened.";
      }
    }
  }

  void updateUserData(UserModel user) async {
    List<String> substring = List<String>();
    for(int i=0; i<user.name.length; i++){
      substring.add(user.name.substring(0,i+1));
    }
    return await userInfo.doc(user.uid).update({
      'uid': user.uid,
      'caseSearch': substring,
      'full name': user.name,
      'email': user.email,
      'photoURL': user.photoUrL,
      'type': user.type,
      'description': user.description,
      'lastSignIn': DateTime.now()
    });
  }

  Future<UserModel> getUserData(String userUid) async {
    UserModel user;
    Future<DocumentSnapshot> document = userInfo.doc(userUid).get();
    await document.then<dynamic>((DocumentSnapshot value) async {
      user = UserModel(
        name: value.get('full name'),
        type: value.get('type'),
        description: value.get('description'),
        uid: value.get('uid'),
        photoUrL: value.get('photoURL'),
        email: value.get('email'),
        caseSearch: value.get('caseSearch'),
      );
    });
    return user;
  }

  Stream<DocumentSnapshot> listenUserData(String userUid) {
    return userInfo.doc(userUid).snapshots();
  }

  Future<List<UserModel>> getListUsers(String userUid) async {
    List<UserModel> users = List<UserModel>();
    var querySnapshot = await userInfo.get();
    querySnapshot.docs.forEach((value) {
      UserModel user = UserModel(
        name: value.get('full name'),
        type: value.get('type'),
        description: value.get('description'),
        uid: value.get('uid'),
        photoUrL: value.get('photoURL'),
        email: value.get('email'),
      );
      users.add(user);
    });
    return users;
  }

  Future<void> addMessage(Message message, UserModel sender, UserModel receiver) async {
    Map map = message.toMap();

    await messages
        .doc(message.senderId)
        .collection(message.receiverId)
        .add(map);

    return await messages
        .doc(message.receiverId)
        .collection(message.senderId)
        .add(map);
  }

  Future<String> getPersonalityTestResult(String userID) async {
    String pTestResult;
    Future<DocumentSnapshot> document = personality.doc(userID).get();
    await document.then<dynamic>((DocumentSnapshot value) async {
      pTestResult = value.get("personality");
    });
    return pTestResult;
  }

  Future<String> getRoommateMatchingResult(String userID) async {
    String roommateMatchingResult;
    Future<DocumentSnapshot> document = roommate.doc(userID).get();
    await document.then<dynamic>((DocumentSnapshot value) async {
      roommateMatchingResult = value.get("result");
    });
    return roommateMatchingResult;
  }

}