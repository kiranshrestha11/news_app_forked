import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/data/models/post_model.dart';
import 'package:news_app/data/repository.dart';
import 'package:news_app/logic/post/post_states.dart';

class PostNotifier extends StateNotifier<PostState> {
  PostNotifier() : super(PostInitial()) {
    loadPosts();
  }

  List<PostModel> internalPosts = [];

  removeData(PostModel post) {
    state = PostLoaded(posts: internalPosts..remove(post));
  }

  loadPosts() async {
    state = PostLoading();
    try {
      final List<PostModel> result = await RepositoryImpl().getAllPosts();
      internalPosts.addAll(result);
      state = PostLoaded(posts: result);
    } catch (e) {
      state = PostError(error: e.toString());
    }
  }
}

final postProvider = StateNotifierProvider<PostNotifier, PostState>((ref) {
  return PostNotifier();
});
