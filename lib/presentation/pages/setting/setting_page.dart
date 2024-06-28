import 'package:calculate/enums/quiz_type.dart';
import 'package:calculate/enums/quiz_category_mode.dart';
import 'package:calculate/enums/supported_locale.dart';
import 'package:calculate/extensions/context.dart';
import 'package:calculate/model/use_cases/app_localize.dart';
import 'package:calculate/model/use_cases/quiz_size.dart';
import 'package:calculate/model/use_cases/quiz_time.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';

class Setting extends ConsumerWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizCategoryMode = ref.watch(quizCategoryModeNotifierProvider);
    final quizCategoryModeNotifier =
        ref.watch(quizCategoryModeNotifierProvider.notifier);
    final quizTimeState = ref.watch(quizTimeNotifierProvider);
    final quizTimeNotifier = ref.watch(quizTimeNotifierProvider.notifier);
    final quizSizeState = ref.watch(quizSizeNotifierProvider);
    final quizSizeNotifier = ref.watch(quizSizeNotifierProvider.notifier);
    final localeState = ref.watch(localeNotifierProvider);

    return Scaffold(
      backgroundColor: context.colorScheme.surface,
      appBar: AppBar(
        title: Text(L10n.of(context)!.settingsPageTitle),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: Text(
                L10n.of(context)!.quizModeTileLabel,
                style: context.textTheme.titleMedium,
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Material(
                color: context.colorScheme.surface,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: BorderSide(
                    color: context.dividerColor,
                  ),
                ),
                clipBehavior: Clip.antiAlias,
                child: ListView.separated(
                  padding: EdgeInsets.zero,
                  reverse: true,
                  itemCount: (QuizCategoryMode.values.length / 2).ceil(),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final leftItem =
                        QuizCategoryMode.values.elementAt(index * 2);
                    final rightItem =
                        QuizCategoryMode.values.elementAtOrNull(index * 2 + 1);

                    return IntrinsicHeight(
                      child: Row(
                        children: [
                          Expanded(
                            child: TextButton(
                              style: TextButton.styleFrom(
                                shape: const BeveledRectangleBorder(),
                                foregroundColor: quizCategoryMode == leftItem
                                    ? context.colorScheme.onSecondaryContainer
                                    : context.colorScheme.onSurface,
                                backgroundColor: quizCategoryMode == leftItem
                                    ? context.colorScheme.secondaryContainer
                                    : null,
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                minimumSize: const Size.fromHeight(80),
                                padding: const EdgeInsets.all(16),
                                textStyle: context.textTheme.titleMedium,
                              ),
                              onPressed: () {
                                quizCategoryModeNotifier.change(leftItem);
                              },
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  if (leftItem.icon != null) ...[
                                    Icon(
                                      leftItem.icon,
                                    ),
                                  ] else
                                    Text(
                                      L10n.of(context)!
                                          .quizCategoryMode(leftItem.name),
                                    ),
                                ],
                              ),
                            ),
                          ),
                          if (rightItem != null) ...[
                            const VerticalDivider(width: 1),
                            Expanded(
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  shape: const BeveledRectangleBorder(),
                                  foregroundColor: quizCategoryMode == rightItem
                                      ? context.colorScheme.onSecondaryContainer
                                      : context.colorScheme.onSurface,
                                  backgroundColor: quizCategoryMode == rightItem
                                      ? context.colorScheme.secondaryContainer
                                      : null,
                                  tapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  minimumSize: const Size.fromHeight(80),
                                  textStyle: context.textTheme.labelSmall,
                                ),
                                onPressed: () {
                                  quizCategoryModeNotifier.change(rightItem);
                                },
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    if (rightItem.icon != null) ...[
                                      Icon(
                                        rightItem.icon,
                                      ),
                                    ] else
                                      Text(
                                        L10n.of(context)!
                                            .quizCategoryMode(rightItem.name),
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (_, __) => const Divider(height: 1),
                ),
              ),
            ),
            const SizedBox(height: 16),
            ListTile(
              title: Row(
                children: [
                  Expanded(
                    child: Text(L10n.of(context)!.quizTypeTileLabel),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(L10n.of(context)!.quizType(QuizType.numQuizzes.name)),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
              child: Material(
                color: context.colorScheme.surface,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: BorderSide(
                    color: context.dividerColor,
                  ),
                ),
                clipBehavior: Clip.antiAlias,
                child: Row(
                  key: const ValueKey(QuizType.numQuizzes),
                  children: QuizType.numQuizzes.selections.map((value) {
                    return Expanded(
                      child: TextButton(
                        onPressed: () {
                          quizSizeNotifier.change(value);
                        },
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          foregroundColor: quizSizeState == value
                              ? context.colorScheme.onSecondaryContainer
                              : context.colorScheme.onSurface,
                          backgroundColor: quizSizeState == value
                              ? context.colorScheme.secondaryContainer
                              : null,
                          minimumSize: const Size.fromHeight(48),
                        ),
                        child: Text(L10n.of(context)!.quizSize(value)),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(L10n.of(context)!.quizType(QuizType.timeLimit.name)),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
              child: Material(
                color: context.colorScheme.surface,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: BorderSide(
                    color: context.dividerColor,
                  ),
                ),
                clipBehavior: Clip.antiAlias,
                child: Row(
                  key: const ValueKey(QuizType.timeLimit),
                  children: QuizType.timeLimit.selections.map((value) {
                    return Expanded(
                      child: TextButton(
                        onPressed: () {
                          quizTimeNotifier.change(time: value);
                        },
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          foregroundColor: quizTimeState == value
                              ? context.colorScheme.onSecondaryContainer
                              : context.colorScheme.onSurface,
                          backgroundColor: quizTimeState == value
                              ? context.colorScheme.secondaryContainer
                              : null,
                          minimumSize: const Size.fromHeight(48),
                        ),
                        child: Text('$value ${L10n.of(context)!.seconds}'),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            const SizedBox(height: 16),
            ListTile(
              onTap: () async {
                final result = await showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return SafeArea(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: SupportedLocale.values.map(
                          (value) {
                            final selected = localeState == value;
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Material(
                                shape: const StadiumBorder(),
                                color: selected
                                    ? context.colorScheme.secondaryContainer
                                    : null,
                                clipBehavior: Clip.antiAlias,
                                child: ListTile(
                                  selected: selected,
                                  selectedColor:
                                      context.colorScheme.onSecondaryContainer,
                                  leading: selected
                                      ? const Icon(Icons.check)
                                      : const SizedBox(),
                                  title: Text(value.label),
                                  onTap: () {
                                    Navigator.of(context).pop(value);
                                  },
                                ),
                              ),
                            );
                          },
                        ).toList(),
                      ),
                    );
                  },
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
            ),
          ],
        ),
      ),
    );
  }
}
