import 'dart:convert';
import 'dart:developer';

import 'package:news_app/core/config.dart';
import 'package:news_app/data/api/local_db_client.dart';
import 'package:news_app/data/models/post_model.dart';

class LocalResource {
  Future<List<PostModel>> getPostsFromLocal() async {
    final localString = await LocalDbClient().getData(localKey: Config.posts);
    final List data = json.decode(localString);
    return data.map((e) => PostModel.fromJson(e)).toList();
  }

  Future addLocalData({required String localKey, required String value}) async {
    log('saving to local db');
    await LocalDbClient().postData(localKey: localKey, value: value);
  }
}
