import 'package:flutter/material.dart';
import 'package:lead_flow/data/models/input_view_params.dart';

class InputView extends StatelessWidget {
  final InputViewParams inputViewParams;
  final ValueChanged<String>? onChanged;

  const InputView({
    super.key,
    required this.inputViewParams,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final hslColor = HSLColor.fromColor(inputViewParams.textColor);
    final hintColor = hslColor.withLightness((hslColor.lightness * 0.7).clamp(0.0, 1.0));

    return Container(
      decoration: BoxDecoration(
        color: inputViewParams.backgroundColor,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: TextField(
        onChanged: onChanged,
        keyboardType: TextInputType.emailAddress,
        cursorColor: hintColor.toColor(),
        decoration: InputDecoration(
          hintText: inputViewParams.hint,
          hintStyle: TextStyle(color: hintColor.toColor()),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        ),
        style: TextStyle(
          fontSize: 16,
          color: inputViewParams.textColor,
        ),
      ),
    );
  }
}
