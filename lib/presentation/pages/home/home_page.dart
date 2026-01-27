import 'package:auto_size_text/auto_size_text.dart';
import 'package:calculate/analytics.dart';
import 'package:calculate/config.dart';
import 'package:calculate/enums/quiz_type.dart';
import 'package:calculate/extensions/context.dart';
import 'package:calculate/l10n/l10n.dart';
import 'package:calculate/presentation/pages/game/game_page.dart';
import 'package:calculate/presentation/pages/help/help_page.dart';
import 'package:calculate/presentation/widgets/ad/ad_unit_id/ad_unit_id.dart';
import 'package:calculate/presentation/widgets/ad/bottom_ad_banner.dart';
import 'package:calculate/presentation/pages/setting/setting_page.dart';
import 'package:calculate/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final analytics = ref.watch(analyticsProvider);

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: context.colorScheme.surface,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Help(),
                ),
              );
            },
            icon: const Icon(Icons.menu),
          )
        ],
      ),
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            const SizedBox(height: kToolbarHeight),
            Expanded(
              child: LayoutBuilder(builder: (context, constraints) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minWidth: constraints.maxWidth,
                      minHeight: constraints.minHeight,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Material(
                                    color: Colors.transparent,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16),
                                      side: BorderSide(
                                        color: context.colorScheme.onSurface,
                                        width: 2,
                                      ),
                                    ),
                                    child: SvgPicture.asset(
                                      'assets/app_icon_clear.svg',
                                      width: 80,
                                      height: 80,
                                      colorFilter: ColorFilter.mode(
                                        context.colorScheme.onSurface,
                                        BlendMode.srcATop,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 32),
                                  AutoSizeText(
                                    L10n.of(context)!.appTitle,
                                    style: context.textTheme.headlineLarge!
                                        .copyWith(
                                      color: context.colorScheme.onSurface,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    maxLines: 1,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 64),
                          IntrinsicWidth(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                FilledButton(
                                  style: FilledButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.zero,
                                    ),
                                    minimumSize: const Size(232, 80),
                                    textStyle:
                                        context.textTheme.bodyLarge!.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  onPressed: () {
                                    analytics.logStartGame();

                                    ref.invalidate(quizProvider);

                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        fullscreenDialog: true,
                                        builder: (context) => const Game(
                                          quizType: QuizType.numQuizzes,
                                        ),
                                      ),
                                    );
                                  },
                                  child: FittedBox(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          'start'.toUpperCase(),
                                          textAlign: TextAlign.center,
                                          maxLines: 2,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 16),
                          TextButton(
                            onPressed: () {
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                shape: const RoundedRectangleBorder(),
                                builder: (context) {
                                  return const Setting();
                                },
                              );
                            },
                            style: TextButton.styleFrom(
                              foregroundColor: context.colorScheme.onSurface,
                              textStyle: context.textTheme.bodyLarge!.copyWith(
                                decoration: TextDecoration.underline,
                                decorationStyle: TextDecorationStyle.dotted,
                                decorationColor: context.colorScheme.onSurface,
                              ),
                            ),
                            child: Text(L10n.of(context)!.settingsButtonLabel),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ),
            const BottomAdBanner(
              adUnitId: AdUnitId(
                android: androidHomeBottomCenter,
                ios: iosHomeBottomCenter,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
