import 'package:flutter/material.dart';
import 'package:lead_flow/data/models/selection_item_param.dart';

class SelectionItemView extends StatefulWidget {
  const SelectionItemView({
    super.key,
    required this.params,
    required this.isCheckable,
  });

  final SelectionItemParam params;
  final bool isCheckable;

  @override
  State<SelectionItemView> createState() => _SelectionItemViewState();
}

class _SelectionItemViewState extends State<SelectionItemView> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.params.onSelect != null) {
          widget.params.onSelect!(widget.params.text, widget.params.index);
        }
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        width: double.infinity,
        decoration: BoxDecoration(
          color: widget.params.isSelected
              ? widget.params.selectionColor?.withOpacity(0.1)
              : widget.params.backgroundColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: (widget.params.isSelected ? widget.params.selectionColor : null) ??
                widget.params.backgroundColor,
            width: 1,
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: widget.params.imagePath != null
                    ? CrossAxisAlignment.center
                    : CrossAxisAlignment.start,
                children: [
                  if (widget.params.imagePath != null)
                    Expanded(
                      child: Image.asset(widget.params.imagePath!),
                    ),
                  SizedBox(height: widget.params.imagePath != null ? 8 : 0),
                  Row(
                    children: [
                      if (widget.params.icon != null) ...[
                        Text(
                          widget.params.icon!,
                          style: const TextStyle(
                            fontFamilyFallback: ['Apple Color Emoji', 'Noto Color Emoji'],
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(width: 12),
                      ],
                      Expanded(
                        child: Text(
                          widget.params.text,
                          textAlign: widget.params.textAlign,
                          style: TextStyle(
                            fontFamilyFallback: const ['Apple Color Emoji', 'Noto Color Emoji'],
                            color: widget.params.textColor,
                            fontSize: widget.params.size,
                            fontWeight: widget.params.isBold ? FontWeight.bold : FontWeight.normal,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            if (widget.params.imagePath == null && widget.isCheckable)
              Checkbox(
                value: widget.params.isSelected,
                activeColor: widget.params.selectionColor,
                onChanged: (_) {
                  if (widget.params.onSelect != null) {
                    widget.params.onSelect!(widget.params.text, widget.params.index);
                  }
                },
              )
          ],
        ),
      ),
    );
  }
}
