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

  final CollectionReference applications =
  FirebaseFirestore.instance.collection('applications');

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

  Future<void> registerPersonalDetails(
      String userID,
      String title,
      String givenName,
      String middleName,
      String familyName,
      String gender,
      String dateBirth,
      String placeBirth,
      String nationality,
      String passport,
      String dateExpire,
      String placeIssue,
      String religion) async {
    return await applications
        .doc(userID)
        .collection('Personal Details')
        .doc(userID)
        .set({
      'title': title,
      'given name': givenName,
      'middle name': middleName,
      'family name': familyName,
      'gender': gender,
      'date of birth': dateBirth,
      'place of birth': placeBirth,
      'passport': passport,
      'date of expire': dateExpire,
      'place of issue': placeIssue,
      'religion': religion,
      'nationality': nationality
    }, SetOptions(merge: true));
  }

  Stream<DocumentSnapshot> getPersonalDetails(String userID) {
    return applications
        .doc(userID)
        .collection('Personal Details')
        .doc(userID)
        .snapshots();
  }

  Future<void> registerContactDetails(
      String userID,
      String email,
      String otherEmail,
      String phone,
      String mobile,
      String residentialAddress,
      String residentialCity,
      String residentialState,
      String residentialCountry,
      String residentialPostcode,
      String postalAddress,
      String postalCity,
      String postalState,
      String postalCountry,
      String postalPostcode,
      String emergencyContact,
      String emergencyRel,
      String mobileInt) async {
    return await applications
        .doc(userID)
        .collection('Contact Details')
        .doc(userID)
        .set({
      'email': email,
      'other email': otherEmail,
      'phone': phone,
      'mobile': mobile,
      'residential address': residentialAddress,
      'residential city': residentialCity,
      'residential state': residentialState,
      'residential country': residentialCountry,
      'residential postcode': residentialPostcode,
      'postal address': postalAddress,
      'postal city': postalCity,
      'postal state': postalState,
      'postal country': postalCountry,
      'postal postcode': postalPostcode,
      'emergency contact name': emergencyContact,
      'emergency relationship': emergencyRel,
      'mobile for interview': mobileInt,
    }, SetOptions(merge: true));
  }

  Stream<DocumentSnapshot> getContactDetails(String userID) {
    return applications
        .doc(userID)
        .collection('Contact Details')
        .doc(userID)
        .snapshots();
  }

  Future<void> saveMatchingResult(String userID, String roommateOneUID, String roommateTwoUID, String roommateThreeUID) async {
      return await applications
          .doc(userID)
          .collection('Roommate Matching Result')
          .doc(userID)
          .set({
            'First Roommate': roommateOneUID,
            'Second Roommate': roommateTwoUID,
            'Third Roommate': roommateThreeUID,
          }, SetOptions(merge: true));
  }

  Stream<DocumentSnapshot> getMatchingResult(String userID) {
    return applications
        .doc(userID)
        .collection('Roommate Matching Result')
        .doc(userID)
        .snapshots();
  }

  Future<void> savePersonalityTestResult(String userID, String personality) async {
    return await applications
        .doc(userID)
        .collection('Personality Test Result')
        .doc(userID)
        .set({
      'Personality': personality,
    }, SetOptions(merge: true));
  }

  Stream<DocumentSnapshot> getPersonalityTestResult(String userID) {
    return applications
        .doc(userID)
        .collection('Personality Test Result')
        .doc(userID)
        .snapshots();
  }

  Future<void> saveDoWeMatchResult(String userID, String partner, String result) async {
    return await applications
        .doc(userID)
        .collection('Do We Match Result')
        .doc(userID)
        .set({
      'Partner': partner,
      'Result': result,
    }, SetOptions(merge: true));
  }

  Stream<DocumentSnapshot> getDoWeMatchResult(String userID, String partner) {
    return applications
        .doc(userID)
        .collection('Do We Match Result')
        .doc(userID)
        .snapshots();
  }

  Future<void> save20AnswersResult(String userID, String answer) async {
    return await applications
        .doc(userID)
        .collection('20 Answers Result')
        .doc(userID)
        .set({
      'Answer': answer,
    }, SetOptions(merge: true));
}

  Stream<DocumentSnapshot> get20AnswerResult(String userID) {
    return applications
        .doc(userID)
        .collection('20 Answer Result')
        .doc(userID)
        .snapshots();
  }

}