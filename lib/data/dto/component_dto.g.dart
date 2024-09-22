// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'component_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ComponentDTO _$ComponentDTOFromJson(Map<String, dynamic> json) => ComponentDTO(
      type: json['type'] as String,
      params: ParamsDTO.fromJson(json['params'] as Map<String, dynamic>),
      imageLink: json['imageLink'] as String?,
      textViewOptions: (json['textViewOptions'] as List<dynamic>?)
          ?.map((e) => TextViewOptionDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      subscriptionOptions: (json['subscriptionOptions'] as List<dynamic>?)
          ?.map((e) => SubscriptionDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ComponentDTOToJson(ComponentDTO instance) =>
    <String, dynamic>{
      'type': instance.type,
      'params': instance.params.toJson(),
      'imageLink': instance.imageLink,
      'textViewOptions':
          instance.textViewOptions?.map((e) => e.toJson()).toList(),
      'subscriptionOptions':
          instance.subscriptionOptions?.map((e) => e.toJson()).toList(),
    };
