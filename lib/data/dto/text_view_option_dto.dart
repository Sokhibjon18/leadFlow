import 'package:json_annotation/json_annotation.dart';

part 'text_view_option_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class TextViewOptionDTO {
  @JsonKey(name: "text")
  final String text;
  @JsonKey(name: "icon")
  final String? icon;

  TextViewOptionDTO({
    required this.text,
    this.icon,
  });

  factory TextViewOptionDTO.fromJson(Map<String, dynamic> json) => _$TextViewOptionDTOFromJson(json);

  Map<String, dynamic> toJson() => _$TextViewOptionDTOToJson(this);
}
