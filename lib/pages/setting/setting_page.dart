import 'package:calculate/enums/flavor.dart';
import 'package:calculate/pages/setting/setting_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Setting extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final flavor = watch(flavorProvider);
    final settingState = watch(settingProvider);
    final settingNotifier = watch(settingProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: Text('設定'),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text('制限時間'),
          ),
          if (flavor == Flavor.development) const Divider(height: 1),
          if (flavor == Flavor.development)
            RadioListTile<int>(
              value: 10,
              groupValue: settingState.limit,
              onChanged: (value) async {
                if (value == null) return;
                await settingNotifier.updateLimit(value);
              },
              title: Text('10秒（開発環境）'),
              tileColor: Colors.white,
            ),
          const Divider(height: 1),
          RadioListTile<int>(
            value: 180,
            groupValue: settingState.limit,
            onChanged: (value) async {
              if (value == null) return;
              await settingNotifier.updateLimit(value);
            },
            title: Text('180秒（3分）'),
            tileColor: Colors.white,
          ),
          const Divider(height: 1),
          RadioListTile<int>(
            value: 240,
            groupValue: settingState.limit,
            onChanged: (value) async {
              if (value == null) return;
              await settingNotifier.updateLimit(value);
            },
            title: Text('240秒（4分）'),
            tileColor: Colors.white,
          ),
          const Divider(height: 1),
          RadioListTile<int>(
            value: 300,
            groupValue: settingState.limit,
            onChanged: (value) async {
              if (value == null) return;
              await settingNotifier.updateLimit(value);
            },
            title: Text('300秒（5分）'),
            tileColor: Colors.white,
          ),
          const Divider(height: 1),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text('問題数'),
          ),
          if (flavor == Flavor.development) const Divider(height: 1),
          if (flavor == Flavor.development)
            RadioListTile<int>(
              value: 2,
              groupValue: settingState.quizLength,
              onChanged: (value) async {
                if (value == null) return;
                await settingNotifier.updateQuizLength(value);
              },
              title: Text('2問（開発環境）'),
              tileColor: Colors.white,
            ),
          const Divider(height: 1),
          RadioListTile<int>(
            value: 50,
            groupValue: settingState.quizLength,
            onChanged: (value) async {
              if (value == null) return;
              await settingNotifier.updateQuizLength(value);
            },
            title: Text('50問'),
            tileColor: Colors.white,
          ),
          const Divider(height: 1),
          RadioListTile<int>(
            value: 100,
            groupValue: settingState.quizLength,
            onChanged: (value) async {
              if (value == null) return;
              await settingNotifier.updateQuizLength(value);
            },
            title: Text('100問'),
            tileColor: Colors.white,
          ),
          const Divider(height: 1),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text('キーボードの位置'),
          ),
          const Divider(height: 1),
          RadioListTile<int>(
            value: 0,
            groupValue: settingState.keyboardLocation,
            onChanged: (value) async {
              if (value == null) return;
              await settingNotifier.updateKeyboardLocation(value);
            },
            title: Text('標準（デフォルト）'),
            tileColor: Colors.white,
          ),
          const Divider(height: 1),
          RadioListTile<int>(
            value: 1,
            groupValue: settingState.keyboardLocation,
            onChanged: (value) async {
              if (value == null) return;
              await settingNotifier.updateKeyboardLocation(value);
            },
            title: Text('左'),
            tileColor: Colors.white,
          ),
          const Divider(height: 1),
          RadioListTile<int>(
            value: 2,
            groupValue: settingState.keyboardLocation,
            onChanged: (value) async {
              if (value == null) return;
              await settingNotifier.updateKeyboardLocation(value);
            },
            title: Text('右'),
            tileColor: Colors.white,
          ),
          const Divider(height: 1),
        ],
      ),
    );
  }
}
