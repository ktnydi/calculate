import 'package:calculate/analytics.dart';
import 'package:calculate/domains/answer/answer.dart';
import 'package:calculate/pages/game/game_page.dart';
import 'package:calculate/pages/home/home_page.dart';
import 'package:calculate/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GameResult extends ConsumerWidget {
  final int leftTime;
  final List<Answer> answerList;

  GameResult(this.leftTime, this.answerList);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final analytics = watch(analyticsProvider);
    final prefs = watch(sharedPreferencesProvider);
    final isRandom = prefs.getBool('isRandom') ?? false;
    final limit = prefs.getInt('limit') ?? 180;
    final timePerQuiz = (limit - leftTime) / answerList.length;
    final quizLength = prefs.getInt('quizLength') ?? 100;
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
                  '${isRandom ? 'ランダム・' : ''}$limit秒・$quizLength問',
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
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '時間',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    Text(
                      '１問：${timePerQuiz.toStringAsFixed(2)}秒',
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  '${limit - leftTime}秒',
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
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      '正答率',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    Text(
                      '未回答：${quizLength - answerList.length}',
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  '${(numCorrects * 100 ~/ quizLength).round()}%',
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
                minimumSize: Size(140, 48),
                primary: Colors.grey.shade200,
              ),
              onPressed: () {
                analytics.logRestartGame();
                context.refresh(randomQuizProvider);
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
              onPressed: () {
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
