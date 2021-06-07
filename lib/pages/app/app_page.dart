import 'package:calculate/pages/home/home_page.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.light(
          primary: Color(0xFFB4CEB3),
          primaryVariant: Color(0xFF849D83),
          onPrimary: Color(0xFF000000),
        ),
        primaryColor: Color(0xFFB4CEB3),
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
      ),
      home: Home(),
    );
  }
}
