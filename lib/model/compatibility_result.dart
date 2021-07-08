import 'package:flutter/material.dart';
import 'package:matched_app/model/personality_result.dart';

class CompatibilityResult {
  final PersonalityResult myPersonalityResult;
  final PersonalityResult yourPersonalityResult;
  final String myUid;
  final String yourUid;
  final double finalScore;

  CompatibilityResult( {
    Key key,
    this.myPersonalityResult,
    this.yourPersonalityResult,
    this.myUid,
    this.yourUid,
    this.finalScore,
  });
}
