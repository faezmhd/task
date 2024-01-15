import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewWidget extends StatelessWidget {
  final String initialUrl;

  const WebViewWidget({required this.initialUrl});

  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: initialUrl,
      javascriptMode: JavascriptMode.unrestricted,
    );
  }
}

class WebViewPage extends StatefulWidget {
  final String initialUrl;

  const WebViewPage({Key? key, required this.initialUrl}) : super(key: key);

  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  late WebViewController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: WebViewWidget(initialUrl: widget.initialUrl),
      ),
    );
  }
}
