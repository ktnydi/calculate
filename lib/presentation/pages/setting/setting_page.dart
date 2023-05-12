import 'package:calculate/enums/flavor.dart';
import 'package:calculate/enums/keyboard_location.dart';
import 'package:calculate/enums/quiz_type.dart';
import 'package:calculate/enums/quiz_category_mode.dart';
import 'package:calculate/model/use_cases/quiz_size.dart';
import 'package:calculate/model/use_cases/quiz_time.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Setting extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final flavor = ref.watch(flavorProvider);
    final quizCategoryMode = ref.watch(quizCategoryModeNotifierProvider);
    final keyboardLocation = ref.watch(keyboardLocationProvider);
    final keyboardLocationNotifier =
        ref.watch(keyboardLocationProvider.notifier);
    final quizTypeState = ref.watch(quizTypeNotifierProvider);
    final quizTypeNotifier = ref.watch(quizTypeNotifierProvider.notifier);
    final quizTimeState = ref.watch(quizTimeNotifierProvider);
    final quizTimeNotifier = ref.watch(quizTimeNotifierProvider.notifier);
    final quizSizeState = ref.watch(quizSizeNotifierProvider);
    final quizSizeNotifier = ref.watch(quizSizeNotifierProvider.notifier);

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
                Text('${quizCategoryMode.name}'),
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
              groupValue: quizTypeState,
              children: {
                QuizType.numQuizzes: Text(QuizType.numQuizzes.name),
                QuizType.timeLimit: Text(QuizType.timeLimit.name),
              },
              onValueChanged: (value) async {
                if (value == null) return;
                quizTypeNotifier.change(value);
              },
            ),
          ),
          const Divider(height: 1),
          if (quizTypeState == QuizType.numQuizzes)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (flavor == Flavor.development)
                  RadioListTile<int>(
                    value: 2,
                    groupValue: quizSizeState,
                    onChanged: (value) {
                      if (value == null) return;
                      quizSizeNotifier.change(value);
                    },
                    title: Text('2問（開発環境）'),
                    tileColor: Colors.white,
                  ),
                RadioListTile<int>(
                  value: 10,
                  groupValue: quizSizeState,
                  onChanged: (value) {
                    if (value == null) return;
                    quizSizeNotifier.change(value);
                  },
                  title: Text('10問'),
                  tileColor: Colors.white,
                ),
                RadioListTile<int>(
                  value: 20,
                  groupValue: quizSizeState,
                  onChanged: (value) {
                    if (value == null) return;
                    quizSizeNotifier.change(value);
                  },
                  title: Text('20問'),
                  tileColor: Colors.white,
                ),
                RadioListTile<int>(
                  value: 30,
                  groupValue: quizSizeState,
                  onChanged: (value) {
                    if (value == null) return;
                    quizSizeNotifier.change(value);
                  },
                  title: Text('30問'),
                  tileColor: Colors.white,
                ),
                RadioListTile<int>(
                  value: 40,
                  groupValue: quizSizeState,
                  onChanged: (value) {
                    if (value == null) return;
                    quizSizeNotifier.change(value);
                  },
                  title: Text('40問'),
                  tileColor: Colors.white,
                ),
              ],
            ),
          if (quizTypeState == QuizType.timeLimit)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (flavor == Flavor.development)
                  RadioListTile<int>(
                    value: 10,
                    groupValue: quizTimeState,
                    onChanged: (value) async {
                      if (value == null) return;
                      quizTimeNotifier.change(time: value);
                    },
                    title: Text('10秒（開発環境）'),
                    tileColor: Colors.white,
                  ),
                RadioListTile<int>(
                  value: 30,
                  groupValue: quizTimeState,
                  onChanged: (value) async {
                    if (value == null) return;
                    quizTimeNotifier.change(time: value);
                  },
                  title: Text('30秒'),
                  tileColor: Colors.white,
                ),
                RadioListTile<int>(
                  value: 60,
                  groupValue: quizTimeState,
                  onChanged: (value) async {
                    if (value == null) return;
                    quizTimeNotifier.change(time: value);
                  },
                  title: Text('60秒'),
                  tileColor: Colors.white,
                ),
                RadioListTile<int>(
                  value: 120,
                  groupValue: quizTimeState,
                  onChanged: (value) async {
                    if (value == null) return;
                    quizTimeNotifier.change(time: value);
                  },
                  title: Text('120秒'),
                  tileColor: Colors.white,
                ),
                RadioListTile<int>(
                  value: 180,
                  groupValue: quizTimeState,
                  onChanged: (value) async {
                    if (value == null) return;
                    quizTimeNotifier.change(time: value);
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
              groupValue: keyboardLocation,
              children: {
                KeyboardLocation.left: Text(KeyboardLocation.left.name),
                KeyboardLocation.center: Text(KeyboardLocation.center.name),
                KeyboardLocation.right: Text(KeyboardLocation.right.name),
              },
              onValueChanged: (value) async {
                if (value == null) return;
                keyboardLocationNotifier.change(value);
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
    final quizCategoryModeState = ref.watch(quizCategoryModeNotifierProvider);
    final quizCategoryModeNotifier =
        ref.watch(quizCategoryModeNotifierProvider.notifier);

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: QuizCategoryMode.values.map(
            (value) {
              return RadioListTile<QuizCategoryMode>(
                value: value,
                groupValue: quizCategoryModeState,
                onChanged: (value) async {
                  if (value == null) return;
                  quizCategoryModeNotifier.change(value);
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
