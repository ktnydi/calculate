import 'package:calculate/enums/flavor.dart';
import 'package:calculate/enums/keyboard_location.dart';
import 'package:calculate/enums/quiz_type.dart';
import 'package:calculate/enums/quiz_category_mode.dart';
import 'package:calculate/pages/setting/setting_notifier.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Setting extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final flavor = ref.watch(flavorProvider);
    final settingState = ref.watch(settingProvider);
    final settingNotifier = ref.watch(settingProvider.notifier);
    final quizCategoryMode = ref.watch(quizCategoryModeProvider);
    final keyboardLocation = ref.watch(keyboardLocationProvider);
    final quizType = ref.watch(quizTypeProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('設定'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 16),
        children: [
          const Divider(height: 1),
          ListTile(
            tileColor: Colors.white,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('出題モード'),
                Text('${quizCategoryMode.state.name}'),
              ],
            ),
            trailing: Icon(Icons.navigate_next),
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (context) => _QuizCategoryModeSheet(),
              );
            },
          ),
          const Divider(height: 1),
          const SizedBox(height: 16),
          const Divider(height: 1),
          ListTile(
            tileColor: Colors.white,
            title: Text('問題形式'),
            trailing: CupertinoSlidingSegmentedControl<QuizType>(
              groupValue: quizType.state,
              children: {
                QuizType.numQuizzes: Text(QuizType.numQuizzes.name),
                QuizType.timeLimit: Text(QuizType.timeLimit.name),
              },
              onValueChanged: (value) async {
                if (value == null) return;
                await settingNotifier.updateQuizType(value);
                quizType.state = value;
              },
            ),
          ),
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
                ),
              ],
            ),
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
                ),
              ],
            ),
          const Divider(height: 1),
          const SizedBox(height: 16),
          const Divider(height: 1),
          ListTile(
            title: Text('キーボードの位置'),
            trailing: CupertinoSlidingSegmentedControl<KeyboardLocation>(
              groupValue: keyboardLocation.state,
              children: {
                KeyboardLocation.left: Text(KeyboardLocation.left.name),
                KeyboardLocation.center: Text(KeyboardLocation.center.name),
                KeyboardLocation.right: Text(KeyboardLocation.right.name),
              },
              onValueChanged: (value) async {
                if (value == null) return;
                await settingNotifier.updateKeyboardLocation(value.id);
                keyboardLocation.state = value;
              },
            ),
            tileColor: Colors.white,
          ),
          const Divider(height: 1),
        ],
      ),
    );
  }
}

class _QuizCategoryModeSheet extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settingNotifier = ref.watch(settingProvider.notifier);
    final quizCategoryMode = ref.watch(quizCategoryModeProvider);

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: QuizCategoryMode.values.map(
            (value) {
              return RadioListTile<QuizCategoryMode>(
                value: value,
                groupValue: quizCategoryMode.state,
                onChanged: (value) async {
                  if (value == null) return;
                  settingNotifier.updateQuizCategoryMode(value);
                  quizCategoryMode.state = value;
                },
                title: Text('${value.name}'),
                tileColor: Colors.white,
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
