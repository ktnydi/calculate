import 'dart:convert';

import 'package:calculate/model/domains/update_info/update_info.dart';
import 'package:calculate/enums/update_request_type.dart';
import 'package:calculate/model/repositories/remote_config_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:version/version.dart';

final updateRequestProvider = FutureProvider<UpdateRequestType>(
  (ref) async {
    final repository = ref.watch(remoteConfigRepositoryProvider);
    await repository.configuration();
    await repository.fetchAndActivate();
    final packageInfo = await PackageInfo.fromPlatform();
    final updateInfoJson = repository.getString(RemoteConfigKey.updateInfo);

    if (updateInfoJson.isEmpty) {
      return UpdateRequestType.not;
    }

    final map = json.decode(updateInfoJson) as Map<String, Object?>;
    final updateInfo = UpdateInfo.fromJson(map);
    final enabledAt = updateInfo.enabledAt;
    final requiredVersion = Version.parse(updateInfo.requiredVersion);
    final currentVersion = Version.parse(packageInfo.version);
    final hasNewVersion = currentVersion < requiredVersion;
    final isEnabled = enabledAt.compareTo(DateTime.now()) < 0;

    if (!isEnabled || !hasNewVersion) {
      return UpdateRequestType.not;
    }

    return updateInfo.canCancel
        ? UpdateRequestType.cancelable
        : UpdateRequestType.forcibly;
  },
);
