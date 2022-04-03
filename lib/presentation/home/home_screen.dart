import 'package:flutter/material.dart';
import 'package:news_app/presentation/home/top_headline_section.dart';
import 'package:news_app/presentation/search/search_page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return SearchPage();
                }));
              },
              icon: const Icon(Icons.search))
        ],
      ),
      body: ListView(
        children: [const TopHeadlineSection()],
      ),
    );
  }
}
