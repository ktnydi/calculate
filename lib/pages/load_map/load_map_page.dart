import 'dart:io';

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
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          WebView(
            initialUrl: _url,
            javascriptMode: JavascriptMode.unrestricted,
            onProgress: (progress) {
              setState(() {
                isLoading = progress != 100;
              });
            },
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
          final isValid = await canLaunch(_url);
          if (!isValid) return;
          await launch(_url);
        },
      ),
    );
  }
}
