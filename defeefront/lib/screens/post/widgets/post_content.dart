import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PostContent extends StatefulWidget {
  final String url;

  const PostContent({Key? key, required this.url}) : super(key: key);

  @override
  State<PostContent> createState() => _PostContentState();
}

class _PostContentState extends State<PostContent> {
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
    return WebViewWidget(controller: _controller); // WebView 자체에서 스크롤 처리
  }
}
