import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'ad_unit_id.freezed.dart';

/// ユニットIdは`lib/config.dart`に記載したものを利用する（Github管理対象外）。

@freezed
class AdUnitId with _$AdUnitId {
  const AdUnitId._();

  const factory AdUnitId({
    required String android,
    required String ios,
  }) = _AdUnitId;

  String get platform {
    return Platform.isAndroid ? android : ios;
  }
}
