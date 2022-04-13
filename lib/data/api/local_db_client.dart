import 'package:shared_preferences/shared_preferences.dart';

class LocalDbClient {
  Future getData({required String localKey}) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    return _prefs.getString(localKey);
  }

  Future postData({required String localKey, required String value}) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs.setString(localKey, value);
  }
}
