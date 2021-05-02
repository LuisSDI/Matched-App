import 'package:flutter/material.dart';

class UserModel {
  final String uid;
  final String name;
  final String email;
  final String photoUrL;
  final String type;
  final String description;

  UserModel({
    Key key,
    @required this.uid,
    @required this.name,
    @required this.email,
    @required this.photoUrL,
    @required this.type,
    @required this.description,
  });
}