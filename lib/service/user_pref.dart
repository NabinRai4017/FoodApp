import 'package:food_app/service/shared_preferences.dart';
import 'package:food_app/service/storage_service.dart';

class UserConst {
  static const String key = 'USER_KEY';
  static const String authenticated = 'AUTHENTICATED';
  static const String email = 'EMAIL';
  static const String firstName = 'FIRST_NAME';
  static const String lastName = 'LAST_NAME';
  static const String username = 'USERNAME';
  static const String userId = 'USER_ID';
}

class UserPrefs {
  static Future<String> get userKey => StorageService().read(UserConst.key);

  static Future seUserkey(String value) =>
      StorageService().write(UserConst.key, value);

  static Future<bool> get authenticated =>
      SharedPreference.getBool(UserConst.authenticated);

  static Future setAuthenticated(bool value) =>
      SharedPreference.setBool(UserConst.authenticated, value);

  static Future<String> get email =>
      SharedPreference.getString(UserConst.email);

  static Future setEmail(String value) =>
      SharedPreference.setString(UserConst.email, value);

  static Future<String> get firstName =>
      SharedPreference.getString(UserConst.firstName);

  static Future setFirstName(String value) =>
      SharedPreference.setString(UserConst.firstName, value);

  static Future<String> get lastName =>
      SharedPreference.getString(UserConst.lastName);

  static Future setLastName(String value) =>
      SharedPreference.setString(UserConst.lastName, value);

  static Future<String> get username =>
      SharedPreference.getString(UserConst.username);

  static Future setUsername(String value) =>
      SharedPreference.setString(UserConst.username, value);

  static Future<int> get userId => SharedPreference.getInt(UserConst.userId);

  static Future setUserId(int value) =>
      SharedPreference.setInt(UserConst.userId, value);

  Future<void> clear() async {
    await Future.wait(<Future>[
      setAuthenticated(false),
      seUserkey(''),
      setEmail(''),
      setFirstName(''),
      setLastName(''),
      setUsername(''),
      setUserId(0),
    ]);
  }
}
