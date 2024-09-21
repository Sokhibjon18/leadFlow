import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:lead_flow/data/dto/params_dto.dart';
import 'package:lead_flow/data/dto/subscription_option_dto.dart';
import 'package:lead_flow/data/dto/text_view_option_dto.dart';
import 'package:lead_flow/data/models/button_params.dart';
import 'package:lead_flow/data/models/component_params.dart';
import 'package:lead_flow/data/models/image_view_params.dart';
import 'package:lead_flow/data/models/input_view_params.dart';
import 'package:lead_flow/data/models/payment_params.dart';
import 'package:lead_flow/data/models/selection_params.dart';
import 'package:lead_flow/data/models/subscription_params.dart';
import 'package:lead_flow/data/models/success_view_params.dart';
import 'package:lead_flow/data/models/text_view_params.dart';
import 'package:lead_flow/utils/extensions.dart';

part 'component_dto.g.dart';

@JsonSerializable()
class ComponentDTO {
  @JsonKey(name: "type")
  final String type;
  @JsonKey(name: "params")
  final ParamsDTO params;
  @JsonKey(name: "imageLink")
  final String? imageLink;
  @JsonKey(name: "textViewOptions")
  final List<TextViewOptionDTO>? textViewOptions;
  @JsonKey(name: "subscriptionOptions")
  final List<SubscriptionDTO>? subscriptionOptions;

  ComponentDTO({
    required this.type,
    required this.params,
    this.imageLink,
    this.textViewOptions,
    this.subscriptionOptions,
  });

  ComponentDTO? fromParams(ComponentParams componentParam, [String? appName]) {
    switch (componentParam.runtimeType) {
      case == TextViewParam:
        var param = componentParam as TextViewParam;
        return ComponentDTO(
          type: 'textView',
          params: ParamsDTO(size: param.size, color: param.textColor.toHex()),
          textViewOptions: [TextViewOptionDTO(text: param.text)],
        );
      case == SelectionParams:
        var param = componentParam as SelectionParams;
        return ComponentDTO(
          type: param.singleSelect ? 'singleSelect' : 'multiSelect',
          params: ParamsDTO(secondaryColor: param.selectionColor.toHex(), size: param.size),
          textViewOptions: param.textOptions.map((e) => TextViewOptionDTO(text: e)).toList(),
        );
      case == ImageViewParams:
        var param = componentParam as ImageViewParams;
        return ComponentDTO(
          type: 'image',
          params: ParamsDTO(),
          imageLink: param.imageLink,
        );
      case == InputViewParams:
        var param = componentParam as InputViewParams;
        return ComponentDTO(
          type: 'input',
          params: ParamsDTO(
            color: param.textColor.toHex(),
            inputName: param.hint,
          ),
        );
      case == ButtonParams:
        var param = componentParam as ButtonParams;
        return ComponentDTO(
          type: 'nextButton',
          params: ParamsDTO(
            color: param.textColor.toHex(),
            secondaryColor: param.backgroundColor.toHex(),
          ),
        );
      case == SubscriptionParams:
        var param = componentParam as SubscriptionParams;
        return ComponentDTO(
          type: 'subscription',
          subscriptionOptions: param.buttonParams
              .map((e) => SubscriptionDTO(
                    title: e.title,
                    priceIdTest: '',
                    priceId: '',
                    oldPrice: e.oldPrice,
                    price: e.price,
                    unit: e.unit,
                    unitInterval: e.unitInterval,
                    attention: e.attention,
                  ))
              .toList(),
          params: ParamsDTO(),
        );
      case == PaymentParams:
        return ComponentDTO(type: 'payment', params: ParamsDTO());
      case == SuccessViewParams:
        var param = componentParam as SuccessViewParams;
        return ComponentDTO(
          type: 'success',
          params: ParamsDTO(
            appUrl: param.appUrl,
            buttonColor: param.buttonColor.toHex(),
          ),
        );
    }
    return null;
  }

  ComponentParams toParams(String appName) {
    switch (type) {
      case == 'textView':
        return TextViewParam(text: '${textViewOptions?[0].text}');
      case == 'singleSelect':
        return SelectionParams(
          selectionColor: (params.secondaryColor ?? 'FF5252').colorify(),
          size: params.size ?? 16,
          textOptions: textViewOptions?.map((e) => e.text.trim()).toList() ?? [],
        );
      case == 'multiSelect':
        return SelectionParams(
          selectionColor: (params.secondaryColor ?? 'FF5252').colorify(),
          size: params.size ?? 16,
          textOptions: textViewOptions?.map((e) => e.text.trim()).toList() ?? [],
          singleSelect: false,
        );
      case == 'image':
        return ImageViewParams(imageLink: imageLink!);
      case == 'input':
        return InputViewParams(
          hint: params.inputName?.trim() ?? '',
          textColor: params.color.colorify(),
          backgroundColor: Colors.white,
        );
      case == 'success':
        return SuccessViewParams(
          appName: appName,
          appUrl: params.appUrl?.trim() ?? '',
          buttonColor: params.buttonColor.colorify(),
        );
      case == 'nextButton':
        return ButtonParams(params.color.colorify(), params.secondaryColor.colorify());
      case == 'subscription':
        return SubscriptionParams(
          subscriptionOptions
                  ?.map((e) => e.toSubscriptionButtonParams(params.secondaryColor ?? '5252FF'))
                  .toList() ??
              [],
        );
      case == 'payment':
        return PaymentParams();
      default:
        return TextViewParam(text: 'None', size: 16);
    }
  }

  factory ComponentDTO.fromJson(Map<String, dynamic> json) => _$ComponentDTOFromJson(json);

  Map<String, dynamic> toJson() => _$ComponentDTOToJson(this);
}
