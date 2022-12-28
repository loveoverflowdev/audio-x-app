import 'package:flutter/material.dart';

import 'package:webview_flutter/webview_flutter.dart';

class ForumPage extends StatefulWidget {
  const ForumPage({super.key});

  @override
  State<ForumPage> createState() => _ForumPageState();
}

class _ForumPageState extends State<ForumPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Diễn đàn'),
      ),
      body: const WebView(
        initialUrl: 'https://post-it-heroku.herokuapp.com/',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
