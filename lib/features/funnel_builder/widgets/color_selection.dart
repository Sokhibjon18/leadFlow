import 'package:flutter/material.dart';

class ColorSelection extends StatefulWidget {
  const ColorSelection({super.key, required this.colors, required this.onColorSelected});

  final List<Color> colors;
  final ValueChanged<Color> onColorSelected;

  @override
  State<ColorSelection> createState() => _ColorSelectionState();
}

class _ColorSelectionState extends State<ColorSelection> {
  Color? selectedColor;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: widget.colors.length,
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(width: 8);
        },
        itemBuilder: (BuildContext context, int index) {
          final color = widget.colors[index];
          final isSelected = selectedColor == color;
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedColor = color;
              });
              widget.onColorSelected(color);
            },
            child: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                color: widget.colors[index],
                shape: BoxShape.circle,
              ),
              child: isSelected
                  ? const Icon(Icons.done, color: Colors.amber)
                  : const SizedBox.shrink(),
            ),
          );
        },
      ),
    );
  }
}
