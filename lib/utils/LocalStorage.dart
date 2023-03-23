import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static setTheme(int i) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setInt('Theme', i);
  }

  static getTheme(String k) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.getInt(k);
  }
}
