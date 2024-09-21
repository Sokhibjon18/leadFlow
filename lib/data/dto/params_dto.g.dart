// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'params_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ParamsDTO _$ParamsDTOFromJson(Map<String, dynamic> json) => ParamsDTO(
      size: (json['size'] as num?)?.toDouble(),
      color: json['color'] as String?,
      secondaryColor: json['secondaryColor'] as String?,
      isBold: json['isBold'] as bool?,
      appUrl: json['appUrl'] as String?,
      inputName: json['inputName'] as String?,
      buttonColor: json['buttonColor'] as String?,
      cornerRadius: (json['cornerRadius'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ParamsDTOToJson(ParamsDTO instance) => <String, dynamic>{
      'size': instance.size,
      'color': instance.color,
      'secondaryColor': instance.secondaryColor,
      'isBold': instance.isBold,
      'appUrl': instance.appUrl,
      'inputName': instance.inputName,
      'buttonColor': instance.buttonColor,
      'cornerRadius': instance.cornerRadius,
    };
