import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart';
import 'package:news_app/data/models/search_model.dart';
import 'package:news_app/data/models/top_headline_model.dart';

class ApiClient {
  Future<List<SearchModel>> search({required String query}) async {
    final Uri url = Uri.parse(
        'https://newsapi.org/v2/everything?q=$query&pageSize=10&apiKey=cc501d372ff14be6b481d3218f08de01');
    final response = await Client().get(url);
    final result = json.decode(response.body);

    final List sources = result['articles'];
    final List<SearchModel> data =
        sources.map((e) => SearchModel.fromJson(e)).toList();
    return data;
  }

  Future<List<TopHeadlineModel>> getTopHeadlines() async {
    final Uri url = Uri.parse(
        'https://newsapi.org/v2/top-headlines/sources?apiKey=cc501d372ff14be6b481d3218f08de01');
    final response = await Client().get(url);
    final result = json.decode(response.body);
    final List sources = result['sources'];
    final List<TopHeadlineModel> topHeadlines =
        sources.map((e) => TopHeadlineModel.fromJson(e)).toList();
    return topHeadlines;
  }

  Future<List<TopHeadlineModel>> getCategoryWiseNews(
      {required String category}) async {
    final Uri url = Uri.parse(
        'https://newsapi.org/v2/top-headlines/sources?category=$category&apiKey=cc501d372ff14be6b481d3218f08de01');
    final response = await Client().get(url);
    final result = json.decode(response.body);
    final List sources = result['sources'];
    final List<TopHeadlineModel> news =
        sources.map((e) => TopHeadlineModel.fromJson(e)).toList();
    return news;
  }
}
