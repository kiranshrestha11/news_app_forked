import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/data/models/top_headline_model.dart';
import 'package:news_app/logic/top_headline_provider.dart';
import 'package:news_app/presentation/categories/category_wise_news.dart';

class TopHeadlineSection extends ConsumerWidget {
  const TopHeadlineSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final _topHeadlines = ref.watch(topHeadlineProvider);
    return Column(
      children: [
        Text('Top Headlines'),
        Container(
          height: 200,
          child: _topHeadlines.when(
            data: (_data) {
              return ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  ..._data.map(
                    (e) => TopHeadlineCard(top: e),
                  ),
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
        ),
      ],
    );
  }
}

class TopHeadlineCard extends StatelessWidget {
  const TopHeadlineCard({Key? key, required this.top}) : super(key: key);
  final TopHeadlineModel top;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 300,
      margin: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
      decoration: BoxDecoration(color: Colors.blue.shade100),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              top.name,
              style: const TextStyle(
                fontSize: 20.0,
                color: Colors.black,
              ),
            ),
            const Divider(),
            Text(
              top.description,
              maxLines: 4,
              textAlign: TextAlign.justify,
              style: const TextStyle(
                fontSize: 16.0,
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return CategoryWiseNews(category: top.category);
                }));
              },
              child: Container(
                margin: const EdgeInsets.only(top: 4.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Text(top.category),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
