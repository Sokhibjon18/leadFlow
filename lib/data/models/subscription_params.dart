import 'package:lead_flow/data/models/component_params.dart';

class SubscriptionParams implements ComponentParams {
  final List<SubscriptionButtonParams> buttonParams;

  SubscriptionParams(this.buttonParams);

  @override
  String toString() {
    return 'SubscriptionParams(buttonParams: $buttonParams)';
  }
}

class SubscriptionButtonParams {
  final String title;
  final String priceId;
  final String oldPrice;
  final String price;
  final String unit;
  final String unitInterval;
  final String attention;
  final bool selected;
  final String selectionColor;

  SubscriptionButtonParams(
    this.title,
    this.priceId,
    this.oldPrice,
    this.price,
    this.unit,
    this.unitInterval,
    this.attention,
    this.selected,
    this.selectionColor,
  );

  @override
  String toString() {
    return 'SubscriptionButtonParams(title: $title, priceId: $priceId, oldPrice: $oldPrice, price: $price, unit: $unit, unitInterval: $unitInterval, attention: $attention, selected: $selected, selectionColor: $selectionColor)';
  }
}
