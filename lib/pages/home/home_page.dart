import 'package:app_review/app_review.dart';
import 'package:calculate/analytics.dart';
import 'package:calculate/enums/update_request_type.dart';
import 'package:calculate/pages/game/game_page.dart';
import 'package:calculate/pages/help/help_page.dart';
import 'package:calculate/pages/setting/setting_page.dart';
import 'package:calculate/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Home extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final analytics = watch(analyticsProvider);
    final updateRequest = watch(updateRequestProvider);

    return updateRequest.when(
      loading: () {
        return Center(
          child: CircularProgressIndicator(),
        );
      },
      error: (error, _) {
        return Center(
          child: Text('$error'),
        );
      },
      data: (requestType) {
        WidgetsBinding.instance!.addPostFrameCallback(
          (_) {
            if (requestType != UpdateRequestType.not) {
              showDialog<void>(
                context: context,
                barrierDismissible: false,
                builder: (context) {
                  return WillPopScope(
                    // AndroidのBackボタンで閉じられないようにする
                    onWillPop: () async => false,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            maxWidth: 320,
                          ),
                          child: Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  '最新の更新があります。\nアップデートをお願いします。',
                                  style: Theme.of(context).textTheme.subtitle2,
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 16),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    if (requestType ==
                                        UpdateRequestType.cancelable)
                                      ElevatedButton(
                                        onPressed: () =>
                                            Navigator.of(context).pop(),
                                        style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(22),
                                          ),
                                          minimumSize: Size(120, 44),
                                          primary: Colors.grey.shade200,
                                        ),
                                        child: const Text('キャンセル'),
                                      ),
                                    if (requestType ==
                                        UpdateRequestType.cancelable)
                                      const SizedBox(width: 16),
                                    ElevatedButton(
                                      onPressed: () async {
                                        await AppReview.storeListing;
                                      },
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(22),
                                        ),
                                        minimumSize: Size(120, 44),
                                      ),
                                      child: const Text('アップデート'),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            }
          },
        );

        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.primary,
          body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/math.png',
                  width: 200,
                ),
                const SizedBox(height: 32),
                Text(
                  '全て解けるかな？\nあなたの計算力をチェック！！',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(height: 32),
                Center(
                  child: ElevatedButton(
                    child: Text('はじめる'),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      minimumSize: Size(200, 48),
                      primary: Colors.white,
                      onPrimary: Theme.of(context).colorScheme.primaryVariant,
                    ),
                    onPressed: () {
                      analytics.logStartGame();
                      context.refresh(randomQuizProvider);
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
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.settings,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Setting(),
                          ),
                        );
                      },
                    ),
                    const SizedBox(width: 16),
                    IconButton(
                      icon: Icon(
                        Icons.help_outline,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Help(),
                          ),
                        );
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
