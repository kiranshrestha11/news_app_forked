import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/logic/post/post_notifier.dart';
import 'package:news_app/logic/post/post_states.dart';

class PostPage extends ConsumerWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final _state = ref.watch(postProvider);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Posts'),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (_state is PostInitial)
                  TextButton(
                    child: const Text('Load Posts'),
                    onPressed: () {
                      ref.read(postProvider.notifier).loadPosts();
                    },
                  ),
                if (_state is PostLoading) const CircularProgressIndicator(),
                if (_state is PostLoaded)
                  ..._state.posts.map(
                    (e) => ListTile(
                      onTap: () {
                        ref.read(postProvider.notifier).removeData(e);
                      },
                      title: Text(e.title),
                      subtitle: Text(e.body),
                    ),
                  ),
                if (_state is PostError)
                  TextButton(
                    child: Text(_state.error),
                    onPressed: () {
                      ref.read(postProvider.notifier).loadPosts();
                    },
                  )
              ],
            ),
          ),
        ));
  }
}
