import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:matched_app/main_pages/test_pages/personality_test/personality_test_info.dart';
import 'package:matched_app/model/group.dart';
import 'package:matched_app/model/group_message.dart';
import 'package:matched_app/model/messages.dart';
import 'package:matched_app/model/personality_result.dart';
import 'package:matched_app/model/user.dart';

//TODO: Start implementing the Roommate Test

class CloudFireStoreAPI {
  final CollectionReference userInfo =
      FirebaseFirestore.instance.collection('userInfo');

  final CollectionReference groupsCol =
      FirebaseFirestore.instance.collection('groups');

  final CollectionReference messages =
      FirebaseFirestore.instance.collection('messages');

  final CollectionReference personality =
      FirebaseFirestore.instance.collection('personalityResults');

  final CollectionReference roommate =
      FirebaseFirestore.instance.collection('roommate');

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
      userInfo.doc(user.uid).set({
        'uid': user.uid,
        'caseSearch': substring,
        'full name': user.name,
        'personality': user.personality,
        'gender': user.gender,
        'email': user.email,
        'photoURL': user.photoUrL,
        'type': user.type,
        'description': user.description,
        'lastSignIn': DateTime.now(),
        'groups': FieldValue.arrayUnion(user.groups)
      }, SetOptions(merge: true)).then((value) => print('User Register'));
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
      'personality': user.personality,
      'gender': user.gender,
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
    await userInfo.doc(userUid).get().then((value) {
      print(value.data());
      user = UserModel(
          name: value.get('full name'),
          type: value.get('type'),
          personality: value.get('personality'),
          gender: value.get('gender'),
          description: value.get('description'),
          uid: value.get('uid'),
          photoUrL: value.get('photoURL'),
          email: value.get('email'),
          caseSearch: value.get('caseSearch'),
          groups: value.get('groups'));
    });
    print(user);
    return user;
  }

  Future<GroupModel> searchGroup(String groupName) async {
    GroupModel group;
    var querySnapshot =
        await groupsCol.where('groupName', isEqualTo: groupName).get();
    DocumentSnapshot value = querySnapshot.docs.first;
    print(value.data());
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
    value.docs.forEach((value) {
      print(value.data());
      user = UserModel(
          name: value.get('full name'),
          type: value.get('type'),
          personality: value.get('personality'),
          gender: value.get('gender'),
          description: value.get('description'),
          uid: value.get('uid'),
          photoUrL: value.get('photoURL'),
          email: value.get('email'),
          groups: value.get('groups'));
      print(user.uid);
      users.add(user);
      print(users);
    });

    return users;
  }

  Future<List<GroupModel>> getListGroups(UserModel user) async {
    List<GroupModel> groups = [];
    GroupModel group;
    var querySnapshot =
        await groupsCol.where('groupID', whereIn: user.groups).get();
    querySnapshot.docs.forEach((result) {
      //print(result.data());
      group = GroupModel(
          groupId: result.get('groupID'),
          groupName: result.get('groupName'),
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
    var value = await userInfo.where('uid', whereIn: group.members).get();
    value.docs.forEach((value) {
      print(value.data());
      user = UserModel(
          name: value.get('full name'),
          type: value.get('type'),
          description: value.get('description'),
          personality: value.get('personality'),
          gender: value.get('gender'),
          uid: value.get('uid'),
          photoUrL: value.get('photoURL'),
          email: value.get('email'),
          groups: value.get('groups'));
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

  // create group
  Future createGroup(String groupName) async {
    DocumentReference groupDocRef = await groupsCol.add({
      'groupName': groupName,
      'groupImage': '',
      'members': [],
      'groupID': '',
    });

    await groupDocRef.update({'groupID': groupDocRef.id}).then(
        (value) => print('Group Created'));
  }

  Future addToGroup(String uid, String groupId) async {
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
        .orderBy('timeStamp', descending: true)
        .snapshots();
  }

  // search groups
  searchByName(String groupName) {
    return groupsCol.where('groupName', isEqualTo: groupName).get();
  }

  // PERSONALITY FUNCTIONS

  Future<void> sendPersonalityResult(
      UserModel user, PersonalityResult personalityResult) async {
    try {
      userInfo.doc(user.uid).update({
        'personality': personalityResult.personality,
      });

      await personality.doc(user.uid).set({
        'uid': user.uid,
        'eScore': personalityResult.eScore,
        'iScore': personalityResult.iScore,
        'sScore': personalityResult.sScore,
        'nScore': personalityResult.nScore,
        'tScore': personalityResult.tScore,
        'fScore': personalityResult.fScore,
        'jScore': personalityResult.jScore,
        'pScore': personalityResult.pScore,
        'personality': personalityResult.personality,
      }, SetOptions(merge: true)).then((value) => print('Results send'));

      Map<String, String> personalityName =
          PersonalityTestInfo().personalityName;
      Map<String, String> personalityRoles =
          PersonalityTestInfo().personalityRoles;
      await searchGroup(personalityName[personalityResult.personality])
          .then((value) => addToGroup(user.uid, value.groupId))
          .then((value) => print('Added to Group'));
      await searchGroup(personalityRoles[personalityResult.personality])
          .then((value) => addToGroup(user.uid, value.groupId))
          .then((value) => print('Added to Group'));
      if (personalityResult.personality[0] == 'I') {
        await searchGroup('Introvert').then((value) =>
            addToGroup(user.uid, value.groupId)
                .then((value) => print('Added to Group')));
      } else {
        await searchGroup('Extrovert')
            .then((value) => addToGroup(user.uid, value.groupId))
            .then((value) => print('Added to Group'));
      }
      if (personalityResult.personality[1] == 'S') {
        await searchGroup('Observant')
            .then((value) => addToGroup(user.uid, value.groupId))
            .then((value) => print('Added to Group'));
      } else {
        await searchGroup('Intuitive')
            .then((value) => addToGroup(user.uid, value.groupId))
            .then((value) => print('Added to Group'));
      }
      if (personalityResult.personality[2] == 'T') {
        await searchGroup('Thinking')
            .then((value) => addToGroup(user.uid, value.groupId))
            .then((value) => print('Added to Group'));
      } else {
        await searchGroup('Feeling')
            .then((value) => addToGroup(user.uid, value.groupId))
            .then((value) => print('Added to Group'));
      }
      if (personalityResult.personality[3] == 'J') {
        await searchGroup('Judging')
            .then((value) => addToGroup(user.uid, value.groupId))
            .then((value) => print('Added to Group'));
      } else {
        await searchGroup('Perceiving')
            .then((value) => addToGroup(user.uid, value.groupId))
            .then((value) => print('Added to Group'));
      }
    } catch (error) {
      print(error);
      switch (error.code) {
        case "ERROR_NETWORK_REQUEST_FAILED":
          errorMessage = "You are unable to connect";
          break;
        default:
          errorMessage = "An undefined Error happened.";
      }
    }
  }

  Future<PersonalityResult> getPersonalityResult(String userUid) async {
    PersonalityResult personalityResult;
    await personality.where('uid', isEqualTo: userUid).get().then((result) {
      DocumentSnapshot value = result.docs.first;
      print(value.data());
      personalityResult = PersonalityResult(eScore: value.get('eScore'),
        iScore: value.get('iScore'),
        sScore: value.get('sScore'),
        nScore: value.get('nScore'),
        tScore: value.get('tScore'),  fScore: value.get('fScore'),
        jScore: value.get('jScore') ,
        pScore: value.get('pScore'),
        personality: value.get('personality'),);
    }
    );
    return personalityResult;
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
