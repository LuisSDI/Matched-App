class Result {
  List<int> allResults = List<int>.filled(18, 0, growable: false);
  String res = "";
  Result(String res) {
    this.res = res;

    initRes();
    if (res.compareTo("") != 0) {
      this.res = res;
    }
  }

  void initRes() {
    res = "";
    allResults.forEach((element) => res += element.toString());
  }

  double calculateMatch(Result result) {
    double val = 0;
    int size = this.res.length;
    int diffTotal = 0;
    List<String> array1 = this.res.split('');
    List<String> array2 = result.res.split('');
    for (var i = 0; i < array1.length; i++) {
      String temp1 = array1[i];
      String temp2 = array2[i];
      int a1 = int.parse(temp1);
      int a2 = int.parse(temp2);
      int diff = a1 - a2;
      diff = diff.abs();
      diffTotal += diff;
      val += (diff * 20) / size;
    }
    val = 100 - val;
    print("diffTotal :" + diffTotal.toString());
    return val;
  }
}
