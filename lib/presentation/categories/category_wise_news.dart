import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/app.dart';
import 'package:news_app/logic/category_wise_news_provider.dart';

class CategoryWiseNews extends ConsumerWidget {
  const CategoryWiseNews({Key? key, required this.category}) : super(key: key);
  final String category;

  @override
  Widget build(BuildContext context, ref) {
    final _newsList = ref.watch(categoryWiseNewsProvider(category));
    return Scaffold(
      appBar: AppBar(
        title: Text(category),
      ),
      body: _newsList.when(
        data: (_newsList) {
          return ListView(
            children: [
              ..._newsList.map((e) => ListTile(
                    title: Text(e.name),
                    subtitle: Text(e.category),
                  ))
            ],
          );
        },
        error: (err, s) => Center(
          child: Text(err.toString()),
        ),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
