// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UpdateInfo _$UpdateInfoFromJson(Map<String, dynamic> json) => _UpdateInfo(
  requiredVersion: json['requiredVersion'] as String,
  canCancel: json['canCancel'] as bool? ?? false,
  enabledAt: DateTime.parse(json['enabledAt'] as String),
);

Map<String, dynamic> _$UpdateInfoToJson(_UpdateInfo instance) =>
    <String, dynamic>{
      'requiredVersion': instance.requiredVersion,
      'canCancel': instance.canCancel,
      'enabledAt': instance.enabledAt.toIso8601String(),
    };
