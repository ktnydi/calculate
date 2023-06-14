import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:calculate/enums/flavor.dart';
import 'package:calculate/enums/keyboard_location.dart';
import 'package:calculate/enums/quiz_type.dart';
import 'package:calculate/enums/quiz_category_mode.dart';
import 'package:calculate/enums/supported_locale.dart';
import 'package:calculate/model/use_cases/app_localize.dart';
import 'package:calculate/model/use_cases/one_hand_keypad.dart';
import 'package:calculate/model/use_cases/quiz_size.dart';
import 'package:calculate/model/use_cases/quiz_time.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';

class Setting extends ConsumerWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final flavor = ref.watch(flavorProvider);
    final quizCategoryMode = ref.watch(quizCategoryModeNotifierProvider);
    final oneHandKeypad = ref.watch(oneHandKeypadProvider);
    final oneHandKeypadNotifier = ref.watch(oneHandKeypadProvider.notifier);
    final keyboardLocation = ref.watch(keyboardLocationProvider);
    final keyboardLocationNotifier =
        ref.watch(keyboardLocationProvider.notifier);
    final quizTypeState = ref.watch(quizTypeNotifierProvider);
    final quizTypeNotifier = ref.watch(quizTypeNotifierProvider.notifier);
    final quizTimeState = ref.watch(quizTimeNotifierProvider);
    final quizTimeNotifier = ref.watch(quizTimeNotifierProvider.notifier);
    final quizSizeState = ref.watch(quizSizeNotifierProvider);
    final quizSizeNotifier = ref.watch(quizSizeNotifierProvider.notifier);
    final localeState = ref.watch(localeNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(L10n.of(context)!.settingsPageTitle),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              tileColor: Colors.white,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    L10n.of(context)!.quizModeTileLabel,
                  ),
                  Text(
                    L10n.of(context)!.quizCategoryMode(quizCategoryMode.name),
                  ),
                ],
              ),
              trailing: const Icon(Icons.navigate_next),
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) => _QuizCategoryModeSheet(),
                );
              },
            ),
            const SizedBox(height: 16),
            ListTile(
              tileColor: Colors.white,
              title: Row(
                children: [
                  Expanded(
                    child: Text(L10n.of(context)!.quizTypeTileLabel),
                  ),
                  CupertinoSlidingSegmentedControl<QuizType>(
                    groupValue: quizTypeState,
                    children: QuizType.values.asMap().map(
                      (key, value) {
                        return MapEntry(
                          value,
                          Text(L10n.of(context)!.quizType(value.name)),
                        );
                      },
                    ),
                    onValueChanged: (value) async {
                      if (value == null) return;
                      quizTypeNotifier.change(value);
                    },
                  ),
                ],
              ),
            ),
            const Divider(height: 1),
            if (quizTypeState == QuizType.numQuizzes)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (flavor == Flavor.development) 2,
                  10,
                  20,
                  30,
                  40,
                ].map((value) {
                  return RadioListTile<int>(
                    value: value,
                    groupValue: quizSizeState,
                    onChanged: (value) {
                      if (value == null) return;
                      quizSizeNotifier.change(value);
                    },
                    title: Text(L10n.of(context)!.quizSize(value)),
                    tileColor: Colors.white,
                  );
                }).toList(),
              ),
            if (quizTypeState == QuizType.timeLimit)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (flavor == Flavor.development) 10,
                  30,
                  60,
                  120,
                  180,
                ].map((e) {
                  return RadioListTile<int>(
                    value: e,
                    groupValue: quizTimeState,
                    onChanged: (value) async {
                      if (value == null) return;
                      quizTimeNotifier.change(time: value);
                    },
                    title: Text('$e${L10n.of(context)!.seconds}'),
                    tileColor: Colors.white,
                  );
                }).toList(),
              ),
            const SizedBox(height: 16),
            ListTile(
              title: Text(
                L10n.of(context)!.oneHandKeypad,
              ),
              trailing: Switch.adaptive(
                activeColor: Theme.of(context).colorScheme.primary,
                value: oneHandKeypad,
                onChanged: (value) {
                  oneHandKeypadNotifier.update(value);
                },
              ),
              tileColor: Colors.white,
            ),
            if (oneHandKeypad) ...[
              const Divider(height: 1),
              ListTile(
                title: Row(
                  children: [
                    Expanded(
                      child: Text(
                        L10n.of(context)!.keyboardLocationTileLabel,
                      ),
                    ),
                    CupertinoSlidingSegmentedControl<KeyboardLocation>(
                      groupValue: keyboardLocation,
                      children: KeyboardLocation.values.asMap().map(
                        (key, value) {
                          return MapEntry(
                            value,
                            Text(
                                L10n.of(context)!.keyboardLocation(value.name)),
                          );
                        },
                      ),
                      onValueChanged: (value) async {
                        if (value == null) return;
                        keyboardLocationNotifier.change(value);
                      },
                    ),
                  ],
                ),
                tileColor: Colors.white,
              ),
            ],
            const SizedBox(height: 16),
            ListTile(
              onTap: () async {
                final result = await showModalActionSheet(
                  context: context,
                  actions: SupportedLocale.values.map((e) {
                    return SheetAction(
                      key: e,
                      label: e.label,
                    );
                  }).toList(),
                );

                if (result == null) return;

                ref.read(localeNotifierProvider.notifier).change(result);
              },
              title: Row(
                children: [
                  Expanded(
                    child: Text(L10n.of(context)!.languageSettingsTileLabel),
                  ),
                  Text(localeState.label),
                ],
              ),
              trailing: const Icon(Icons.navigate_next),
              tileColor: Colors.white,
            ),
          ],
        ),
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
        padding: const EdgeInsets.symmetric(vertical: 16),
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
                title: Text(
                  L10n.of(context)!.quizCategoryMode(value.name),
                ),
                tileColor: Colors.white,
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
