import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class PriceView extends StatefulWidget {
  const PriceView({super.key});

  @override
  State<PriceView> createState() => _PriceViewState();
}

class _PriceViewState extends State<PriceView> {
  int selectedIndex = 0;

  String getDollars(String amount) =>
      amount.replaceAll('\$', '').split('.').first;

  String getCents(String amount) {
    final parts = amount.replaceAll('\$', '').split('.');
    return parts.length > 1 ? parts[1].padRight(2, '0') : '00';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(2, (index) => _buildPriceOption(index)),
    );
  }

  Widget _buildPriceOption(int index) {
    final isSelected = index == selectedIndex;
    return GestureDetector(
      onTap: () => setState(() => selectedIndex = index),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Stack(
          children: [
            _buildPriceContainer(isSelected, index),
            if (true) _buildAttentionBadge(),
          ],
        ),
      ),
    );
  }

  Widget _buildPriceContainer(bool isSelected, int index) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(top: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isSelected ? Colors.green : Colors.grey.shade300,
          width: 2,
        ),
      ),
      child: Row(
        children: [
          _buildPriceInfo(),
          const Spacer(),
          _buildPriceTag(isSelected),
        ],
      ),
    );
  }

  Widget _buildPriceInfo() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText(
          'title',
          style: TextStyle(fontWeight: FontWeight.w700),
          maxFontSize: 24,
          minFontSize: 8,
        ),
        Row(
          children: [
            AutoSizeText(
              'old price',
              style: TextStyle(
                decoration: TextDecoration.lineThrough,
                color: Colors.grey,
                fontWeight: FontWeight.w500,
              ),
              maxFontSize: 18,
              minFontSize: 6,
            ),
            SizedBox(width: 8),
            AutoSizeText(
              'price',
              style: TextStyle(
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
    );
  }

  Widget _buildPriceTag(bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: BoxDecoration(
        color: isSelected ? Colors.blueGrey : Colors.grey.shade300,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AutoSizeText(
            '\$',
            style: TextStyle(fontWeight: FontWeight.w900),
            maxFontSize: 20,
            minFontSize: 8,
          ),
          const SizedBox(width: 4),
          AutoSizeText(
            getDollars('200'),
            style: const TextStyle(fontWeight: FontWeight.w700, height: 1),
            maxFontSize: 48,
            minFontSize: 16,
          ),
          const SizedBox(width: 4),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AutoSizeText(
                getCents('24'),
                style: const TextStyle(fontWeight: FontWeight.w900),
                maxFontSize: 18,
                minFontSize: 8,
              ),
              const AutoSizeText(
                'unit interval',
                style: TextStyle(height: 0.8),
                maxFontSize: 18,
                minFontSize: 8,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAttentionBadge() {
    return Positioned(
      right: 0,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(16),
            topLeft: Radius.circular(16),
            bottomLeft: Radius.circular(16),
          ),
          color: Colors.yellow,
        ),
        child: const Text(
          'attention',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}
