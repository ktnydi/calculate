import 'package:calculate/enums/flavor.dart';
import 'package:calculate/l10n/l10n.dart';
import 'package:calculate/model/use_cases/app_localize.dart';
import 'package:calculate/model/use_cases/play_counter.dart';
import 'package:calculate/model/use_cases/request_review.dart';
import 'package:calculate/presentation/pages/app/theme.dart';
import 'package:calculate/presentation/pages/app/util.dart';
import 'package:calculate/presentation/router.dart';
import 'package:calculate/providers/review_counter_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final flavor = ref.watch(flavorProvider);
    final locale = ref.watch(localeNotifierProvider);

    ref.listen(playCounterNotifierProvider, (previous, next) async {
      final reviewCounter = await ref.watch(reviewCounterProvider.future);
      if (next < reviewCounter) return;
      if (next % reviewCounter != 0) return;

      await ref.read(requestReviewProvider)();
    });

    TextTheme textTheme = createTextTheme(context, "Lato", "Lato");

    return MaterialApp.router(
      debugShowCheckedModeBanner: flavor == Flavor.development,
      title: '計算ドリル',
      localizationsDelegates: L10n.localizationsDelegates,
      locale: locale.toLocale(),
      supportedLocales: L10n.supportedLocales,
      theme: MaterialTheme(textTheme)
          .theme(
            MaterialTheme.lightScheme().copyWith(
              outlineVariant: const Color(0xFFEBEEF2),
              surface: const Color(0xFFFFFFFF),
            ),
          )
          .copyWith(
            splashFactory: InkSparkle.splashFactory,
            appBarTheme: const AppBarTheme(
              elevation: 0,
              scrolledUnderElevation: 0,
              centerTitle: true,
              backgroundColor: Color(0xFFFFFFFF),
            ),
          ),
      darkTheme: MaterialTheme(textTheme)
          .theme(
            MaterialTheme.darkScheme().copyWith(
              outlineVariant: const Color(0xFF29323E),
            ),
          )
          .copyWith(
            splashFactory: InkSparkle.splashFactory,
            appBarTheme: const AppBarTheme(
              elevation: 0,
              scrolledUnderElevation: 0,
              centerTitle: true,
              backgroundColor: Color(0xFF0F1417),
            ),
          ),
      routerConfig: ref.watch(routerProvider),
    );
  }
}
