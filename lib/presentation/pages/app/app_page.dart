import 'package:calculate/analytics.dart';
import 'package:calculate/enums/flavor.dart';
import 'package:calculate/model/use_cases/app_localize.dart';
import 'package:calculate/model/use_cases/play_counter.dart';
import 'package:calculate/model/use_cases/request_review.dart';
import 'package:calculate/presentation/pages/version_check/version_check_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final analytics = ref.watch(analyticsProvider);
    final flavor = ref.watch(flavorProvider);
    final locale = ref.watch(localeNotifierProvider);

    ref.listen(playCounterNotifierProvider, (previous, next) async {
      if (next < 5) return;
      if (next % 5 != 0) return;

      await ref.read(requestReviewProvider)();
    });

    return MaterialApp(
      debugShowCheckedModeBanner: flavor == Flavor.development,
      title: '計算ドリル',
      localizationsDelegates: L10n.localizationsDelegates,
      locale: locale.toLocale(),
      supportedLocales: L10n.supportedLocales,
      theme: ThemeData.from(
        colorScheme: const ColorScheme.light(
          primary: Color(0xFFB4CEB3),
          onPrimary: Color(0xFF000000),
          secondary: Color(0xFFB4CEB3),
          onSecondary: Color(0xFF000000),
          outline: Color(0xFF79747E),
          outlineVariant: Color(0xFFCAC4D0),
        ),
      ).copyWith(
        scaffoldBackgroundColor: const Color(0xFFF4F5F7),
        appBarTheme: AppBarTheme(
          elevation: 0,
          scrolledUnderElevation: 0,
          centerTitle: true,
          backgroundColor: const Color(0xFFFFFFFF),
          foregroundColor: Typography.material2021().black.bodyMedium!.color,
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
