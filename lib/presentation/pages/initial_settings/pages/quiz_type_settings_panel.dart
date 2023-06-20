import 'package:calculate/enums/quiz_type.dart';
import 'package:calculate/extensions/context.dart';
import 'package:calculate/presentation/pages/initial_settings/widgets/selectable_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';

class QuizTypeSettingsPanel extends ConsumerWidget {
  const QuizTypeSettingsPanel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizType = ref.watch(quizTypeNotifierProvider);
    final quizTypeNotifier = ref.watch(quizTypeNotifierProvider.notifier);

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              L10n.of(context)!.quizTypeSettingsDescription,
              style: context.textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 32),
          ...QuizType.values.map((e) {
            return SelectableListTile<QuizType>(
              title: Text(
                L10n.of(context)!.quizType(e.name),
              ),
              subtitle: Text(
                L10n.of(context)!.quizTypeDescription(e.name),
              ),
              groupValue: quizType,
              value: e,
              onTap: (value) {
                quizTypeNotifier.change(value);
              },
            );
          }).toList(),
        ],
      ),
    );
  }
}
