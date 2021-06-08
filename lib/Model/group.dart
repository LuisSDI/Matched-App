import 'package:flutter/material.dart';
import 'package:matched_app/Model/group_message.dart';

class GroupModel {
  final String groupId;
  final String groupName;
  final List<dynamic> members;
  final String groupImage;


  GroupModel({
    Key key,
    @required this.groupId,
    @required this.groupName,
    @required this.members,
    @required this.groupImage,
  });
}