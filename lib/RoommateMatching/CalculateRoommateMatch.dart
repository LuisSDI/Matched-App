import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:matched_app/MatchingQuizz/result.dart';

class CalculateRoommateMatching {
  String uid, identifier;
  CalculateRoommateMatching(this.identifier, this.uid);
  Future<List<String>> getMatchingUserUID() async {
    List<String> result = [];
    String max = "";
    double maxVal = 0, newVal = 0;
    await FirebaseFirestore.instance
        .collection('RoommateMatching')
        .where("identifier", isEqualTo: identifier)
        .limit(1)
        .get()
        .then((QuerySnapshot value) async {
      if (value.docs.length >= 4) {
        String val = value.docs.first.get("result").toString();
        for (int i = 0; i <= 4; i++) {
          max = "999999999999999999";
          await FirebaseFirestore.instance
              .collection('RoommateMatching')
              .orderBy("identifier")
              .get()
              .then((QuerySnapshot valueAll) async {
            valueAll.docs.forEach((element) {
              String temp = element.get("result");
              if (result.contains(element.get("identifier"))) {
              } else {
                Result r = Result(val);
                maxVal = r.calculateMatch(Result(max));
                newVal = r.calculateMatch(Result(temp));
                if (maxVal < newVal) {
                  maxVal = newVal;
                  max = temp;
                }
              }
            });
          }).then((value) {
            result.add(max);
          });
        }

        // RouterCustom route = RouterCustom();
        // Navigator.of(context).push(route.toTestDone());

        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //       builder: (context) => TestDonePage(
        //             identifier: widget.identifier,
        //           )),
        // );

        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => TestDonePage()),
        // );
      }
    });
    return result;
  }
}
