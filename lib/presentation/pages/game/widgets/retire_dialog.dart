import 'package:calculate/analytics.dart';
import 'package:calculate/presentation/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RetireDialog extends ConsumerWidget {
  const RetireDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final analytics = ref.watch(analyticsProvider);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 40,
          height: 3,
          margin: const EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
            color: Theme.of(context).dividerColor,
            borderRadius: BorderRadius.circular(3),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                '中断してもよろしいですか？',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'ホーム画面に戻ります。',
                style: TextStyle(
                  color: Theme.of(context).textTheme.bodySmall!.color,
                ),
              ),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(22),
                      ),
                      backgroundColor: Colors.grey.shade200,
                      minimumSize: const Size(120, 44),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('キャンセル'),
                  ),
                  const SizedBox(width: 16),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(22),
                      ),
                      minimumSize: const Size(120, 44),
                    ),
                    onPressed: () {
                      analytics.logStopGame();
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
                    child: const Text('中断する'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
