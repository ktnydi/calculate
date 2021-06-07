import 'package:calculate/pages/contact/contact_page.dart';
import 'package:calculate/pages/load_map/load_map_page.dart';
import 'package:calculate/providers.dart';
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
            title: Text('お問い合わせ・バグの報告'),
            trailing: Icon(Icons.navigate_next),
            tileColor: Colors.white,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Contact(),
                ),
              );
            },
          ),
          const Divider(height: 1),
          ListTile(
            title: Text('ご要望を送る'),
            trailing: Icon(Icons.navigate_next),
            tileColor: Colors.white,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Contact(),
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
                  builder: (context) => LoadMap(),
                ),
              );
            },
          ),
          const Divider(height: 1),
          ListTile(
            title: Text('アプリを評価'),
            trailing: Icon(Icons.navigate_next),
            tileColor: Colors.white,
            onTap: () {
              // TODO: アプリストアへ
            },
          ),
          const Divider(height: 1),
          Consumer(
            builder: (context, watch, child) {
              final packageInfo = watch(packageInfoProvider);
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
          Consumer(
            builder: (context, watch, child) {
              final packageInfo = watch(packageInfoProvider);
              return ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('バージョン'),
                    Text(
                      '${packageInfo.version}+${packageInfo.buildNumber}',
                      style: TextStyle(
                        color: Theme.of(context).textTheme.caption!.color,
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
