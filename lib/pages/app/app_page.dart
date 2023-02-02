import 'package:calculate/analytics.dart';
import 'package:calculate/enums/flavor.dart';
import 'package:calculate/pages/version_check/version_check_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final analytics = ref.watch(analyticsProvider);
    final flavor = ref.watch(flavorProvider);

    return MaterialApp(
      debugShowCheckedModeBanner: flavor == Flavor.development,
      title: '計算ドリル',
      theme: ThemeData.from(
        colorScheme: ColorScheme.light(
          primary: Color(0xFFB4CEB3),
          onPrimary: Color(0xFF000000),
          secondary: Color(0xFFB4CEB3),
          onSecondary: Color(0xFF000000),
        ),
      ).copyWith(
        primaryColor: Color(0xFFB4CEB3),
        scaffoldBackgroundColor: Color(0xFFF4F5F7),
        appBarTheme: AppBarTheme(
          elevation: 1,
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
            foregroundColor: Color(0xFF849D83),
          ),
        ),
      ),
      home: Scaffold(
        body: VersionCheckPage(),
      ),
      navigatorObservers: [
        analytics.observer,
      ],
    );
  }
}
