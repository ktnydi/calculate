import 'package:calculate/analytics.dart';
import 'package:calculate/extensions/num.dart';
import 'package:calculate/model/domains/answer/answer.dart';
import 'package:calculate/enums/quiz_type.dart';
import 'package:calculate/model/use_cases/quiz_size.dart';
import 'package:calculate/model/use_cases/quiz_time.dart';
import 'package:calculate/presentation/pages/game/game_page.dart';
import 'package:calculate/presentation/pages/home/home_page.dart';
import 'package:calculate/presentation/widgets/bottom_ad_banner.dart';
import 'package:calculate/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GameResult extends ConsumerWidget {
  final int leftTime;
  final List<Answer> answerList;

  GameResult(this.leftTime, this.answerList);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final analytics = ref.watch(analyticsProvider);
    final limit = ref.watch(quizTimeNotifierProvider);
    final quizType = ref.watch(quizTypeNotifierProvider);
    final quizLength = ref.watch(quizSizeNotifierProvider);
    final viewPadding = MediaQuery.of(context).viewPadding;

    final avgTime = () {
      if (answerList.isEmpty) {
        return null;
      }

      final times = answerList.map((e) => e.time.inMilliseconds);
      final sumTimes = times.reduce((value, element) => value + element);
      return Duration(milliseconds: (sumTimes / answerList.length).truncate());
    }();

    return Scaffold(
      appBar: AppBar(
        title: Text('結果'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                if (answerList.isNotEmpty)
                  ListView(
                    padding: const EdgeInsets.all(16).copyWith(
                      bottom: 84 + viewPadding.bottom,
                    ),
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 32,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: Theme.of(context).dividerColor,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '設定',
                              style: Theme.of(context).textTheme.headline6,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              quizType == QuizType.numQuizzes
                                  ? '問題数・全${quizLength}問'
                                  : '時間制限・$limit秒',
                              style: Theme.of(context).textTheme.headline6,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 32,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: Theme.of(context).dividerColor,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '時間／問',
                              style: Theme.of(context).textTheme.headline6,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '${(avgTime!.inMilliseconds / 1000).digit()}秒',
                              style: Theme.of(context).textTheme.headline6,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: Theme.of(context).dividerColor,
                          ),
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: DataTable(
                          columns: <DataColumn>[
                            DataColumn(
                              label: Text('No.'),
                            ),
                            DataColumn(
                              label: Text('問題'),
                            ),
                            DataColumn(
                              label: Text('時間'),
                            ),
                          ],
                          rows: <DataRow>[
                            ...List.generate(
                              answerList.length,
                              (index) {
                                final answer = answerList.elementAt(index);
                                final quiz = answer.quiz;
                                return DataRow(
                                  cells: <DataCell>[
                                    DataCell(
                                      Text('(${index + 1})'),
                                    ),
                                    DataCell(
                                      Text(
                                        '${quiz.title} = ${quiz.correctAnswer}',
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        '${(answer.time.inMilliseconds / 1000).digit()}秒',
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
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
                        ElevatedButton(
                          child: Text('もう一回'),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(28),
                            ),
                            backgroundColor: Colors.grey.shade200,
                            minimumSize: Size(140, 48),
                          ),
                          onPressed: () async {
                            analytics.logRestartGame();
                            ref.invalidate(quizProvider);
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                fullscreenDialog: true,
                                builder: (context) => Game(),
                              ),
                            );
                          },
                        ),
                        const SizedBox(width: 16),
                        ElevatedButton(
                          child: Text('ホームに戻る'),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(28),
                            ),
                            minimumSize: Size(140, 48),
                          ),
                          onPressed: () async {
                            Navigator.popUntil(
                              context,
                              (route) => route.isFirst,
                            );
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Home(),
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
          const BottomAdBanner(),
        ],
      ),
    );
  }
}
