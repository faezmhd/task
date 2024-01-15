import 'package:flutter/material.dart';
import 'package:newone/screens/webview_page_dart.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  TextEditingController urlController = TextEditingController();

  void _navigateToWebViewPage(BuildContext context) {
    String enteredUrl = urlController.text;
    if (enteredUrl.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => WebViewPage(initialUrl: enteredUrl),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enter URL'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: urlController,
                decoration: InputDecoration(
                  hintText: 'Enter URL',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                _navigateToWebViewPage(context);
              },
              child: const Text('Search'),
            ),
          ],
        ),
      ),
    );
  }
}
