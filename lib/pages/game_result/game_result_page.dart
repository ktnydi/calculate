import 'package:calculate/analytics.dart';
import 'package:calculate/pages/game/game_page.dart';
import 'package:calculate/pages/home/home_page.dart';
import 'package:calculate/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GameResult extends ConsumerWidget {
  final int leftTime;
  final List<bool> correctAnswer;

  GameResult(this.leftTime, this.correctAnswer);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final analytics = watch(analyticsProvider);
    final prefs = watch(sharedPreferencesProvider);
    final isRandom = prefs.getBool('isRandom') ?? false;
    final limit = prefs.getInt('limit') ?? 180;
    final quizLength = prefs.getInt('quizLength') ?? 100;
    final numCorrects = correctAnswer.where((ans) => ans).length;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '結果',
                style: Theme.of(context).textTheme.headline4!.copyWith(
                      color: Theme.of(context).textTheme.bodyText2!.color,
                    ),
              ),
              const SizedBox(height: 32),
              Material(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 32,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '出題設定',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '${isRandom ? 'ランダム・' : ''}$limit秒・$quizLength問',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ],
                      ),
                      const Divider(height: 64, thickness: 1),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'かかった時間',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '${limit - leftTime}秒',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ],
                      ),
                      const Divider(height: 64, thickness: 1),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '正答率',
                                style: Theme.of(context).textTheme.headline6,
                              ),
                              const SizedBox(height: 4),
                              Text(
                                '${numCorrects * 100 ~/ quizLength}%',
                                style: Theme.of(context).textTheme.headline6,
                              ),
                            ],
                          ),
                          Text(
                            '未回答：${quizLength - correctAnswer.length}',
                          ),
                        ],
                      ),
                      const Divider(height: 64, thickness: 1),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
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
                              context.refresh(quizProvider);
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
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
