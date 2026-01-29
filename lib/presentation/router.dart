import 'package:calculate/analytics.dart';
import 'package:calculate/model/domains/answer/answer.dart';
import 'package:calculate/presentation/pages/game/game_page.dart';
import 'package:calculate/presentation/pages/game_result/game_result_page.dart';
import 'package:calculate/presentation/pages/help/help_page.dart';
import 'package:calculate/presentation/pages/home/home_page.dart';
import 'package:calculate/presentation/pages/version_check/version_check_page.dart';
import 'package:calculate/presentation/pages/web_view/web_view_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final routerProvider = Provider((ref) {
  final analytics = ref.watch(analyticsProvider);

  final router = GoRouter(
    initialLocation: '/version_check',
    routes: [
      GoRoute(
        path: '/version_check',
        builder: (context, state) => VersionCheckPage(),
      ),
      GoRoute(
        path: '/',
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: Home(),
            transitionDuration: const Duration(milliseconds: 500),
            transitionsBuilder: (context, animation, _, child) {
              return FadeTransition(
                opacity: animation.drive(Tween(begin: 0, end: 1)),
                child: child,
              );
            },
          );
        },
        routes: [
          GoRoute(
            path: '/help',
            builder: (context, state) {
              return Help();
            },
            routes: [
              GoRoute(
                path: '/feedback',
                builder: (context, state) {
                  return WebViewPage(WebSite.feedback.url);
                },
              ),
              GoRoute(
                path: '/terms',
                builder: (context, state) {
                  return WebViewPage(WebSite.terms.url);
                },
              ),
              GoRoute(
                path: '/policy',
                builder: (context, state) {
                  return WebViewPage(WebSite.policy.url);
                },
              ),
            ],
          ),
          GoRoute(
            path: '/game',
            builder: (context, state) {
              return Game();
            },
            pageBuilder: (context, state) {
              return CustomTransitionPage(
                key: state.pageKey,
                child: Game(),
                fullscreenDialog: true,
                transitionDuration: Duration(milliseconds: 400),
                transitionsBuilder: (context, animation, _, child) {
                  return SlideTransition(
                    position: animation.drive(
                      Tween(begin: Offset(0, 1), end: Offset.zero).chain(
                        CurveTween(curve: Curves.ease),
                      ),
                    ),
                    child: child,
                  );
                },
              );
            },
          ),
          GoRoute(
            path: '/game/result',
            pageBuilder: (context, state) {
              final answers = state.extra! as List<Answer>;
              return CustomTransitionPage(
                key: state.pageKey,
                child: GameResult(answers),
                fullscreenDialog: true,
                transitionsBuilder: (context, animation, _, child) {
                  if (animation.status == AnimationStatus.reverse) {
                    return SlideTransition(
                      position: animation.drive(
                        Tween(begin: Offset(0, 1), end: Offset.zero).chain(
                          CurveTween(curve: Curves.ease),
                        ),
                      ),
                      child: child,
                    );
                  }

                  return FadeTransition(
                    opacity: animation,
                    child: child,
                  );
                },
              );
            },
          ),
        ],
      ),
    ],
    observers: [
      analytics.observer,
    ],
  );

  return router;
});

enum WebSite {
  feedback(
      'https://docs.google.com/forms/d/e/1FAIpQLSe_4ggMubBXHaUCRqEbDckA1Eibx-zt8K4F6V-K0lXuSRqBiQ/viewform?usp=sf_link'),
  terms(
      'https://toothsome-persimmon-e89.notion.site/dc7d95253ab1441c9ec099c1b79e2c67'),
  policy(
      'https://toothsome-persimmon-e89.notion.site/d9bdcb0258c846eb987f08e583dd7ff2'),
  ;

  const WebSite(this.url);

  final String url;
}
