import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/app.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  runApp(
    ProviderScope(
      child: App(
        intro: _prefs.getBool('intropage'),
      ),
    ),
  );
}
