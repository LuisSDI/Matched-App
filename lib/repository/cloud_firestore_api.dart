import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:matched_app/Model/user.dart';
import 'package:matched_app/Model/messages.dart';

class CloudFireStoreAPI {
  final CollectionReference userInfo =
  Firestore.instance.collection('userInfo');

  final CollectionReference messages =
  Firestore.instance.collection('messages');

  final CollectionReference applications =
  Firestore.instance.collection('applications');

  String errorMessage;

  String getErrorCloud() {
    return errorMessage;
  }

  void resetErrorCloud() {
    errorMessage = null;
  }

  Future<void> setUserData(User user) async {
    try {
      return await userInfo.document(user.uid).setData({
        'uid': user.uid,
        'full name': user.name,
        'email': user.email,
        'photoURL': user.photoUrL,
        'phone': user.phone,
        'country': user.country,
        'type': user.type,
        'description': user.description,
        'lastSignIn': DateTime.now()
      }, merge: true);
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

  void updateUserData(User user) async {
    return await userInfo.document(user.uid).updateData({
      'uid': user.uid,
      'full name': user.name,
      'email': user.email,
      'photoURL': user.photoUrL,
      'phone': user.phone,
      'country': user.country,
      'type': user.type,
      'description': user.description,
      'lastSignIn': DateTime.now()
    });
  }

  Future<User> getUserData(String userUid) async {
    User user;
    Future<DocumentSnapshot> document = userInfo.document(userUid).get();
    await document.then<dynamic>((DocumentSnapshot value) async {
      user = User(
        name: value.data['full name'],
        type: value.data['type'],
        phone: value.data['phone'],
        description: value.data['description'],
        country: value.data['country'],
        uid: value.data['uid'],
        photoUrL: value.data['photoURL'],
        email: value.data['email'],
      );
    });
    return user;
  }

  Stream<DocumentSnapshot> listenUserData(String userUid) {
    return userInfo.document(userUid).snapshots();
  }

  Future<List<User>> getListUsers(String userUid) async {
    List<User> users = List<User>();
    var querySnapshot = await userInfo.getDocuments();
    querySnapshot.documents.forEach((value) {
      User user = User(
        name: value.data['full name'],
        type: value.data['type'],
        phone: value.data['phone'],
        description: value.data['description'],
        country: value.data['country'],
        uid: value.data['uid'],
        photoUrL: value.data['photoURL'],
        email: value.data['email'],
      );
      users.add(user);
    });
    return users;
  }

  Future<void> addMessage(Message message, User sender, User receiver) async {
    Map map = message.toMap();

    await messages
        .document(message.senderId)
        .collection(message.receiverId)
        .add(map);

    return await messages
        .document(message.receiverId)
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
        .document(userID)
        .collection('Personal Details')
        .document(userID)
        .setData({
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
    }, merge: true);
  }

  Stream<DocumentSnapshot> getPersonalDetails(String userID) {
    return applications
        .document(userID)
        .collection('Personal Details')
        .document(userID)
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
        .document(userID)
        .collection('Contact Details')
        .document(userID)
        .setData({
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
    }, merge: true);
  }

  Stream<DocumentSnapshot> getContactDetails(String userID) {
    return applications
        .document(userID)
        .collection('Contact Details')
        .document(userID)
        .snapshots();
  }

  Future<void> roommateMatchingQuestion(
      String userID,
      String LGBTQSelf,
      String LGBTQMate,
      String school,
      String major,
      String musicalPreference,
      String playMusicFreq,
      String instrumentPlayed,
      String hobby,
      String considerMyself,
      String otherViewOnMe,
      String smokerSelf,
      String smokerMate,
      String privateTime,
      String roomPreference,
      String overnightGuestPref,
      String roommateSignificant,
      String socializingInRoom,
      String timeSpendInRoom,
      String myRoomAtHome,
      String cleanFreqAtHome,
      String idealRoomTemp,
      String goHomeFreq,
      String sleepTime,
      String getUpTime,
      String sleeperType,
      String whenISleep,
      String studyPlace,
      String studyTime,
      String whenIStudy,
      String roommateRelationship,
      String dealingWithConflict,
      String roommateBorrow,
      String fourImportantCategories,
      String concernAboutRoommate) async {
    return await applications
        .document(userID)
        .collection('Roommate Matching Questions')
        .document(userID)
        .setData({
          'LGBTQ Self': LGBTQSelf,
          'LGBTQ Ally': LGBTQMate,
          'School': school,
          'Major': major,
          'Musical Preference': musicalPreference,
          'Playing Music Frequency': playMusicFreq,
          'Instrument Played': instrumentPlayed,
          'Hobby': hobby,
          'View On Myself': considerMyself,
          'Other View On Me': otherViewOnMe,
          'Am I Smoking': smokerSelf,
          'Roommate Smoker': smokerMate,
          'Private Time': privateTime,
          'Room Preference': roomPreference,
          'Overnight Guest Preference': overnightGuestPref,
          'Roommate Significant': roommateSignificant,
          'Socializing In Room': socializingInRoom,
          'Time Spend In Room': timeSpendInRoom,
          'My Room At Home': myRoomAtHome,
          'Cleaning Frequency At Home': cleanFreqAtHome,
          'Ideal Room Temperature': idealRoomTemp,
          'Go Home Frequency': goHomeFreq,
          'Sleeping Time': sleepTime,
          'Get Up Time': getUpTime,
          'Sleeper Type': sleeperType,
          'When I Sleep': whenISleep,
          'Study Place': studyPlace,
          'Study Time': studyTime,
          'When I Study': whenIStudy,
          'Roommate Relationship': roommateRelationship,
          'Dealing With Conflict': dealingWithConflict,
          'Roommate Borrowing Me': roommateBorrow,
          'Four Important Categories': fourImportantCategories,
          'Concern About Roommate': concernAboutRoommate,
        }, merge: true);
  }

  Stream<DocumentSnapshot> getRoommateMatchingQuestion(String userID) {
      return applications
          .document(userID)
          .collection('Roommate Matching Questions')
          .document(userID)
          .snapshots();
  }

  Future<void> saveMatchingResult(String userID, String roommateOne, String roommateTwo, String roommateThree) async {
      return await applications
          .document(userID)
          .collection('Roommate Matching Result')
          .document(userID)
          .setData({
            'First Roommate': roommateOne,
            'Second Roommate': roommateTwo,
            'Third Roommate': roommateThree,
          }, merge: true);
  }

  Stream<DocumentSnapshot> getMatchingResult(String userID) {
    return applications
        .document(userID)
        .collection('Roommate Matching Result')
        .document(userID)
        .snapshots();
  }

}