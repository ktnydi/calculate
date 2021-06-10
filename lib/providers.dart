import 'dart:convert';

import 'package:calculate/domains/quiz/quiz.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:package_info/package_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPreferencesProvider = Provider<SharedPreferences>(
  (_) => throw UnimplementedError(),
);

final packageInfoProvider = Provider<PackageInfo>(
  (_) => throw UnimplementedError(),
);

final quizProvider = FutureProvider<List<Quiz>>(
  (ref) async {
    final prefs = ref.read(sharedPreferencesProvider);
    final isRandom = prefs.getBool('isRandom') ?? false;
    final jsonString = await rootBundle.loadString('assets/quiz.json');
    final List json = await jsonDecode(jsonString);
    final quizList = json.map((json) => Quiz.fromJson(json)).toList();
    if (isRandom) {
      quizList..shuffle();
    }
    return quizList;
  },
);
