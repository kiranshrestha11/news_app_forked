import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:news_app/presentation/onboarding/intro_page.dart';

class App extends StatelessWidget {
  const App({Key? key, required this.intro}) : super(key: key);
  final bool? intro;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: intro == null
          ? OnBoardingPage()
          : const HtmlEditorExample(
              title: "Add Data",
            ),
    );
  }
}

class HtmlEditorExample extends StatefulWidget {
  const HtmlEditorExample({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _HtmlEditorExampleState createState() => _HtmlEditorExampleState();
}

class _HtmlEditorExampleState extends State<HtmlEditorExample> {
  final QuillController _controller = QuillController.basic();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        QuillToolbar.basic(controller: _controller),
        Expanded(
          child: Container(
            child: QuillEditor.basic(
              controller: _controller,
              readOnly: false, // true for view only mode
            ),
          ),
        )
      ],
    ));
  }
}
