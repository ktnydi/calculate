import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'l10n_en.dart';
import 'l10n_ja.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of L10n
/// returned by `L10n.of(context)`.
///
/// Applications need to include `L10n.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/l10n.dart';
///
/// return MaterialApp(
///   localizationsDelegates: L10n.localizationsDelegates,
///   supportedLocales: L10n.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the L10n.supportedLocales
/// property.
abstract class L10n {
  L10n(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static L10n? of(BuildContext context) {
    return Localizations.of<L10n>(context, L10n);
  }

  static const LocalizationsDelegate<L10n> delegate = _L10nDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ja')
  ];

  /// No description provided for @appTitle.
  ///
  /// In ja, this message translates to:
  /// **'Keisan Doriru'**
  String get appTitle;

  /// No description provided for @appMessage.
  ///
  /// In ja, this message translates to:
  /// **'Let\'s challenge!'**
  String get appMessage;

  /// No description provided for @startButtonLabel.
  ///
  /// In ja, this message translates to:
  /// **'スタート'**
  String get startButtonLabel;

  /// No description provided for @quizCategoryMode.
  ///
  /// In ja, this message translates to:
  /// **'{value, select, random{ミックス} add{足し算} subtraction{引き算} division{割り算} multiplication{掛け算} other{}}'**
  String quizCategoryMode(String value);

  /// No description provided for @quizCategory.
  ///
  /// In ja, this message translates to:
  /// **'{value, select, additional{足し算} subtraction{引き算} division{割り算} multiplication{掛け算} other{}}'**
  String quizCategory(String value);

  /// No description provided for @quizType.
  ///
  /// In ja, this message translates to:
  /// **'{value, select, timeLimit{時間制限} numQuizzes{問題数} other{}}'**
  String quizType(String value);

  /// No description provided for @quizSize.
  ///
  /// In ja, this message translates to:
  /// **'{value} 問'**
  String quizSize(int value);

  /// No description provided for @settingsButtonLabel.
  ///
  /// In ja, this message translates to:
  /// **'設定'**
  String get settingsButtonLabel;

  /// No description provided for @currentQuizNumber.
  ///
  /// In ja, this message translates to:
  /// **'Q{value}'**
  String currentQuizNumber(int value);

  /// No description provided for @quizSettingsDescription.
  ///
  /// In ja, this message translates to:
  /// **'「{quizCategory}」の問題を「{quizSize}問」'**
  String quizSettingsDescription(String quizCategory, int quizSize);

  /// No description provided for @gameResultPageTitle.
  ///
  /// In ja, this message translates to:
  /// **'結果'**
  String get gameResultPageTitle;

  /// No description provided for @gameSettingsSectionLabel.
  ///
  /// In ja, this message translates to:
  /// **'設定'**
  String get gameSettingsSectionLabel;

  /// No description provided for @averageTimeSectionLabel.
  ///
  /// In ja, this message translates to:
  /// **'平均タイム'**
  String get averageTimeSectionLabel;

  /// No description provided for @answeredQuizSectionLabel.
  ///
  /// In ja, this message translates to:
  /// **'解答した問題'**
  String get answeredQuizSectionLabel;

  /// No description provided for @allQuizAverageTimeLabel.
  ///
  /// In ja, this message translates to:
  /// **'全体'**
  String get allQuizAverageTimeLabel;

  /// No description provided for @seconds.
  ///
  /// In ja, this message translates to:
  /// **'秒'**
  String get seconds;

  /// No description provided for @retryButtonLabel.
  ///
  /// In ja, this message translates to:
  /// **'リトライ'**
  String get retryButtonLabel;

  /// No description provided for @homeButtonLabel.
  ///
  /// In ja, this message translates to:
  /// **'ホーム'**
  String get homeButtonLabel;

  /// No description provided for @settingsPageTitle.
  ///
  /// In ja, this message translates to:
  /// **'プレイ設定'**
  String get settingsPageTitle;

  /// No description provided for @languageSettingsTileLabel.
  ///
  /// In ja, this message translates to:
  /// **'言語設定'**
  String get languageSettingsTileLabel;

  /// No description provided for @helpPageTitle.
  ///
  /// In ja, this message translates to:
  /// **'ヘルプ'**
  String get helpPageTitle;

  /// No description provided for @feedbackTileLabel.
  ///
  /// In ja, this message translates to:
  /// **'フィードバック'**
  String get feedbackTileLabel;

  /// No description provided for @reviewTileLabel.
  ///
  /// In ja, this message translates to:
  /// **'レビューを書く'**
  String get reviewTileLabel;

  /// No description provided for @licenseTileLabel.
  ///
  /// In ja, this message translates to:
  /// **'ライセンス'**
  String get licenseTileLabel;

  /// No description provided for @termsOfUseTileLabel.
  ///
  /// In ja, this message translates to:
  /// **'利用規約'**
  String get termsOfUseTileLabel;

  /// No description provided for @privacyPolicyTileLabel.
  ///
  /// In ja, this message translates to:
  /// **'プライバシーポリシー'**
  String get privacyPolicyTileLabel;

  /// No description provided for @versionTileLabel.
  ///
  /// In ja, this message translates to:
  /// **'バージョン'**
  String get versionTileLabel;

  /// No description provided for @updateRequestTitle.
  ///
  /// In ja, this message translates to:
  /// **'アップデートのお知らせ'**
  String get updateRequestTitle;

  /// No description provided for @updateRequestMessage.
  ///
  /// In ja, this message translates to:
  /// **'新しいバージョンのアプリをリリースしました。アップデートしてください。'**
  String get updateRequestMessage;

  /// No description provided for @cancelUpdateButtonLabel.
  ///
  /// In ja, this message translates to:
  /// **'あとで行う'**
  String get cancelUpdateButtonLabel;

  /// No description provided for @okUpdateButtonLabel.
  ///
  /// In ja, this message translates to:
  /// **'アップデート'**
  String get okUpdateButtonLabel;
}

class _L10nDelegate extends LocalizationsDelegate<L10n> {
  const _L10nDelegate();

  @override
  Future<L10n> load(Locale locale) {
    return SynchronousFuture<L10n>(lookupL10n(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'ja'].contains(locale.languageCode);

  @override
  bool shouldReload(_L10nDelegate old) => false;
}

L10n lookupL10n(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return L10nEn();
    case 'ja':
      return L10nJa();
  }

  throw FlutterError(
      'L10n.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
