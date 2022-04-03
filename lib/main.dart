import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/app.dart';
import 'package:news_app/data/api/api_client.dart';

void main() {
  runApp(const ProviderScope(child: App()));
}
