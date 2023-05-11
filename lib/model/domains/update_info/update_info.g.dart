// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UpdateInfo _$_$_UpdateInfoFromJson(Map<String, dynamic> json) {
  return _$_UpdateInfo(
    requiredVersion: json['requiredVersion'] as String,
    canCancel: json['canCancel'] as bool? ?? false,
    enabledAt: DateTime.parse(json['enabledAt'] as String),
  );
}

Map<String, dynamic> _$_$_UpdateInfoToJson(_$_UpdateInfo instance) =>
    <String, dynamic>{
      'requiredVersion': instance.requiredVersion,
      'canCancel': instance.canCancel,
      'enabledAt': instance.enabledAt.toIso8601String(),
    };
