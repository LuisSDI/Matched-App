import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:matched_app/repository/firebase_auth_api.dart';
import 'package:matched_app/repository/cloud_firestore_api.dart';
import 'package:matched_app/Model/user.dart';
import 'package:matched_app/Model/messages.dart';
import 'package:matched_app/repository/firebase_storage_api.dart';


class UserBloc implements Bloc {
  final authRepository = FirebaseAuthAPI();

  //Stream - Firebase
  //StreamController
  Stream<User> streamFirebase = FirebaseAuth.instance.authStateChanges();
  Stream<User> get authStatus => streamFirebase;
  User get currentUser => FirebaseAuth.instance.currentUser;

  //Firebase Auth

  // Error Methods
  String getError() => authRepository.getError();

  void resetError() => authRepository.resetError();
  //Delete User
  void deleteUser() => authRepository.deleteUser();
  //1.SignIn
  Future<User> signIn(String email, String password) => authRepository.signIn(email, password);
  //2.SignIn Credential
  Future<UserCredential> signInCredential(AuthCredential credential) => authRepository.signInUsingCredential(credential);
  //Google
  Future<AuthCredential> credentialGoogle() => authRepository.credentialGoogle();
  //Facebook
  Future<AuthCredential> credentialFacebook() => authRepository.credentialFacebook();
  //3.Sign Up
  Future<User> signUp(String email, String password) => authRepository.signUp(email, password);

  Future sendRecoveryPassword(String email) => authRepository.sendRecoveryPassword(email);

  // Firebase Cloud Firestore
  // Error Methods
  final cloudFirestoreRepository = CloudFireStoreAPI();
  String getErrorCloud() => cloudFirestoreRepository.getErrorCloud();
  void resetErrorCloud() => cloudFirestoreRepository.resetErrorCloud();

  // Register New User
  Future<void> setUserData(UserModel user) => cloudFirestoreRepository.setUserData(user);
  // Update User Data
  void updateUserData(UserModel user) => cloudFirestoreRepository.updateUserData(user);
  // Get User Data
  Future<UserModel> getUserData(String userUid) async => cloudFirestoreRepository.getUserData(userUid);
  // Check if user exists
  Stream<DocumentSnapshot> listenUserData(String userUid) {
    return cloudFirestoreRepository.listenUserData(userUid);
  }
  // Get a list of users
  Future<List<UserModel>> getListUsers(String userUid) => cloudFirestoreRepository.getListUsers(userUid);

  // Chat Feature
  Future<void> addMessage(Message message, UserModel sender, UserModel receiver) => cloudFirestoreRepository.addMessage(message, sender, receiver);

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

  // Save roommate matching result
  Future<void> saveMatchingResult(String userID, String roommateOneUID, String roommateTwoUID, String roommateThreeUID) =>
      cloudFirestoreRepository.saveMatchingResult(userID, roommateOneUID, roommateTwoUID, roommateThreeUID);

  // Get roommate matching result
  Stream<DocumentSnapshot> getMatchingResult(String userID) => cloudFirestoreRepository.getMatchingResult(userID);

  // Save personality test result
  Future<void> savePersonalityTestResult(String userID, String personality) =>
      cloudFirestoreRepository.savePersonalityTestResult(userID, personality);

  // Get personality test result
  Stream<DocumentSnapshot> getPersonalityTestResult(String userID) => cloudFirestoreRepository.getPersonalityTestResult(userID);

  // Save "Do We Match?" result
  Future<void> saveDoWeMatchResult(String userID, String partner, String result) =>
      cloudFirestoreRepository.saveDoWeMatchResult(userID, partner, result);

  // Get "Do We Match?" result
  Stream<DocumentSnapshot> getDoWeMatchResult(String userID, String partner) => cloudFirestoreRepository.getDoWeMatchResult(userID, partner);

  signOut() {
    authRepository.signOut();
  }

  // Firebase Storage
  final _firebaseStorageRepository = FirebaseStorageAPI();

  Future<String> getImageUrl(String imageId) => _firebaseStorageRepository.getImageUrl(imageId);

  @override
  void dispose() {

  }
}