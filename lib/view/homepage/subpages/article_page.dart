import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class FullArticlePage extends StatefulWidget {
  final String url;

  const FullArticlePage({super.key, required this.url});

  @override
  State<FullArticlePage> createState() => _FullArticlePageState();
}

class _FullArticlePageState extends State<FullArticlePage> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Full Article')),
      body: WebViewWidget(controller: _controller),
    );
  }
}
