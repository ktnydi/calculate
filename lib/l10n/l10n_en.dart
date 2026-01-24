// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class L10nEn extends L10n {
  L10nEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Keisan Doriru';

  @override
  String get appMessage => 'Let\'s challenge!';

  @override
  String get startButtonLabel => 'Start';

  @override
  String quizCategoryMode(String value) {
    String _temp0 = intl.Intl.selectLogic(
      value,
      {
        'random': 'Mix',
        'add': 'Addition',
        'subtraction': 'Subtraction',
        'division': 'Division',
        'multiplication': 'Multiplication',
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
        'additional': 'Addition',
        'subtraction': 'Subtraction',
        'division': 'Division',
        'multiplication': 'Multiplication',
        'other': '',
      },
    );
    return '$_temp0';
  }

  @override
  String quizType(String value) {
    String _temp0 = intl.Intl.selectLogic(
      value,
      {
        'timeLimit': 'Time Limit',
        'numQuizzes': 'Number',
        'other': '',
      },
    );
    return '$_temp0';
  }

  @override
  String quizSize(int value) {
    return '$value Q';
  }

  @override
  String get settingsButtonLabel => 'Settings';

  @override
  String currentQuizNumber(int value) {
    return 'Q$value';
  }

  @override
  String get gameResultPageTitle => 'Result';

  @override
  String get gameSettingsSectionLabel => 'Settings';

  @override
  String get averageTimeSectionLabel => 'Average Time';

  @override
  String get answeredQuizSectionLabel => 'Your answer';

  @override
  String get allQuizAverageTimeLabel => 'All';

  @override
  String get seconds => 's';

  @override
  String get retryButtonLabel => 'Retry';

  @override
  String get homeButtonLabel => 'Home';

  @override
  String get settingsPageTitle => 'Settings';

  @override
  String get languageSettingsTileLabel => 'Language';

  @override
  String get helpPageTitle => 'Help';

  @override
  String get feedbackTileLabel => 'Feedback';

  @override
  String get reviewTileLabel => 'Write a Review';

  @override
  String get licenseTileLabel => 'Licenses';

  @override
  String get termsOfUseTileLabel => 'Terms of Use';

  @override
  String get privacyPolicyTileLabel => 'Privacy Policy';

  @override
  String get versionTileLabel => 'Version';

  @override
  String get updateRequestTitle => 'New Version of the App Released';

  @override
  String get updateRequestMessage =>
      'A new version of the app is available. Please download the latest version.';

  @override
  String get cancelUpdateButtonLabel => 'Later';

  @override
  String get okUpdateButtonLabel => 'Update';
}
