import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  final String url;

  const WebViewPage(this.url, {super.key});

  @override
  State createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  int _progress = 0;
  final controller = WebViewController();

  @override
  void initState() {
    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (progress) {
            if (_progress == 100) return;
            setState(() {
              _progress = progress;
            });
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          WebViewWidget(
            controller: controller,
          ),
          if (_progress != 100)
            LinearProgressIndicator(
              value: _progress / 100,
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.launch),
        onPressed: () async {
          final isValid = await canLaunchUrl(Uri.parse(widget.url));
          if (!isValid) return;
          await launchUrl(Uri.parse(widget.url));
        },
      ),
    );
  }
}
