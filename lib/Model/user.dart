import 'package:flutter/material.dart';

class UserModel {
  final String uid;
  final String name;
  final String email;
  final String photoUrL;
  final String type;
  final String description;
  final List<dynamic> groups;
  final List<dynamic> caseSearch;

  UserModel({
    Key key,
    @required this.uid,
    @required this.groups,
    @required this.name,
    @required this.email,
    @required this.photoUrL,
    @required this.type,
    @required this.description,
    @required this.caseSearch
  });
}
