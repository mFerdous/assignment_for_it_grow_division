import 'package:shared_preferences/shared_preferences.dart';

abstract class PartnerTokenSource {
  static const kPartnerTokenKey = "partner_token";
  Future<bool> savePartnerToken(String token);
  String getPartnerToken();
}

class PartnerTokenSourceImpl implements PartnerTokenSource {
  final SharedPreferences _preference;

  PartnerTokenSourceImpl(this._preference);
  @override
  String getPartnerToken() {
    return _preference.getString(PartnerTokenSource.kPartnerTokenKey) ?? "NO_TOKEN";
  }

  @override
  Future<bool> savePartnerToken(String token) {
    return _preference.setString(PartnerTokenSource.kPartnerTokenKey, token);
  }
}
