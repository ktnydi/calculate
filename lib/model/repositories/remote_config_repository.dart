import 'package:calculate/enums/flavor.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum RemoteConfigKey {
  updateInfo('update_info'),
  reviewCounter('review_counter'),
  ;

  const RemoteConfigKey(this.key);

  final String key;
}

final remoteConfigRepositoryProvider = Provider(
  (ref) => RemoteConfigRepository(ref, FirebaseRemoteConfig.instance),
);

class RemoteConfigRepository {
  RemoteConfigRepository(this.ref, this.rc);

  final Ref ref;
  final FirebaseRemoteConfig rc;

  Future<void> configuration() async {
    final flavor = ref.read(flavorProvider);
    final interval = flavor == Flavor.production
        ? const Duration(minutes: 12)
        : const Duration(seconds: 10);
    await rc.setConfigSettings(
      RemoteConfigSettings(
        minimumFetchInterval: interval,
        fetchTimeout: const Duration(minutes: 1),
      ),
    );
    await rc.setDefaults({
      RemoteConfigKey.reviewCounter.key: '20',
    });
  }

  Future<void> fetchAndActivate() async {
    await rc.fetchAndActivate();
  }

  String getString(RemoteConfigKey value) {
    return rc.getString(value.key);
  }

  int getInt(RemoteConfigKey value) {
    return rc.getInt(value.key);
  }
}
