import 'package:flutter_riverpod/flutter_riverpod.dart';

final flavorProvider = Provider<Flavor>(
  (_) => Flavor.values.firstWhere(
    (value) {
      const flavor = String.fromEnvironment('FLAVOR');
      return value.name == flavor;
    },
    orElse: () => Flavor.development,
  ),
);

enum Flavor {
  development,
  staging,
  production,
}

extension FlavorEx on Flavor {
  String get name {
    switch (this) {
      case Flavor.development:
        return 'development';
      case Flavor.staging:
        return 'staging';
      case Flavor.production:
        return 'production';
    }
  }
}
