import 'package:calculate/enums/quiz_type.dart';
import 'package:calculate/enums/quiz_category_mode.dart';
import 'package:calculate/extensions/context.dart';
import 'package:calculate/model/use_cases/quiz_size.dart';
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
    final quizSizeState = ref.watch(quizSizeNotifierProvider);
    final quizSizeNotifier = ref.watch(quizSizeNotifierProvider.notifier);

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 12, 0, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: context.colorScheme.onSurfaceVariant,
                  borderRadius: BorderRadius.circular(1000),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Material(
                color: context.colorScheme.surface,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
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
                                    ? context.colorScheme.onPrimary
                                    : context.colorScheme.onSurface,
                                backgroundColor: quizCategoryMode == leftItem
                                    ? context.colorScheme.primary
                                    : null,
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                minimumSize: const Size.fromHeight(56),
                                textStyle:
                                    context.textTheme.labelLarge!.copyWith(
                                  fontWeight: quizCategoryMode == leftItem
                                      ? FontWeight.bold
                                      : null,
                                ),
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
                                      size: 20,
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
                            VerticalDivider(
                              width: 2,
                              thickness: 2,
                              color: context.colorScheme.surfaceContainerLow,
                            ),
                            Expanded(
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  shape: const BeveledRectangleBorder(),
                                  foregroundColor: quizCategoryMode == rightItem
                                      ? context.colorScheme.onPrimary
                                      : context.colorScheme.onSurface,
                                  backgroundColor: quizCategoryMode == rightItem
                                      ? context.colorScheme.primary
                                      : null,
                                  tapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  minimumSize: const Size.fromHeight(56),
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
                                        size: 20,
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
                  separatorBuilder: (_, __) => Divider(
                    height: 2,
                    thickness: 2,
                    color: context.colorScheme.surfaceContainerLow,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
              child: Material(
                color: context.colorScheme.surface,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
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
                            borderRadius: BorderRadius.circular(4),
                          ),
                          foregroundColor: quizSizeState == value
                              ? context.colorScheme.onPrimary
                              : context.colorScheme.onSurface,
                          backgroundColor: quizSizeState == value
                              ? context.colorScheme.primary
                              : null,
                          minimumSize: const Size.fromHeight(56),
                          textStyle: context.textTheme.labelLarge!.copyWith(
                            fontWeight:
                                quizSizeState == value ? FontWeight.bold : null,
                          ),
                        ),
                        child: Text(L10n.of(context)!.quizSize(value)),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
