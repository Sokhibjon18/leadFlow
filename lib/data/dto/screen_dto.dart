import 'package:json_annotation/json_annotation.dart';
import 'package:lead_flow/data/dto/component_dto.dart';

part 'screen_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class ScreenDTO {
  @JsonKey(name: "components")
  final List<ComponentDTO> components;
  @JsonKey(name: "question")
  final String? question;
  @JsonKey(name: "name")
  final String? name;

  ScreenDTO({
    required this.components,
    required this.name,
    this.question,
  });

  factory ScreenDTO.fromJson(Map<String, dynamic> json) => _$ScreenDTOFromJson(json);

  Map<String, dynamic> toJson() => _$ScreenDTOToJson(this);
}