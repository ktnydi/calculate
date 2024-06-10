import 'package:calculate/analytics.dart';
import 'package:calculate/config.dart';
import 'package:calculate/enums/quiz_category.dart';
import 'package:calculate/enums/quiz_category_mode.dart';
import 'package:calculate/extensions/context.dart';
import 'package:calculate/extensions/num.dart';
import 'package:calculate/model/domains/answer/answer.dart';
import 'package:calculate/enums/quiz_type.dart';
import 'package:calculate/model/use_cases/quiz_size.dart';
import 'package:calculate/model/use_cases/quiz_time.dart';
import 'package:calculate/presentation/pages/game/game_page.dart';
import 'package:calculate/presentation/pages/home/home_page.dart';
import 'package:calculate/presentation/widgets/ad/ad_unit_id/ad_unit_id.dart';
import 'package:calculate/presentation/widgets/ad/bottom_ad_banner.dart';
import 'package:calculate/providers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';

class GameResult extends ConsumerWidget {
  final int leftTime;
  final List<Answer> answerList;
  final QuizType quizType;

  const GameResult(
    this.leftTime,
    this.answerList,
    this.quizType, {
    super.key,
  });

  Duration? get avgTime {
    if (answerList.isEmpty) {
      return null;
    }

    final times = answerList.map((e) => e.time.inMilliseconds);
    final sumTimes = times.reduce((value, element) => value + element);
    return Duration(milliseconds: (sumTimes / answerList.length).truncate());
  }

  Duration? eachAvgTime(QuizCategory type) {
    final answers = answerList.where((element) => element.quiz.type == type);
    if (answers.isEmpty) {
      return null;
    }
    final times = answers.map((e) => e.time.inMilliseconds);
    final sumTimes = times.reduce((value, element) => value + element);
    return Duration(milliseconds: (sumTimes / answers.length).truncate());
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final analytics = ref.watch(analyticsProvider);
    final limit = ref.watch(quizTimeNotifierProvider);
    final quizCategory = ref.watch(quizCategoryModeNotifierProvider);
    final quizLength = ref.watch(quizSizeNotifierProvider);
    final viewPadding = MediaQuery.of(context).viewPadding;

    return Scaffold(
      appBar: AppBar(
        title: Text(L10n.of(context)!.gameResultPageTitle),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  if (answerList.isNotEmpty)
                    SingleChildScrollView(
                      padding: const EdgeInsets.all(16).copyWith(
                        bottom: 84 + viewPadding.bottom,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              L10n.of(context)!.gameSettingsSectionLabel,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ListTile(
                                  title: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        L10n.of(context)!.quizModeTileLabel,
                                      ),
                                      Text(
                                        L10n.of(context)!.quizCategoryMode(
                                          quizCategory.name,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const Divider(height: 1),
                                ListTile(
                                  title: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        L10n.of(context)!.quizTypeTileLabel,
                                      ),
                                      Text(
                                        quizType == QuizType.numQuizzes
                                            ? '${L10n.of(context)!.quizType(quizType.name)}・${L10n.of(context)!.quizSize(quizLength)}'
                                            : '${L10n.of(context)!.quizType(quizType.name)}・$limit${L10n.of(context)!.seconds}',
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 32),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              L10n.of(context)!.averageTimeSectionLabel,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ListTile(
                                  title: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        L10n.of(context)!
                                            .allQuizAverageTimeLabel,
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        '${(avgTime!.inMilliseconds / 1000).digit()}${L10n.of(context)!.seconds}',
                                      ),
                                    ],
                                  ),
                                ),
                                for (var i in QuizCategory.values)
                                  if (eachAvgTime(i) != null) ...[
                                    const Divider(height: 1),
                                    ListTile(
                                      title: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            L10n.of(context)!
                                                .quizCategory(i.name),
                                          ),
                                          const SizedBox(height: 4),
                                          Text(
                                            '${(eachAvgTime(i)!.inMilliseconds / 1000).digit()}${L10n.of(context)!.seconds}',
                                          )
                                        ],
                                      ),
                                    ),
                                  ]
                              ],
                            ),
                          ),
                          const SizedBox(height: 32),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              L10n.of(context)!.answeredQuizSectionLabel,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: List.generate(
                                answerList.length,
                                (index) {
                                  final answer = answerList.elementAt(index);
                                  final quiz = answer.quiz;
                                  return Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      if (index != 0) const Divider(height: 1),
                                      ListTile(
                                        iconColor:
                                            context.textTheme.bodyMedium!.color,
                                        title: Row(
                                          children: [
                                            SizedBox(
                                              width: 48,
                                              child: Text('(${index + 1})'),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Text(
                                                  '${quiz.figures.first}',
                                                ),
                                                const SizedBox(width: 4),
                                                Icon(
                                                  quiz.type.icon,
                                                  size: context.textTheme
                                                      .titleMedium!.fontSize,
                                                ),
                                                const SizedBox(width: 4),
                                                Text(
                                                  '${quiz.figures.last}',
                                                ),
                                                const SizedBox(width: 4),
                                                Icon(
                                                  CupertinoIcons.equal,
                                                  size: context.textTheme
                                                      .titleMedium!.fontSize,
                                                ),
                                                const SizedBox(width: 4),
                                                Text(
                                                  '${quiz.correctAnswer}',
                                                ),
                                              ],
                                            ),
                                            const Spacer(),
                                            Text(
                                              '${(answer.time.inMilliseconds / 1000).digit()}${L10n.of(context)!.seconds}',
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  else
                    Center(
                      child: Text(
                        '回答しないと結果は表示されません。',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                  Positioned(
                    bottom: 16,
                    right: 0,
                    left: 0,
                    child: SafeArea(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          FilledButton.icon(
                            icon: const Icon(Icons.refresh_outlined),
                            label: Text(L10n.of(context)!.retryButtonLabel),
                            style: FilledButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(28),
                              ),
                              backgroundColor: Colors.grey.shade200,
                              minimumSize: const Size(140, 48),
                            ),
                            onPressed: () async {
                              analytics.logRestartGame();
                              ref.invalidate(quizProvider);
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  fullscreenDialog: true,
                                  builder: (context) => Game(
                                    quizType: quizType,
                                  ),
                                ),
                              );
                            },
                          ),
                          const SizedBox(width: 16),
                          FilledButton.icon(
                            icon: const Icon(Icons.home_outlined),
                            label: Text(L10n.of(context)!.homeButtonLabel),
                            style: FilledButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(28),
                              ),
                              minimumSize: const Size(140, 48),
                            ),
                            onPressed: () async {
                              Navigator.popUntil(
                                context,
                                (route) => route.isFirst,
                              );
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Home(),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const BottomAdBanner(
              adUnitId: AdUnitId(
                android: androidResultBottomCenter,
                ios: iosResultBottomCenter,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
