import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class LoadMap extends StatefulWidget {
  @override
  _LoadMapState createState() => _LoadMapState();
}

class _LoadMapState extends State<LoadMap> {
  final _url = 'https://www.notion.so/9dd91417b57d414ca4b09765db0ba7f2';
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
              ..loadRequest(Uri.parse(_url)),
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
          final isValid = await canLaunchUrl(Uri.parse(_url));
          if (!isValid) return;
          await launchUrl(Uri.parse(_url));
        },
      ),
    );
  }
}
