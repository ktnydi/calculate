// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class L10nJa extends L10n {
  L10nJa([String locale = 'ja']) : super(locale);

  @override
  String get appTitle => 'Keisan Doriru';

  @override
  String get appMessage => 'Let\'s challenge!';

  @override
  String get startButtonLabel => 'スタート';

  @override
  String quizCategoryMode(String value) {
    String _temp0 = intl.Intl.selectLogic(
      value,
      {
        'random': 'ミックス',
        'addition': '足し算',
        'subtraction': '引き算',
        'division': '割り算',
        'multiplication': '掛け算',
        'other': '',
      },
    );
    return '$_temp0';
  }

  @override
  String quizCategory(String value) {
    String _temp0 = intl.Intl.selectLogic(
      value,
      {
        'addition': '足し算',
        'subtraction': '引き算',
        'division': '割り算',
        'multiplication': '掛け算',
        'other': '',
      },
    );
    return '$_temp0';
  }

  @override
  String digit(int digit) {
    return '$digit 桁';
  }

  @override
  String get digitDescription => '問題の桁数は加減乗除の各設定が使用されます。';

  @override
  String quizSize(int value) {
    return '$value 問';
  }

  @override
  String get settingsButtonLabel => '設定';

  @override
  String currentQuizNumber(int value) {
    return 'Q$value';
  }

  @override
  String quizSettingsDescription(
    int? firstDigit,
    int? secondDigit,
    String quizCategory,
    int quizSize,
  ) {
    String _temp0 = intl.Intl.selectLogic(
      quizCategory,
      {
        'random': '',
        'other': '$firstDigit桁 と $secondDigit桁 の ',
      },
    );
    String _temp1 = intl.Intl.selectLogic(
      quizCategory,
      {
        'random': 'ミックス',
        'addition': '足し算',
        'subtraction': '引き算',
        'division': '割り算',
        'multiplication': '掛け算',
        'other': '',
      },
    );
    return '$_temp0$_temp1 を $quizSize問';
  }

  @override
  String get gameResultPageTitle => '結果';

  @override
  String get gameSettingsSectionLabel => '設定';

  @override
  String get averageTimeSectionLabel => '平均タイム';

  @override
  String get answeredQuizSectionLabel => '解答した問題';

  @override
  String get allQuizAverageTimeLabel => '全体';

  @override
  String get seconds => '秒';

  @override
  String get retryButtonLabel => 'リトライ';

  @override
  String get homeButtonLabel => 'ホーム';

  @override
  String get settingsPageTitle => 'プレイ設定';

  @override
  String get languageSettingsTileLabel => '言語設定';

  @override
  String get helpPageTitle => 'ヘルプ';

  @override
  String get feedbackTileLabel => 'フィードバック';

  @override
  String get reviewTileLabel => 'レビューを書く';

  @override
  String get licenseTileLabel => 'ライセンス';

  @override
  String get termsOfUseTileLabel => '利用規約';

  @override
  String get privacyPolicyTileLabel => 'プライバシーポリシー';

  @override
  String get versionTileLabel => 'バージョン';

  @override
  String get updateRequestTitle => 'アップデートのお知らせ';

  @override
  String get updateRequestMessage => '新しいバージョンのアプリをリリースしました。アップデートしてください。';

  @override
  String get cancelUpdateButtonLabel => 'あとで行う';

  @override
  String get okUpdateButtonLabel => 'アップデート';
}
