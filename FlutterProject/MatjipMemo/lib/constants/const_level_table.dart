class AppLevelTable {
  AppLevelTable._();

  static int? getMaxExp(int level) {
    Map<int, int> levelingTable = {
      1: 10,
      2: 25,
      3: 45,
      4: 75,
      5: 155,
      6: 355,
      7: 600,
      8: 1100,
      9: 2100,
      10: 3000,
      11: 5000,
      12: 8000,
      13: 13000,
      14: 20000,
      15: 33000,
      16: 50000,
      17: 70000,
      18: 100000
    };
    if (levelingTable[level] != null) {
      return levelingTable[level];
    }

    ///둘 다 관리하지말고 로컬로만 관리하자
    /* DatabaseReference ref = FirebaseDatabase.instance.ref();
    final snapshot = await ref.child('levelingTable').get();
    if (snapshot.exists) {
      logger.d('snapshot.value : ${snapshot.value}');
      Map<dynamic, dynamic> levelTable = snapshot.value as Map<dynamic, dynamic>;
      return levelTable[level.toString()];
    }*/
    return null;
  }

  static int? getMaxPrice(int level) {
    Map<int, int> priceTable = {
      1: 0,
      2: 10,
      3: 50,
      4: 10,
      5: 200,
      6: 350,
      7: 500,
      8: 700,
      9: 1000,
      10: 2000,
      11: 3000,
      12: 5000,
      13: 7000,
      14: 10000,
      15: 12000,
      16: 15000,
      17: 18000,
      18: 20000,
    };
    if (priceTable[level] != null) {
      if (level > 18) {
        return priceTable[18];
      }
      return priceTable[level];
    }

    ///둘 다 관리하지말고 로컬로만 관리하자
    return null;
  }
}
