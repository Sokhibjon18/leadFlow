import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:lead_flow/data/models/subscription_params.dart';

part 'subscription_option_dto.g.dart';

@JsonSerializable()
class SubscriptionDTO {
  @JsonKey(name: "title")
  final String title;
  @JsonKey(name: "price_id_test")
  final String priceIdTest;
  @JsonKey(name: "price_id")
  final String priceId;
  @JsonKey(name: "old_price")
  final String oldPrice;
  @JsonKey(name: "price")
  final String price;
  @JsonKey(name: "unit")
  final String unit;
  @JsonKey(name: "unit_interval")
  final String unitInterval;
  @JsonKey(name: "attention")
  final String attention;
  @JsonKey(name: "selected")
  final bool? selected;

  SubscriptionDTO({
    required this.title,
    required this.priceIdTest,
    required this.priceId,
    required this.oldPrice,
    required this.price,
    required this.unit,
    required this.unitInterval,
    required this.attention,
    this.selected,
  });

  SubscriptionButtonParams toSubscriptionButtonParams(String selectionColor) =>
      SubscriptionButtonParams(
        title,
        kDebugMode ? priceIdTest : priceId,
        oldPrice,
        price,
        unit,
        unitInterval,
        attention,
        selected ?? false,
        selectionColor,
      );

  factory SubscriptionDTO.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionDTOFromJson(json);

  Map<String, dynamic> toJson() => _$SubscriptionDTOToJson(this);
}