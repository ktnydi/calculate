import 'package:calculate/model/repositories/remote_config_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final reviewCounterProvider = FutureProvider<int>(
  (ref) async {
    final repository = ref.watch(remoteConfigRepositoryProvider);
    await repository.configuration();
    await repository.fetchAndActivate();
    final reviewCounter = repository.getInt(RemoteConfigKey.reviewCounter);
    return reviewCounter;
  },
);
