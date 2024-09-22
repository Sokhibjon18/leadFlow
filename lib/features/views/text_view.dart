import 'package:flutter/material.dart';
import 'package:lead_flow/data/models/text_view_params.dart';

class TextView extends StatefulWidget {
  const TextView({
    super.key,
    required this.params,
  });

  final TextViewParam params;

  @override
  State<TextView> createState() => _TextViewState();
}

class _TextViewState extends State<TextView> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey, width: 1),
        ),
        child: Text(
          widget.params.text,
          textAlign: widget.params.textAlign,
          style: TextStyle(
            fontFamilyFallback: const [
              'Apple Color Emoji',
              'Noto Color Emoji',
            ],
            color: widget.params.textColor,
            fontSize: widget.params.size,
            fontWeight: widget.params.isBold ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
