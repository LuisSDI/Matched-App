import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:matched_app/Model/group.dart';
import 'package:matched_app/Model/group_message.dart';
import 'package:matched_app/Model/user.dart';
import 'package:matched_app/Model/messages.dart';

class CloudFireStoreAPI {
  final CollectionReference userInfo =
      FirebaseFirestore.instance.collection('userInfo');

  final CollectionReference groupsCol =
      FirebaseFirestore.instance.collection('groups');

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
      for (int i = 0; i < user.name.length; i++) {
        substring.add(user.name.substring(0, i + 1));
      }
      print(user.groups.first);
      return  userInfo.doc(user.uid).set({
        'uid': user.uid,
        'caseSearch': substring,
        'full name': user.name,
        'email': user.email,
        'photoURL': user.photoUrL,
        'type': user.type,
        'description': user.description,
        'lastSignIn': DateTime.now(),
        'groups': FieldValue.arrayUnion(user.groups)
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
    substring.add(" ");
    for (int i = 0; i < user.name.length; i++) {
      substring.add(user.name.substring(0, i + 1));
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
        groups: value.get('groups')
      );
    });
    return user;
  }

  Future<GroupModel> searchGroup(String groupName) async {
    GroupModel group;
    var querySnapshot =
        await groupsCol.where('groupName', isEqualTo: groupName).get();
    DocumentSnapshot value = querySnapshot.docs.first;
    group = GroupModel(
        groupId: value.get('groupID'),
        groupName: value.get('groupName'),
        members: value.get('members'),
        groupImage: value.get('groupImage'));
    return group;
  }

  Stream<DocumentSnapshot> listenUserData(String userUid) {
    return userInfo.doc(userUid).snapshots();
  }

  Future<List<UserModel>> getListUsers(String userUid) async {
    List<UserModel> users = [];
    UserModel user;
    var value = await userInfo.get();
    value.docs.forEach((value)
    {
      print(value.data());
      user = UserModel(
        name: value.get('full name'),
        type: value.get('type'),
        description: value.get('description'),
        uid: value.get('uid'),
        photoUrL: value.get('photoURL'),
        email: value.get('email'),
        groups: value.get('groups')
      );
      print(user.uid);
      users.add(user);
      print(users);
    });

    return users;
  }

  Future<List<GroupModel>> getListGroups(UserModel user) async {
    List<GroupModel> groups = [];
    GroupModel group;
    var querySnapshot = await groupsCol.where('groupID',whereIn: user.groups).get();
      querySnapshot.docs.forEach((result) {
        //print(result.data());
            group = GroupModel(
                groupId: result.get('groupID'),
                groupName:result.get('groupName'),
                members: result.get('members'),
                groupImage: result.get('groupImage'));
            print(group.members);
            groups.add(group);
      });


    print('Groups');
    print(groups.first.groupName);
    return groups;


  }

  Future<List<UserModel>> getListMemebers(GroupModel group) async {
    List<UserModel> users = [];
    UserModel user;
    var value = await userInfo.where('uid',whereIn: group.members).get();
    value.docs.forEach((value)
    {
      print(value.data());
      user = UserModel(
          name: value.get('full name'),
          type: value.get('type'),
          description: value.get('description'),
          uid: value.get('uid'),
          photoUrL: value.get('photoURL'),
          email: value.get('email'),
          groups: value.get('groups')
      );
      print(user.uid);
      users.add(user);
      print(users);
    });

    return users;
  }

  Future<void> addMessage(
      Message message, UserModel sender, UserModel receiver) async {
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

  Future<void> sendGroupMessage(
      String groupId, GroupMessage chatMessageData) async {
    Map map = chatMessageData.toMap();
    return await groupsCol.doc(groupId).collection('messages').add(map);
  }

  Future addToGroup(
      String uid, String groupId) async {
    DocumentReference userDocRef = userInfo.doc(uid);
    DocumentSnapshot userDocSnapshot = await userDocRef.get();

    DocumentReference groupDocRef = groupsCol.doc(groupId);

    Map<String, dynamic> data = userDocSnapshot.data();
    List<dynamic> groups = data['groups'];
    //print('nay');
    await userDocRef.update({
      'groups': FieldValue.arrayUnion([groupId])
    });

    await groupDocRef.update({
      'members': FieldValue.arrayUnion([uid])
    });
  }

  // get chats of a particular group
  Stream<QuerySnapshot<Object>> getChats(String groupId) {
    return groupsCol
        .doc(groupId)
        .collection('messages')
        .orderBy('timeStamp',descending: true)
        .snapshots();
  }

  // search groups
  searchByName(String groupName) {
    return groupsCol.where('groupName', isEqualTo: groupName).get();
  }

  Future<String> getPersonalityTestResult(String userID) async {
    String pTestResult;
    Future<DocumentSnapshot> document = personality.doc(userID).get();
    await document.then<dynamic>((DocumentSnapshot value) async {
      pTestResult = value.get("personality");
    });
    return pTestResult;
  }

  Future<String> getSecondPersonality(String userID) async {
    String pTestResult;
    Future<DocumentSnapshot> document = personality.doc(userID).get();
    await document.then<dynamic>((DocumentSnapshot value) async {
      pTestResult = value.get("personality2");
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
