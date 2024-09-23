
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webbing_fixed/core/resource/app_string.dart';

class CacheHelper {
  static SharedPreferences? _sharedPreferences;

  static Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> putBoolean({
    required String key,
    required bool value,
  }) async {
    return await _sharedPreferences!.setBool(key, value);
  }

  static dynamic getData({
    required String key,
  }) {
    return _sharedPreferences!.get(key);
  }

  static Future<bool> saveData({
    required String key,
    required dynamic value,
  }) async {
    if (value is String) return await _sharedPreferences!.setString(key, value);
    if (value is int) return await _sharedPreferences!.setInt(key, value);
    if (value is bool) return await _sharedPreferences!.setBool(key, value);

    return await _sharedPreferences!.setDouble(key, value);
  }

  static Future<bool> removeData({
    required String key,
  }) async {
    return await _sharedPreferences!.remove(key);
  }

  // User-specific methods
  static Future<void> saveUserId(String userId) async {
    await _sharedPreferences!.setString('userId', userId);
  }

  static String? getUserId() {
    return _sharedPreferences!.getString('userId');
  }

  static Future<void> saveEmail(String email) async {
    await _sharedPreferences!.setString(AppString.keyEmail, email);
  }

  static String? getEmail() {
    return _sharedPreferences!.getString(AppString.keyEmail);
  }

  static Future<void> saveToken(String token) async {
    await _sharedPreferences!.setString(AppString.keyToken, token);
  }

  static String? getToken() {
    return _sharedPreferences!.getString(AppString.keyToken);
  }

  static Future<void> clearToken() async {
    await _sharedPreferences!.remove(AppString.keyToken);
  }

  static Future<void> saveUserRole(bool isSuperAdmin) async {
    await _sharedPreferences!.setBool('isSuperAdmin', isSuperAdmin);
  }

  static bool? getUserRole() {
    return _sharedPreferences!.getBool('isSuperAdmin');
  }

  static Future<void> loginUser(
      String userId, String email, String token, bool isSuperAdmin) async {
    await saveUserId(userId);
    await saveEmail(email);
    await saveToken(token);
    await saveUserRole(isSuperAdmin);
  }


}
