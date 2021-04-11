import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:matched_app/repository/firebase_auth_api.dart';
import 'package:matched_app/repository/cloud_firestore_api.dart';
import 'package:matched_app/Model/user.dart';
import 'package:matched_app/Model/messages.dart';


class UserBloc implements Bloc {
  final authRepository = FirebaseAuthAPI();

  //Stream - Firebase
  //StreamController
  Stream<FirebaseUser> streamFirebase =
      FirebaseAuth.instance.onAuthStateChanged;
  Stream<FirebaseUser> get authStatus => streamFirebase;
  Future<FirebaseUser> get currentUser => FirebaseAuth.instance.currentUser();

  //Firebase Auth

  // Error Methods
  String getError() => authRepository.getError();

  void resetError() => authRepository.resetError();
  //Delete User
  void deleteUser() => authRepository.deleteUser();
  //1.SignIn
  Future<FirebaseUser> signIn(String email, String password) => authRepository.signIn(email, password);
  //2.SignIn Credential
  Future<AuthResult> signInCredential(AuthCredential credential) => authRepository.signInUsingCredential(credential);
  //Google
  Future<AuthCredential> credentialGoogle() => authRepository.credentialGoogle();
  //Facebook
  Future<AuthCredential> credentialFacebook() => authRepository.credentialFacebook();
  //3.Sign Up
  Future<FirebaseUser> signUp(String email, String password) => authRepository.signUp(email, password);

  Future sendRecoveryPassword(String email) => authRepository.sendRecoveryPassword(email);

  // Firebase Cloud Firestore
  // Error Methods
  final cloudFirestoreRepository = CloudFireStoreAPI();
  String getErrorCloud() => cloudFirestoreRepository.getErrorCloud();
  void resetErrorCloud() => cloudFirestoreRepository.resetErrorCloud();

  // Register New User
  Future<void> setUserData(User user) => cloudFirestoreRepository.setUserData(user);
  // Update User Data
  void updateUserData(User user) => cloudFirestoreRepository.updateUserData(user);
  // Get User Data
  Future<User> getUserData(String userUid) async => cloudFirestoreRepository.getUserData(userUid);
  // Check if user exists
  Stream<DocumentSnapshot> listenUserData(String userUid) {
    return cloudFirestoreRepository.listenUserData(userUid);
  }
  // Get a list of users
  Future<List<User>> getListUsers(String userUid) => cloudFirestoreRepository.getListUsers(userUid);

  // Chat Feature
  Future<void> addMessage(Message message, User sender, User receiver) => cloudFirestoreRepository.addMessage(message, sender, receiver);

  // Save personal details
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
      String religion) =>
      cloudFirestoreRepository.registerPersonalDetails(
          userID,
          title,
          givenName,
          middleName,
          familyName,
          gender,
          dateBirth,
          placeBirth,
          nationality,
          passport,
          dateExpire,
          placeIssue,
          religion);

  // Get personal details
  Stream<DocumentSnapshot> getPersonalDetails(String userID) => cloudFirestoreRepository.getPersonalDetails(userID);

  // Save contact details
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
      String mobileInt) =>
      cloudFirestoreRepository.registerContactDetails(
          userID,
          email,
          otherEmail,
          phone,
          mobile,
          residentialAddress,
          residentialCity,
          residentialState,
          residentialCountry,
          residentialPostcode,
          postalAddress,
          postalCity,
          postalState,
          postalCountry,
          postalPostcode,
          emergencyContact,
          emergencyRel,
          mobileInt);

  // Get contact details
  Stream<DocumentSnapshot> getContactDetails(String userID) => cloudFirestoreRepository.getContactDetails(userID);

  // Save user's answer of roommate matching question
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
          String concernAboutRoommate) =>
      cloudFirestoreRepository.roommateMatchingQuestion(
          userID,
          LGBTQSelf,
          LGBTQMate,
          school,
          major,
          musicalPreference,
          playMusicFreq,
          instrumentPlayed,
          hobby,
          considerMyself,
          otherViewOnMe,
          smokerSelf,
          smokerMate,
          privateTime,
          roomPreference,
          overnightGuestPref,
          roommateSignificant,
          socializingInRoom,
          timeSpendInRoom,
          myRoomAtHome,
          cleanFreqAtHome,
          idealRoomTemp,
          goHomeFreq,
          sleepTime,
          getUpTime,
          sleeperType,
          whenISleep,
          studyPlace,
          studyTime,
          whenIStudy,
          roommateRelationship,
          dealingWithConflict,
          roommateBorrow,
          fourImportantCategories,
          concernAboutRoommate);

  // Get user's answer of roommate matching questions
  Stream<DocumentSnapshot> getRoommateMatchingQuestion(String userID) => cloudFirestoreRepository.getRoommateMatchingQuestion(userID);

  // Save matching result
  Future<void> saveMatchingResult(String userID, String roommateOne, String roommateTwo, String roommateThree) =>
      cloudFirestoreRepository.saveMatchingResult(userID, roommateOne, roommateTwo, roommateThree);

  // Get matching result
  Stream<DocumentSnapshot> getMatchingResult(String userID) => cloudFirestoreRepository.getMatchingResult(userID);

  @override
  void dispose() {}
}