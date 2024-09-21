import 'package:json_annotation/json_annotation.dart';

part 'params_dto.g.dart';

@JsonSerializable()
class ParamsDTO {
  @JsonKey(name: "size")
  final double? size;
  @JsonKey(name: "color")
  final String? color;
  @JsonKey(name: "secondaryColor")
  final String? secondaryColor;
  @JsonKey(name: "isBold")
  final bool? isBold;
  @JsonKey(name: "appUrl")
  final String? appUrl;
  @JsonKey(name: "inputName")
  final String? inputName;
  @JsonKey(name: "buttonColor")
  final String? buttonColor;
  @JsonKey(name: "cornerRadius")
  final int? cornerRadius;

  ParamsDTO({
    this.size,
    this.color,
    this.secondaryColor,
    this.isBold,
    this.appUrl,
    this.inputName,
    this.buttonColor,
    this.cornerRadius,
  });

  factory ParamsDTO.fromJson(Map<String, dynamic> json) => _$ParamsDTOFromJson(json);

  Map<String, dynamic> toJson() => _$ParamsDTOToJson(this);
}