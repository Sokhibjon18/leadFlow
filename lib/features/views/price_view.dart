import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:lead_flow/data/models/subscription_params.dart';
import 'package:lead_flow/utils/extensions.dart';

class PriceView extends StatefulWidget {
  const PriceView({
    super.key,
    required this.params,
  });

  final List<SubscriptionButtonParams> params;

  @override
  State<PriceView> createState() => _PriceViewState();
}

class _PriceViewState extends State<PriceView> {
  int selectedIndex = 0;

  String getDollars(String amount) => amount.replaceAll('\$', '').split('.').first;

  String getCents(String amount) {
    final parts = amount.replaceAll('\$', '').split('.');
    return parts.length > 1 ? parts[1].padRight(2, '0') : '00';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        widget.params.length,
        (index) {
          var buttonParam = widget.params[index];
          return GestureDetector(
            onTap: () {
              selectedIndex = index;
              setState(() {});
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    margin: EdgeInsets.only(top: buttonParam.attention.isNotEmpty ? 12 : 0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: index == selectedIndex
                            ? widget.params[index].selectionColor.colorify()
                            : Colors.grey.shade300,
                        width: 2,
                      ),
                    ),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AutoSizeText(
                              buttonParam.title,
                              style: const TextStyle(fontWeight: FontWeight.w700),
                              maxFontSize: 24,
                              minFontSize: 8,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AutoSizeText(
                                  buttonParam.oldPrice,
                                  style: const TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  maxFontSize: 18,
                                  minFontSize: 6,
                                ),
                                const SizedBox(width: 8),
                                AutoSizeText(
                                  buttonParam.price,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  maxFontSize: 18,
                                  minFontSize: 6,
                                ),
                              ],
                            )
                          ],
                        ),
                        const Spacer(),
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                          decoration: BoxDecoration(
                              color: selectedIndex == index
                                  ? widget.params[index].selectionColor.colorify().withOpacity(0.75)
                                  : Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(12)),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const AutoSizeText(
                                '\$',
                                style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                ),
                                maxFontSize: 20,
                                minFontSize: 8,
                              ),
                              const SizedBox(width: 4),
                              AutoSizeText(
                                getDollars(buttonParam.unit),
                                style: const TextStyle(fontWeight: FontWeight.w700, height: 1),
                                maxFontSize: 48,
                                minFontSize: 16,
                              ),
                              const SizedBox(width: 4),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AutoSizeText(
                                    getCents(buttonParam.unit),
                                    style: const TextStyle(fontWeight: FontWeight.w900),
                                    maxFontSize: 18,
                                    minFontSize: 8,
                                  ),
                                  AutoSizeText(
                                    buttonParam.unitInterval,
                                    style: const TextStyle(height: 0.8),
                                    maxFontSize: 18,
                                    minFontSize: 8,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  buttonParam.attention.isNotEmpty
                      ? Positioned(
                          right: 0,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(16),
                                topLeft: Radius.circular(16),
                                bottomLeft: Radius.circular(16),
                              ),
                              color: widget.params[index].selectionColor.colorify(),
                            ),
                            child: Text(
                              buttonParam.attention,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        )
                      : const SizedBox()
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
