import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/data/local/local_data_source.dart';
import 'package:news_app/data/models/login_model.dart';

final userDataProvider = FutureProvider.autoDispose<LoginModel>((ref) async {
  return LocalDataSource().getProfile();
});
