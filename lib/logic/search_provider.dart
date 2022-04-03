import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/data/api/api_client.dart';
import 'package:news_app/data/models/search_model.dart';

final searchProvider =
    FutureProvider.family<List<SearchModel>, String>((ref, query) async {
  return ApiClient().search(query: query);
});
