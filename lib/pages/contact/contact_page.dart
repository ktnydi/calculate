import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Contact extends StatefulWidget {
  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  final _url =
      'https://docs.google.com/forms/d/e/1FAIpQLSe_4ggMubBXHaUCRqEbDckA1Eibx-zt8K4F6V-K0lXuSRqBiQ/viewform?usp=sf_link';
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
