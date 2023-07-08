import 'package:shared_preferences/shared_preferences.dart';

abstract class TokenSource {
  static const kUserIdKey = "user_id";
  static const kAccessTokenKey = "access_token";
  Future<bool> saveToken(String token);
  Future<bool> saveUserId(String userId);
  String getToken();
  String getUserId();
}

class TokenSourceImpl implements TokenSource {
  final SharedPreferences _preference;

  TokenSourceImpl(this._preference);
  @override
  String getToken() {
    return _preference.getString(TokenSource.kAccessTokenKey) ?? "NO_TOKEN";
  }

  @override
  Future<bool> saveToken(String token) {
    return _preference.setString(TokenSource.kAccessTokenKey, token);
  }
  @override
  String getUserId() {
    return _preference.getString(TokenSource.kUserIdKey) ?? "NO_USER_ID";
  }

  @override
  Future<bool> saveUserId(String userId) {
    return _preference.setString(TokenSource.kUserIdKey, userId);
  }
}
