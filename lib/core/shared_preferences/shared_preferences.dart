import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static const _isLoggedInKey = "isLoggedIn";
  static const _userMailId = "userMailId";
  static const _userName = "userName";

  ////check is the user has loged in or nit
  static Future<void> setIsLoggedIn(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_isLoggedInKey, value);
  }

  static Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_isLoggedInKey) ?? false;
  }

  ////User email
  static Future<void> setUserMailId(String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userMailId, value);
  }

  static Future<String> getUserMailId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_userMailId) ?? '';
  }

    ////User email
  static Future<void> setUserName(String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userName, value);
  }

  static Future<String> getUserName() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_userName) ?? '';
  }
}
