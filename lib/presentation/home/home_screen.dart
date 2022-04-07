import 'package:flutter/material.dart';
import 'package:news_app/presentation/home/top_headline_section.dart';
import 'package:news_app/presentation/onboarding/intro_page.dart';
import 'package:news_app/presentation/search/search_page.dart';
import 'package:news_app/presentation/user/profile_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const ProfilePage()));
              },
              icon: const Icon(Icons.person)),
          IconButton(
              onPressed: () async {
                SharedPreferences _prefs =
                    await SharedPreferences.getInstance();
                _prefs.clear();
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => OnBoardingPage()));
              },
              icon: const Icon(Icons.logout)),
          IconButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const SearchPage();
                }));
              },
              icon: const Icon(Icons.search))
        ],
      ),
      body: ListView(
        children: const [TopHeadlineSection()],
      ),
    );
  }
}
