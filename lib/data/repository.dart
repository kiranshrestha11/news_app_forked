import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:news_app/data/data%20sources/local_resource.dart';
import 'package:news_app/data/data%20sources/remote_resource.dart';
import 'package:news_app/data/models/post_model.dart';

import '../core/config.dart';

abstract class Repository {
  Future<List<PostModel>> getAllPosts();
}

class RepositoryImpl implements Repository {
  @override
  Future<List<PostModel>> getAllPosts() async {
    try {
      final List data = await RemoteResource().getPostsFromApi();
      final List<PostModel> posts =
          data.map((e) => PostModel.fromJson(e)).toList();
      await LocalResource()
          .addLocalData(localKey: Config.posts, value: json.encode(data));
      log('loading from internet');
      return posts;
    } on SocketException {
      log('loading from local db');
      return await LocalResource().getPostsFromLocal();
    }
  }
}
