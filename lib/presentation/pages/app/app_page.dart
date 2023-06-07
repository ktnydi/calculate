import 'package:calculate/analytics.dart';
import 'package:calculate/enums/flavor.dart';
import 'package:calculate/model/use_cases/play_counter.dart';
import 'package:calculate/model/use_cases/request_review.dart';
import 'package:calculate/presentation/pages/version_check/version_check_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final analytics = ref.watch(analyticsProvider);
    final flavor = ref.watch(flavorProvider);

    ref.listen(playCounterNotifierProvider, (previous, next) async {
      if (next < 5) return;
      if (next % 5 != 0) return;

      await ref.read(requestReviewProvider)();
    });

    return MaterialApp(
      debugShowCheckedModeBanner: flavor == Flavor.development,
      title: '計算ドリル',
      theme: ThemeData.from(
        colorScheme: const ColorScheme.light(
          primary: Color(0xFFB4CEB3),
          onPrimary: Color(0xFF000000),
          secondary: Color(0xFFB4CEB3),
          onSecondary: Color(0xFF000000),
        ),
      ).copyWith(
        primaryColor: const Color(0xFFB4CEB3),
        scaffoldBackgroundColor: const Color(0xFFF4F5F7),
        appBarTheme: const AppBarTheme(
          elevation: 1,
          centerTitle: true,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            elevation: 0,
          ).copyWith(
            elevation: MaterialStateProperty.resolveWith(
              (states) {
                return 0;
              },
            ),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: const Color(0xFF849D83),
          ),
        ),
      ),
      home: const Scaffold(
        body: VersionCheckPage(),
      ),
      navigatorObservers: [
        analytics.observer,
      ],
    );
  }
}
