import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:matched_app/model/group.dart';
import 'package:matched_app/model/group_message.dart';
import 'package:matched_app/model/messages.dart';
import 'package:matched_app/model/personality_result.dart';
import 'package:matched_app/model/user.dart';
import 'package:matched_app/repository/cloud_firestore_api.dart';
import 'package:matched_app/repository/firebase_auth_api.dart';
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
  Future<User> signIn(String email, String password) =>
      authRepository.signIn(email, password);
  //2.SignIn Credential
  Future<UserCredential> signInCredential(AuthCredential credential) =>
      authRepository.signInUsingCredential(credential);
  //Google
  Future<AuthCredential> credentialGoogle() =>
      authRepository.credentialGoogle();
  //Facebook
  //Future<AuthCredential> credentialFacebook() => authRepository.credentialFacebook();
  //3.Sign Up
  Future<User> signUp(String email, String password) =>
      authRepository.signUp(email, password);

  Future sendRecoveryPassword(String email) =>
      authRepository.sendRecoveryPassword(email);

  // Firebase Cloud Firestore
  // Error Methods
  final cloudFirestoreRepository = CloudFireStoreAPI();
  String getErrorCloud() => cloudFirestoreRepository.getErrorCloud();
  void resetErrorCloud() => cloudFirestoreRepository.resetErrorCloud();

  // Register New User
  Future<void> setUserData(UserModel user) =>
      cloudFirestoreRepository.setUserData(user);
  // Update User Data
  void updateUserData(UserModel user) =>
      cloudFirestoreRepository.updateUserData(user);
  // Get User Data
  Future<UserModel> getUserData(String userUid) {
    return cloudFirestoreRepository.getUserData(userUid);
  }

  //Search List of Users
  Stream<QuerySnapshot> searchUser(searchValue) {
    return cloudFirestoreRepository.searchUser(searchValue);
  }

  // Check if user exists
  Stream<DocumentSnapshot> listenUserData(String userUid) {
    return cloudFirestoreRepository.listenUserData(userUid);
  }

  // Get a list of users
  Future<List<UserModel>> getListUsers(String userUid) async =>
      await cloudFirestoreRepository.getListUsers(userUid);

  //Get a list of groups
  Future<List<GroupModel>> getListGroups(UserModel user) {
    return cloudFirestoreRepository.getListGroups(user);
  }

  //Get a list of members
  Future<List<UserModel>> getListMemebers(GroupModel group) {
    return cloudFirestoreRepository.getListMemebers(group);
  }

  //Search a Group
  Future<GroupModel> searchGroup(String groupName) {
    return cloudFirestoreRepository.searchGroup(groupName);
  }

  // Chat Feature
  Future<void> addMessage(
          Message message, UserModel sender, UserModel receiver) =>
      cloudFirestoreRepository.addMessage(message, sender, receiver);

  // Get personality test result
  Future<String> getPersonalityTestResult(String userID) =>
      cloudFirestoreRepository.getPersonalityTestResult(userID);

  // Get roommate matching result
  Future<String> getRoommateMatchingResult(String userID) =>
      cloudFirestoreRepository.getRoommateMatchingResult(userID);

  //send a message to a group chat
  Future<void> sendGroupMessage(String groupId, GroupMessage chatMessageData) {
    return cloudFirestoreRepository.sendGroupMessage(groupId, chatMessageData);
  }

  //add user to a group chat
  Future addToGroup(String uid, String groupId) {
    return cloudFirestoreRepository.addToGroup(uid, groupId);
  }

  // get chats of a particular group
  Stream<QuerySnapshot<Object>> getChats(String groupId) {
    return cloudFirestoreRepository.getChats(groupId);
  }

  Future createGroup(String groupName) {
    return cloudFirestoreRepository.createGroup(groupName);
  }

  // search groups
  searchByName(String groupName) {
    cloudFirestoreRepository.searchByName(groupName);
  }

  // PERSONALITY FUNCTIONS

  Future<void> sendPersonalityResult(
      UserModel user, PersonalityResult personalityResult) {
    cloudFirestoreRepository.sendPersonalityResult(user, personalityResult);
  }

  Future<PersonalityResult> getPersonalityResult(String userUid) {
    return cloudFirestoreRepository.getPersonalityResult(userUid);
  }

  // ROOMMATE TEST

  Future<void> createRoommateTest(
      String uid,
      List<int> habitsAns,
      List<int> socialAns,
      List<int> beliefAns,
      List<int> communAns,
      List<int> interestAns) {
    return cloudFirestoreRepository.createRoommateTest(
        uid, habitsAns, socialAns, beliefAns, communAns, interestAns);
  }

  Future<String> getRoommateSubmit(String userUid) {
    return cloudFirestoreRepository.getRoommateSubmit(userUid);
  }

  Future<DateTime> getReleaseTime() {
    return cloudFirestoreRepository.getReleaseTime();
  }

  signOut() {
    authRepository.signOut();
  }

  //PEOPLE MATCH FUNCTIONS
  Future<void> createPeopleMatchTest(
      String myUid, String yourUid, List<int> myAns) {
    return cloudFirestoreRepository.createPeopleMatchTest(myUid, yourUid, myAns);
  }

  // Firebase Storage
  final _firebaseStorageRepository = FirebaseStorageAPI();

  Future<String> getImageUrl(String imageId) =>
      _firebaseStorageRepository.getImageUrl(imageId);

  @override
  void dispose() {}
}
