import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static const _isLoggedInKey = "isLoggedIn";
  static const _userId = "userId";
  static const _userMailId = "userMailId";
  static const _userName = "userName";
  static const _playBgAudio = "playBgAudio";

  ////check is the user has loged in or nit
  static Future<void> setIsLoggedIn(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_isLoggedInKey, value);
  }

  static Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_isLoggedInKey) ?? false;
  }

  ////User id
  static Future<void> setUserId(String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userId, value);
  }

  static Future<String> getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_userId) ?? '';
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

  ////Play bg audio consent
  static Future<void> setPlayBgAudio(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_playBgAudio, value);
  }

  static Future<bool> getPlayBgAudio() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_playBgAudio) ?? true;
  }

  ////Clears all
  static Future<void> clearAll() async {
    // final prefs = await SharedPreferences.getInstance();
    await Future.wait([setIsLoggedIn(false), setUserId(""), setUserMailId("")]);
  }
}
