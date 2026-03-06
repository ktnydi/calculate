import 'package:calculate/enums/quiz_type.dart';
import 'package:calculate/enums/quiz_category_mode.dart';
import 'package:calculate/extensions/context.dart';
import 'package:calculate/l10n/l10n.dart';
import 'package:calculate/model/domains/quiz_settings/term_settings.dart';
import 'package:calculate/model/use_cases/quiz_settings_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Setting extends ConsumerWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentState = ref.watch(
      quizSettingsManagerNotifierProvider,
    );
    final quizSettingsManagerNotifier = ref.watch(
      quizSettingsManagerNotifierProvider.notifier,
    );

    final currentTerm = switch (currentState.category) {
      QuizCategoryMode.multiplication => currentState.term.multiplication,
      QuizCategoryMode.division => currentState.term.division,
      QuizCategoryMode.addition => currentState.term.addition,
      QuizCategoryMode.subtraction => currentState.term.subtraction,
      QuizCategoryMode.random => null,
    };

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 12, 0, 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: context.colorScheme.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(1000),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Center(
              child: Text(
                L10n.of(context)!.quizSettingsDescription(
                  currentTerm?.first,
                  currentTerm?.second,
                  currentState.category.name,
                  currentState.size,
                ),
                textAlign: TextAlign.center,
                style: context.textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 24),

            /// 問題内容の設定
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
              child: Material(
                color: context.colorScheme.surfaceContainerLow,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                clipBehavior: Clip.antiAlias,
                child: Row(
                  spacing: 2,
                  children: QuizCategoryMode.values.getRange(4, 5).map((
                    value,
                  ) {
                    return Expanded(
                      child: TextButton(
                        onPressed: () {
                          HapticFeedback.selectionClick();
                          quizSettingsManagerNotifier.updateQuizCategory(
                            value,
                          );
                        },
                        style: TextButton.styleFrom(
                          animationDuration: Duration.zero,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                          foregroundColor: currentState.category == value
                              ? context.colorScheme.onPrimary
                              : context.colorScheme.onSurface,
                          backgroundColor: currentState.category == value
                              ? context.colorScheme.primary
                              : context.colorScheme.surface,
                          minimumSize: const Size.fromHeight(56),
                          textStyle: context.textTheme.titleMedium!.copyWith(
                            fontWeight: currentState.category == value
                                ? FontWeight.bold
                                : null,
                          ),
                        ),
                        child: Text(
                          L10n.of(
                            context,
                          )!.quizCategoryMode(value.name),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
              child: Material(
                color: context.colorScheme.surfaceContainerLow,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                clipBehavior: Clip.antiAlias,
                child: Row(
                  spacing: 2,
                  children: QuizCategoryMode.values.getRange(0, 4).map((
                    value,
                  ) {
                    return Expanded(
                      child: TextButton(
                        onPressed: () {
                          HapticFeedback.selectionClick();
                          quizSettingsManagerNotifier.updateQuizCategory(
                            value,
                          );
                        },
                        style: TextButton.styleFrom(
                          animationDuration: Duration.zero,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                          foregroundColor: currentState.category == value
                              ? context.colorScheme.onPrimary
                              : context.colorScheme.onSurface,
                          backgroundColor: currentState.category == value
                              ? context.colorScheme.primary
                              : context.colorScheme.surface,
                          minimumSize: const Size.fromHeight(56),
                          textStyle: context.textTheme.titleMedium!.copyWith(
                            fontWeight: currentState.category == value
                                ? FontWeight.bold
                                : null,
                          ),
                        ),
                        child: Icon(
                          value.categories.first.icon,
                          size: 20,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            const SizedBox(height: 32),

            if (currentTerm != null) ...[
              /// 桁数の設定
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                child: Material(
                  color: context.colorScheme.surfaceContainerLow,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Row(
                    key: const ValueKey(QuizType.numQuizzes),
                    spacing: 2,
                    children: [1, 2, 3, 4].map((value) {
                      return Expanded(
                        child: TextButton(
                          onPressed: () {
                            HapticFeedback.selectionClick();
                            final currentMode =
                                currentState.category.categories.first;

                            final nextDigit = currentTerm.copyWith(
                              first: value,
                            );

                            final Term nextTerm = Function.apply(
                              currentState.term.copyWith.call,
                              null,
                              {Symbol(currentMode.name): nextDigit},
                            );

                            quizSettingsManagerNotifier.updateTerm(
                              nextTerm,
                            );
                          },
                          style: TextButton.styleFrom(
                            animationDuration: Duration.zero,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero,
                            ),
                            foregroundColor: currentTerm.first == value
                                ? context.colorScheme.onPrimary
                                : context.colorScheme.onSurface,
                            backgroundColor: currentTerm.first == value
                                ? context.colorScheme.primary
                                : context.colorScheme.surface,
                            minimumSize: const Size.fromHeight(56),
                            textStyle: context.textTheme.titleMedium!.copyWith(
                              fontWeight: currentTerm.first == value
                                  ? FontWeight.bold
                                  : null,
                            ),
                          ),
                          child: Text(L10n.of(context)!.digit(value)),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                child: Material(
                  color: context.colorScheme.surfaceContainerLow,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Row(
                    key: const ValueKey(QuizType.numQuizzes),
                    spacing: 2,
                    children: [1, 2, 3, 4].map((value) {
                      return Expanded(
                        child: TextButton(
                          onPressed: () {
                            HapticFeedback.selectionClick();
                            final currentMode =
                                currentState.category.categories.first;

                            final nextDigit = currentTerm.copyWith(
                              second: value,
                            );

                            final Term nextTerm = Function.apply(
                              currentState.term.copyWith.call,
                              null,
                              {Symbol(currentMode.name): nextDigit},
                            );

                            quizSettingsManagerNotifier.updateTerm(
                              nextTerm,
                            );
                          },
                          style: TextButton.styleFrom(
                            animationDuration: Duration.zero,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero,
                            ),
                            foregroundColor: currentTerm.second == value
                                ? context.colorScheme.onPrimary
                                : context.colorScheme.onSurface,
                            backgroundColor: currentTerm.second == value
                                ? context.colorScheme.primary
                                : context.colorScheme.surface,
                            minimumSize: const Size.fromHeight(56),
                            textStyle: context.textTheme.titleMedium!.copyWith(
                              fontWeight: currentTerm.second == value
                                  ? FontWeight.bold
                                  : null,
                            ),
                          ),
                          child: Text(L10n.of(context)!.digit(value)),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ] else
              Container(
                height: 120,
                margin: EdgeInsets.symmetric(horizontal: 16),
                alignment: Alignment.center,

                child: Text(
                  L10n.of(context)!.digitDescription,
                  textAlign: TextAlign.center,
                ),
              ),
            const SizedBox(height: 32),

            /// 問題数の設定
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
              child: Material(
                color: context.colorScheme.surfaceContainerLow,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                clipBehavior: Clip.antiAlias,
                child: Row(
                  key: const ValueKey(QuizType.numQuizzes),
                  spacing: 2,
                  children: QuizType.numQuizzes.selections.map((value) {
                    return Expanded(
                      child: TextButton(
                        onPressed: () {
                          HapticFeedback.selectionClick();
                          quizSettingsManagerNotifier.updateQuizSize(value);
                        },
                        style: TextButton.styleFrom(
                          animationDuration: Duration.zero,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0),
                          ),
                          foregroundColor: currentState.size == value
                              ? context.colorScheme.onPrimary
                              : context.colorScheme.onSurface,
                          backgroundColor: currentState.size == value
                              ? context.colorScheme.primary
                              : context.colorScheme.surface,
                          minimumSize: const Size.fromHeight(56),
                          textStyle: context.textTheme.titleMedium!.copyWith(
                            fontWeight: currentState.size == value
                                ? FontWeight.bold
                                : null,
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
