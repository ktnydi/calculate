import 'package:calculate/enums/supported_locale.dart';
import 'package:calculate/l10n/l10n.dart';
import 'package:calculate/model/use_cases/app_localize.dart';
import 'package:calculate/model/use_cases/request_review.dart';
import 'package:calculate/extensions/context.dart';
import 'package:calculate/providers.dart';
import 'package:calculate/presentation/pages/web_view/web_view_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Help extends StatelessWidget {
  const Help({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.surface,
      appBar: AppBar(
        title: Text(L10n.of(context)!.helpPageTitle),
      ),
      body: ListView(
        children: [
          Consumer(
            builder: (context, ref, child) {
              final localeState = ref.watch(localeNotifierProvider);

              return ListTile(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    backgroundColor: context.colorScheme.surface,
                    shape: const RoundedRectangleBorder(),
                    builder: (context) {
                      return const LanguageSettings();
                    },
                  );
                },
                title: Row(
                  children: [
                    Expanded(
                      child: Text(L10n.of(context)!.languageSettingsTileLabel),
                    ),
                    Text(localeState.label),
                  ],
                ),
                trailing: const Icon(Icons.navigate_next),
              );
            },
          ),
          const Divider(height: 1, indent: 16, endIndent: 16),
          ListTile(
            title: Text(L10n.of(context)!.feedbackTileLabel),
            trailing: const Icon(Icons.navigate_next),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const WebViewPage(
                    'https://docs.google.com/forms/d/e/1FAIpQLSe_4ggMubBXHaUCRqEbDckA1Eibx-zt8K4F6V-K0lXuSRqBiQ/viewform?usp=sf_link',
                  ),
                ),
              );
            },
          ),
          const Divider(height: 1, indent: 16, endIndent: 16),
          Consumer(
            builder: (context, ref, child) {
              return ListTile(
                title: Text(L10n.of(context)!.reviewTileLabel),
                trailing: const Icon(Icons.navigate_next),
                onTap: () async {
                  ref.read(requestReviewProvider).openAppStore();
                },
              );
            },
          ),
          const Divider(height: 1, indent: 16, endIndent: 16),
          Consumer(
            builder: (context, ref, child) {
              final packageInfo = ref.watch(packageInfoProvider);
              return ListTile(
                title: Text(L10n.of(context)!.licenseTileLabel),
                trailing: const Icon(Icons.navigate_next),
                onTap: () {
                  showLicensePage(
                    context: context,
                    applicationName: packageInfo.appName,
                    applicationVersion: packageInfo.version,
                  );
                },
              );
            },
          ),
          const Divider(height: 1, indent: 16, endIndent: 16),
          ListTile(
            title: Text(L10n.of(context)!.termsOfUseTileLabel),
            trailing: const Icon(Icons.navigate_next),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const WebViewPage(
                    'https://toothsome-persimmon-e89.notion.site/dc7d95253ab1441c9ec099c1b79e2c67',
                  ),
                ),
              );
            },
          ),
          const Divider(height: 1, indent: 16, endIndent: 16),
          ListTile(
            title: Text(L10n.of(context)!.privacyPolicyTileLabel),
            trailing: const Icon(Icons.navigate_next),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const WebViewPage(
                    'https://toothsome-persimmon-e89.notion.site/d9bdcb0258c846eb987f08e583dd7ff2',
                  ),
                ),
              );
            },
          ),
          const Divider(height: 1, indent: 16, endIndent: 16),
          Consumer(
            builder: (context, ref, child) {
              final packageInfo = ref.watch(packageInfoProvider);
              return ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(L10n.of(context)!.versionTileLabel),
                    Text(
                      '${packageInfo.version}+${packageInfo.buildNumber}',
                      style: TextStyle(
                        color: Theme.of(context).textTheme.bodySmall!.color,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          const Divider(height: 1, indent: 16, endIndent: 16),
        ],
      ),
    );
  }
}

class LanguageSettings extends ConsumerWidget {
  const LanguageSettings({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localeState = ref.watch(localeNotifierProvider);

    return SafeArea(
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          final value = SupportedLocale.values[index];
          final selected = value == localeState;

          return ListTile(
            title: Row(
              children: [
                Expanded(
                  child: Text(value.label),
                ),
                selected ? const Icon(Icons.check) : const SizedBox(),
              ],
            ),
            onTap: () {
              ref.read(localeNotifierProvider.notifier).change(value);
            },
          );
        },
        separatorBuilder: (_, __) => const Divider(height: 1),
        itemCount: SupportedLocale.values.length,
      ),
    );
  }
}
