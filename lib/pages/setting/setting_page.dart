import 'package:calculate/pages/setting/setting_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Setting extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final settingState = watch(settingProvider);
    final settingNotifier = watch(settingProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: Text('設定'),
      ),
      body: ListView(
        children: [
          // TODO: 出題順の設定
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text('出題順'),
          ),
          const Divider(height: 1),
          ListTile(
            title: Text('ランダムに出題する'),
            trailing: Switch(
              value: settingState.isRandom,
              onChanged: (value) async {
                await settingNotifier.updateRandom(value);
              },
            ),
            tileColor: Colors.white,
          ),
          const Divider(height: 1),
          // TODO: 制限時間の設定
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text('制限時間'),
          ),
          const Divider(height: 1),
          ListTile(
            leading: Radio(
              value: 1,
              groupValue: 1,
              onChanged: (value) {},
            ),
            title: Text('180秒（3分）'),
            tileColor: Colors.white,
          ),
          const Divider(height: 1),
          ListTile(
            leading: Radio(
              value: 2,
              groupValue: 1,
              onChanged: (value) {},
            ),
            title: Text('240秒（4分）'),
            tileColor: Colors.white,
          ),
          const Divider(height: 1),
          ListTile(
            leading: Radio(
              value: 3,
              groupValue: 1,
              onChanged: (value) {},
            ),
            title: Text('300秒（5分）'),
            tileColor: Colors.white,
          ),
          const Divider(height: 1),
          // TODO: 問題数の設定
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text('問題数'),
          ),
          const Divider(height: 1),
          ListTile(
            leading: Radio(
              value: 50,
              groupValue: 100,
              onChanged: (value) {},
            ),
            title: Text('50問'),
            tileColor: Colors.white,
          ),
          const Divider(height: 1),
          ListTile(
            leading: Radio(
              value: 100,
              groupValue: 100,
              onChanged: (value) {},
            ),
            title: Text('100問'),
            tileColor: Colors.white,
          ),
          const Divider(height: 1),
        ],
      ),
    );
  }
}
