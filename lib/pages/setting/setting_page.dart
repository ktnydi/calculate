import 'package:calculate/enums/flavor.dart';
import 'package:calculate/enums/quizType.dart';
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
            child: Text('問題形式'),
          ),
          const Divider(height: 1),
          RadioListTile<QuizType>(
            value: QuizType.numQuizzes,
            groupValue: settingState.quizType,
            onChanged: (value) {
              if (value == null) return;
              settingNotifier.updateQuizType(value);
            },
            title: Text('問題数'),
            tileColor: Colors.white,
          ),
          if (settingState.quizType == QuizType.numQuizzes)
            const Divider(height: 1),
          if (settingState.quizType == QuizType.numQuizzes)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
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
                    contentPadding: EdgeInsets.only(left: 48),
                  ),
                RadioListTile<int>(
                  value: 10,
                  groupValue: settingState.quizLength,
                  onChanged: (value) async {
                    if (value == null) return;
                    await settingNotifier.updateQuizLength(value);
                  },
                  title: Text('10問'),
                  tileColor: Colors.white,
                  contentPadding: EdgeInsets.only(left: 48),
                ),
                RadioListTile<int>(
                  value: 20,
                  groupValue: settingState.quizLength,
                  onChanged: (value) async {
                    if (value == null) return;
                    await settingNotifier.updateQuizLength(value);
                  },
                  title: Text('20問'),
                  tileColor: Colors.white,
                  contentPadding: EdgeInsets.only(left: 48),
                ),
                RadioListTile<int>(
                  value: 30,
                  groupValue: settingState.quizLength,
                  onChanged: (value) async {
                    if (value == null) return;
                    await settingNotifier.updateQuizLength(value);
                  },
                  title: Text('30問'),
                  tileColor: Colors.white,
                  contentPadding: EdgeInsets.only(left: 48),
                ),
                RadioListTile<int>(
                  value: 40,
                  groupValue: settingState.quizLength,
                  onChanged: (value) async {
                    if (value == null) return;
                    await settingNotifier.updateQuizLength(value);
                  },
                  title: Text('40問'),
                  tileColor: Colors.white,
                  contentPadding: EdgeInsets.only(left: 48),
                ),
              ],
            ),
          const Divider(height: 1),
          RadioListTile<QuizType>(
            value: QuizType.timeLimit,
            groupValue: settingState.quizType,
            onChanged: (value) {
              if (value == null) return;
              settingNotifier.updateQuizType(value);
            },
            title: Text('制限時間'),
            tileColor: Colors.white,
          ),
          if (settingState.quizType == QuizType.timeLimit)
            const Divider(height: 1),
          if (settingState.quizType == QuizType.timeLimit)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
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
                    contentPadding: EdgeInsets.only(left: 48),
                  ),
                RadioListTile<int>(
                  value: 30,
                  groupValue: settingState.limit,
                  onChanged: (value) async {
                    if (value == null) return;
                    await settingNotifier.updateLimit(value);
                  },
                  title: Text('30秒'),
                  tileColor: Colors.white,
                  contentPadding: EdgeInsets.only(left: 48),
                ),
                RadioListTile<int>(
                  value: 60,
                  groupValue: settingState.limit,
                  onChanged: (value) async {
                    if (value == null) return;
                    await settingNotifier.updateLimit(value);
                  },
                  title: Text('60秒'),
                  tileColor: Colors.white,
                  contentPadding: EdgeInsets.only(left: 48),
                ),
                RadioListTile<int>(
                  value: 120,
                  groupValue: settingState.limit,
                  onChanged: (value) async {
                    if (value == null) return;
                    await settingNotifier.updateLimit(value);
                  },
                  title: Text('120秒'),
                  tileColor: Colors.white,
                  contentPadding: EdgeInsets.only(left: 48),
                ),
                RadioListTile<int>(
                  value: 180,
                  groupValue: settingState.limit,
                  onChanged: (value) async {
                    if (value == null) return;
                    await settingNotifier.updateLimit(value);
                  },
                  title: Text('180秒'),
                  tileColor: Colors.white,
                  contentPadding: EdgeInsets.only(left: 48),
                ),
              ],
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
