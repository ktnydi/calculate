import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  final String url;

  WebViewPage(this.url);

  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          WebViewWidget(
            controller: WebViewController()
              ..setJavaScriptMode(JavaScriptMode.unrestricted)
              ..setNavigationDelegate(
                NavigationDelegate(
                  onProgress: (progress) {
                    setState(() {
                      isLoading = progress != 100;
                    });
                  },
                ),
              )
              ..loadRequest(Uri.parse(widget.url)),
          ),
          if (isLoading)
            Center(
              child: CupertinoActivityIndicator(),
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.launch),
        onPressed: () async {
          final isValid = await canLaunchUrl(Uri.parse(widget.url));
          if (!isValid) return;
          await launchUrl(Uri.parse(widget.url));
        },
      ),
    );
  }
}
