import 'package:flutter/material.dart';
import 'package:news_app/presentation/home/home_screen.dart';
import 'package:news_app/presentation/onboarding/intro_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnBoardingPage(),
    );
  }
}
