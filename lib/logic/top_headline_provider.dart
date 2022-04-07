import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/data/api/api_client.dart';
import 'package:news_app/data/models/top_headline_model.dart';

final topHeadlineProvider =
    FutureProvider.autoDispose<List<TopHeadlineModel>>((ref) async {
  ref.maintainState = false;
  return ApiClient().getTopHeadlines();
});
