import 'package:calculate/analytics.dart';
import 'package:calculate/model/domains/answer/answer.dart';
import 'package:calculate/enums/quiz_type.dart';
import 'package:calculate/model/use_cases/quiz_size.dart';
import 'package:calculate/model/use_cases/quiz_time.dart';
import 'package:calculate/presentation/pages/game/game_page.dart';
import 'package:calculate/presentation/pages/home/home_page.dart';
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
    final timePerQuiz = (limit - leftTime) / answerList.length;
    final quizType = ref.watch(quizTypeNotifierProvider);
    final quizLength = ref.watch(quizSizeNotifierProvider);
    final numCorrects = answerList.where((ans) => ans.isCorrect).length;
    final viewPadding = MediaQuery.of(context).viewPadding;

    return Scaffold(
      appBar: AppBar(
        title: Text('結果'),
      ),
      body: ListView(
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
          if (quizType == QuizType.timeLimit) const SizedBox(height: 16),
          if (quizType == QuizType.timeLimit)
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
                    '${timePerQuiz.toStringAsFixed(2)}秒',
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
                  '正答率',
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(height: 4),
                Text(
                  '${(numCorrects * 100 / answerList.length).toStringAsPrecision(3)}%',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'あなたの回答',
                style: Theme.of(context).textTheme.headline6,
              ),
              Text(
                '（回答数：${answerList.length}）',
              ),
            ],
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
                  label: Text('回答'),
                ),
                DataColumn(
                  label: Text('判定'),
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
                          Text('${index + 1}'),
                        ),
                        DataCell(
                          Text('${quiz.title}'),
                        ),
                        DataCell(
                          Text('${answer.answer}'),
                        ),
                        DataCell(
                          Icon(
                            answer.isCorrect
                                ? Icons.circle_outlined
                                : Icons.close,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 4),
          Text(
            '※未回答の回答は表示されません。',
            style: Theme.of(context).textTheme.caption,
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SafeArea(
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
    );
  }
}
