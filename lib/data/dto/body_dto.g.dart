// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'body_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BodyDTO _$BodyDTOFromJson(Map<String, dynamic> json) => BodyDTO(
      screens: (json['screens'] as List<dynamic>)
          .map((e) => ScreenDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      appName: json['appName'] as String,
    );

Map<String, dynamic> _$BodyDTOToJson(BodyDTO instance) => <String, dynamic>{
      'screens': instance.screens,
      'appName': instance.appName,
    };
