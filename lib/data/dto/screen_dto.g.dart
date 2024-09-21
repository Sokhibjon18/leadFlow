// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'screen_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScreenDTO _$ScreenDTOFromJson(Map<String, dynamic> json) => ScreenDTO(
      components: (json['components'] as List<dynamic>)
          .map((e) => ComponentDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['name'] as String?,
      question: json['question'] as String?,
    );

Map<String, dynamic> _$ScreenDTOToJson(ScreenDTO instance) => <String, dynamic>{
      'components': instance.components,
      'question': instance.question,
      'name': instance.name,
    };
