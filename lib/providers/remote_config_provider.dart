import 'package:calculate/enums/flavor.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final remoteConfigProvider = Provider<FirebaseRemoteConfig>(
  (ref) {
    final rc = FirebaseRemoteConfig.instance;
    final flavor = ref.read(flavorProvider);
    final interval = flavor == Flavor.production
        ? Duration(minutes: 12)
        : Duration(seconds: 10);
    rc.setConfigSettings(
      RemoteConfigSettings(
        minimumFetchInterval: interval,
        fetchTimeout: Duration(minutes: 1),
      ),
    );
    return rc;
  },
);
