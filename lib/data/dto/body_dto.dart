import 'package:json_annotation/json_annotation.dart';
import 'package:lead_flow/data/dto/screen_dto.dart';

part 'body_dto.g.dart';

@JsonSerializable()
class BodyDTO {
  @JsonKey(name: "screens")
  final List<ScreenDTO> screens;
  @JsonKey(name: "appName")
  final String appName;

  BodyDTO({
    required this.screens,
    required this.appName,
  });

  factory BodyDTO.fromJson(Map<String, dynamic> json) => _$BodyDTOFromJson(json);

  Map<String, dynamic> toJson() => _$BodyDTOToJson(this);
}
