import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final analyticsProvider = Provider((_) => Analytics());

class Analytics {
  final _instance = FirebaseAnalytics.instance;
  late final observer = FirebaseAnalyticsObserver(analytics: _instance);

  Future<void> logStartGame() async {
    await _instance.logEvent(name: 'start_game');
  }

  Future<void> logRestartGame() async {
    await _instance.logEvent(name: 'replay_game');
  }

  Future<void> logStopGame() async {
    await _instance.logEvent(name: 'stop_game');
  }

  Future<void> logTracking(TrackingStatus status) async {
    if (status == TrackingStatus.authorized) {
      await _instance.logEvent(name: 'authorized_tracking');
    }

    if (status == TrackingStatus.denied) {
      await _instance.logEvent(name: 'denied_tracking');
    }
  }
}
