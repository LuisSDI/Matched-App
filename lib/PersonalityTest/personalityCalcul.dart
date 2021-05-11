import 'package:matched_app/MatchingQuizz/result.dart';

class PersonalityCalcul {
  Result r = Result('');
  String getPersonnality(String res) {
    String val = "";
    Result r = Result(res);
    Result dominant = Result.reinit(24, "213142324314234123411444"),
        influencing = Result.reinit(24, "432421411243141231242323"),
        steady = Result.reinit(24, "141334243431423342333211"),
        conscientious = Result.reinit(24, "324213132122312414124132");

    double dominantMatch = r.calculateMatchWithFour(dominant),
        influencingMatch = r.calculateMatchWithFour(influencing),
        steadyMatch = r.calculateMatchWithFour(steady),
        conscientiousMatch = r.calculateMatchWithFour(conscientious);

    if (dominantMatch >= influencingMatch &&
        dominantMatch >= steadyMatch &&
        dominantMatch >= conscientiousMatch) {
      val = "dominant - " + dominantMatch.toString() + "% ";
      if (influencingMatch >= steadyMatch &&
          influencingMatch >= conscientiousMatch) {
        val += "|influencing - " + influencingMatch.toString() + "% ";
      }
      if (steadyMatch >= influencingMatch &&
          steadyMatch >= conscientiousMatch) {
        val += "|steady - " + steadyMatch.toString() + "% ";
      }
      if (conscientiousMatch >= steadyMatch &&
          conscientiousMatch >= influencingMatch) {
        val += "|conscientious - " + conscientiousMatch.toString() + "% ";
      }
    }
    if (influencingMatch >= dominantMatch &&
        influencingMatch >= steadyMatch &&
        influencingMatch >= conscientiousMatch) {
      val = "influencing - " + influencingMatch.toString() + "% ";
      if (dominantMatch >= steadyMatch && dominantMatch >= conscientiousMatch) {
        val += "|dominant - " + dominantMatch.toString() + "% ";
      }
      if (steadyMatch >= dominantMatch && steadyMatch >= conscientiousMatch) {
        val += "|steady - " + steadyMatch.toString() + "% ";
      }
      if (conscientiousMatch >= steadyMatch &&
          conscientiousMatch >= dominantMatch) {
        val += "|conscientious - " + conscientiousMatch.toString() + "% ";
      }
    }
    if (steadyMatch >= influencingMatch &&
        steadyMatch >= dominantMatch &&
        steadyMatch >= conscientiousMatch) {
      val = "steady - " + steadyMatch.toString() + "% ";
      if (dominantMatch >= influencingMatch &&
          dominantMatch >= conscientiousMatch) {
        val += "|dominant - " + dominantMatch.toString() + "% ";
      }
      if (influencingMatch >= dominantMatch &&
          influencingMatch >= conscientiousMatch) {
        val += "|influencing - " + influencingMatch.toString() + "% ";
      }
      if (conscientiousMatch >= influencingMatch &&
          conscientiousMatch >= dominantMatch) {
        val += "|conscientious - " + conscientiousMatch.toString() + "% ";
      }
    }
    if (conscientiousMatch >= influencingMatch &&
        conscientiousMatch >= steadyMatch &&
        conscientiousMatch >= dominantMatch) {
      val = "conscientious - " + conscientiousMatch.toString() + "% ";
      if (dominantMatch >= steadyMatch && dominantMatch >= influencingMatch) {
        val += "|dominant - " + dominantMatch.toString() + "% ";
      }
      if (influencingMatch >= steadyMatch &&
          influencingMatch >= dominantMatch) {
        val += "|influencing - " + influencingMatch.toString() + "% ";
      }
      if (steadyMatch >= dominantMatch && steadyMatch >= influencingMatch) {
        val += "|steady - " + steadyMatch.toString() + "% ";
      }
    }
    return val;
  }
}
