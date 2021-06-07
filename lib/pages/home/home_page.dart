import 'package:calculate/pages/game/game_page.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
              '全て解けるかな？\nあなたの計算力をチェック！！\n（制限時間１８０秒）',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(height: 32),
            Center(
              child: ElevatedButton(
                child: Text('はじめる'),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(22),
                  ),
                  minimumSize: Size(200, 44),
                  primary: Theme.of(context).scaffoldBackgroundColor,
                  onPrimary: Theme.of(context).colorScheme.primaryVariant,
                ),
                onPressed: () {
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
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                  onPressed: () {
                    // TODO: 設定画面
                  },
                ),
                const SizedBox(width: 16),
                IconButton(
                  icon: Icon(
                    Icons.help_outline,
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                  onPressed: () {
                    // TODO: ヘルプ画面
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
