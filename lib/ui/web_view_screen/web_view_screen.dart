import 'package:flutter/material.dart';
import 'package:nasa_app/ui/widgets/app_bar_widget.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  final String title;
  final String url;

  const WebViewScreen({required this.title, required this.url, Key? key,})
      : super(key: key);

  @override
  _WebViewScreenState createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  int loadingPercentage = 0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBarWidget(
        title: widget.title,
        onBackTap: () => Navigator.pop(context),
      ),
      body: Stack(
        children: [
          WebView(
            initialUrl: widget.url,
            onPageStarted: (url) {
              setState(() {
                loadingPercentage = 0;
              });
            },
            onProgress: (progress) {
              setState(() {
                loadingPercentage = progress;
              });
            },
            onPageFinished: (url) {
              setState(() {
                loadingPercentage = 100;
              });
            },
          ),
            LinearProgressIndicator(
              value: loadingPercentage / 100.0,
            ),
        ],
      ),
    );
  }
}
