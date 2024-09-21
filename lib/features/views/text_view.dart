import 'package:flutter/material.dart';

class TextView extends StatefulWidget {
  const TextView({
    super.key,
    // required this.params,
  });

  // final TextViewParams params;

  @override
  State<TextView> createState() => _TextViewState();
}

class _TextViewState extends State<TextView> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // if (widget.params.onSelect != null) {
        //   widget.params.onSelect!(widget.params.text, widget.params.index);
        // }
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 20,
          // vertical: widget.params.verticalPadding,
          // horizontal: widget.params.horizontalPadding,
        ),
        decoration: BoxDecoration(
          color: Colors.yellow,
          // color: widget.params.isSelected
          //     ? widget.params.selectionColor?.withOpacity(0.1)
          //     : widget.params.backgroundColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: Colors.grey,
            // color: (widget.params.isSelected ? widget.params.selectionColor : null) ??
            //     widget.params.backgroundColor,
            width: 1,
          ),
        ),
        child: Text(
          'param text',
          // widget.params.text,
          // textAlign: widget.params.textAlign,
          style: TextStyle(fontFamilyFallback: const [
            'Apple Color Emoji',
            'Noto Color Emoji',
          ], color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          // color: widget.params.textColor,
          //   fontSize: widget.params.size,
          //   fontWeight: widget.params.isBold ? FontWeight.bold : FontWeight.normal),
        ),
      ),
    );
  }
}
