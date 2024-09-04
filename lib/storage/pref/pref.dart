import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  final String key = "counter";

  Future<void> saveCounter(int counter) async {
    final pref = await SharedPreferences.getInstance();
    bool handle = await pref.setInt(key, counter);
    log(handle ? "Save successfully" : "Failed to save counter");
  }

  Future<int> getCounter() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getInt(key) ?? 0;
  }
}
