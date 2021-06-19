import 'package:flutter/material.dart';

class PersonalityResult {
  final int eScore;
  final int iScore;
  final int sScore;
  final int nScore;
  final int tScore;
  final int fScore;
  final int jScore;
  final int pScore;
  final String personality;

  PersonalityResult({
    Key key,
    @required this.eScore,
    @required this.iScore,
    @required this.sScore,
    @required this.nScore,
    @required this.tScore,
    @required this.fScore,
    @required this.jScore,
    @required this.pScore,
    @required this.personality,
  });
}
