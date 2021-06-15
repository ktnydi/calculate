import 'package:calculate/analytics.dart';
import 'package:calculate/enums/flavor.dart';
import 'package:calculate/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final analytics = watch(analyticsProvider);
    final flavor = watch(flavorProvider);

    return MaterialApp(
      debugShowCheckedModeBanner: flavor == Flavor.development,
      title: 'Flutter Demo',
      theme: ThemeData.from(
        colorScheme: ColorScheme.light(
          primary: Color(0xFFB4CEB3),
          primaryVariant: Color(0xFF849D83),
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
            primary: Color(0xFF849D83),
          ),
        ),
      ),
      home: Scaffold(
        body: Home(),
      ),
      navigatorObservers: [
        analytics.observer,
      ],
    );
  }
}
