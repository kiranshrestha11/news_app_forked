import 'package:flutter/material.dart';
import 'package:news_app/presentation/posts/post_page.dart';

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
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PostPage(),
      // home: intro == null
      //     ? OnBoardingPage()
      //     : loggedin == null
      //         ? const LoginPage()
      //         : const TodoPage(),
    );
  }
}
