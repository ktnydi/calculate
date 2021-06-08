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
