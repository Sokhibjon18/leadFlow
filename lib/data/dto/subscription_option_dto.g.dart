// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription_option_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubscriptionDTO _$SubscriptionDTOFromJson(Map<String, dynamic> json) =>
    SubscriptionDTO(
      title: json['title'] as String,
      priceIdTest: json['price_id_test'] as String,
      priceId: json['price_id'] as String,
      oldPrice: json['old_price'] as String,
      price: json['price'] as String,
      unit: json['unit'] as String,
      unitInterval: json['unit_interval'] as String,
      attention: json['attention'] as String,
      selected: json['selected'] as bool?,
    );

Map<String, dynamic> _$SubscriptionDTOToJson(SubscriptionDTO instance) =>
    <String, dynamic>{
      'title': instance.title,
      'price_id_test': instance.priceIdTest,
      'price_id': instance.priceId,
      'old_price': instance.oldPrice,
      'price': instance.price,
      'unit': instance.unit,
      'unit_interval': instance.unitInterval,
      'attention': instance.attention,
      'selected': instance.selected,
    };
