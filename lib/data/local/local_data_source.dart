import 'dart:convert';

import 'package:news_app/data/models/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalDataSource {
  Future<LoginModel> getProfile() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    final result = _prefs.getString('userData');
    final data = jsonDecode(result!);
    return LoginModel.fromJson(data);
  }
}
