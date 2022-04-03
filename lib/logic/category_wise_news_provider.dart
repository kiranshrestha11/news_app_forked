import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/data/api/api_client.dart';
import 'package:news_app/data/models/top_headline_model.dart';

final categoryWiseNewsProvider =
    FutureProvider.family<List<TopHeadlineModel>, String>((ref, cat) async {
  return ApiClient().getCategoryWiseNews(category: cat);
});
