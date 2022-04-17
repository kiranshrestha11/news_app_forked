import 'package:flutter/material.dart';
import 'package:news_app/presentation/onboarding/intro_page.dart';
import 'package:news_app/presentation/onboarding/signup_page.dart';
import 'package:news_app/presentation/todo_page.dart';

class App extends StatelessWidget {
  const App({
    Key? key,
    required this.intro,
    required this.loggedin,
  }) : super(key: key);
  final bool? intro;
  final bool? loggedin;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: intro == null
          ? OnBoardingPage()
          : loggedin == null
              ? SignUpPage()
              : const TodoPage(),
    );
  }
}
