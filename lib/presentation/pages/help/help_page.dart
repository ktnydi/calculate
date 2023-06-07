import 'package:app_review/app_review.dart';
import 'package:calculate/providers.dart';
import 'package:calculate/presentation/pages/web_view/web_view_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Help extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ヘルプ'),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 16),
          const Divider(height: 1),
          ListTile(
            title: Text('フィードバック'),
            trailing: Icon(Icons.navigate_next),
            tileColor: Colors.white,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => WebViewPage(
                    'https://docs.google.com/forms/d/e/1FAIpQLSe_4ggMubBXHaUCRqEbDckA1Eibx-zt8K4F6V-K0lXuSRqBiQ/viewform?usp=sf_link',
                  ),
                ),
              );
            },
          ),
          const Divider(height: 1),
          ListTile(
            title: Text('ロードマップ'),
            trailing: Icon(Icons.navigate_next),
            tileColor: Colors.white,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => WebViewPage(
                    'https://toothsome-persimmon-e89.notion.site/9dd91417b57d414ca4b09765db0ba7f2',
                  ),
                ),
              );
            },
          ),
          const Divider(height: 1),
          ListTile(
            title: Text('アプリを評価'),
            trailing: Icon(Icons.navigate_next),
            tileColor: Colors.white,
            onTap: () async {
              if (await AppReview.isRequestReviewAvailable) {
                await AppReview.requestReview;
              }
            },
          ),
          const Divider(height: 1),
          Consumer(
            builder: (context, ref, child) {
              final packageInfo = ref.watch(packageInfoProvider);
              return ListTile(
                title: Text('ライセンス'),
                trailing: Icon(Icons.navigate_next),
                tileColor: Colors.white,
                onTap: () {
                  showLicensePage(
                    context: context,
                    applicationName: packageInfo.appName,
                    applicationVersion: packageInfo.version,
                  );
                },
              );
            },
          ),
          const Divider(height: 1),
          ListTile(
            title: Text('利用規約'),
            trailing: Icon(Icons.navigate_next),
            tileColor: Colors.white,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => WebViewPage(
                    'https://toothsome-persimmon-e89.notion.site/dc7d95253ab1441c9ec099c1b79e2c67',
                  ),
                ),
              );
            },
          ),
          const Divider(height: 1),
          ListTile(
            title: Text('プライバシーポリシー'),
            trailing: Icon(Icons.navigate_next),
            tileColor: Colors.white,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => WebViewPage(
                    'https://toothsome-persimmon-e89.notion.site/d9bdcb0258c846eb987f08e583dd7ff2',
                  ),
                ),
              );
            },
          ),
          const Divider(height: 1),
          Consumer(
            builder: (context, ref, child) {
              final packageInfo = ref.watch(packageInfoProvider);
              return ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('バージョン'),
                    Text(
                      '${packageInfo.version}+${packageInfo.buildNumber}',
                      style: TextStyle(
                        color: Theme.of(context).textTheme.bodySmall!.color,
                      ),
                    ),
                  ],
                ),
                tileColor: Colors.white,
              );
            },
          ),
          const Divider(height: 1),
        ],
      ),
    );
  }
}
