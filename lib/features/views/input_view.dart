import 'package:flutter/material.dart';

class InputView extends StatelessWidget {
  // final InputViewParams inputViewParams;
  final ValueChanged<String>? onChanged;

  const InputView({
    super.key,
    // required this.inputViewParams,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final hslColor = HSLColor.fromColor(
      Colors.white,
      // inputViewParams.textColor,
    );
    final hintColor = hslColor.withLightness((hslColor.lightness * 0.7).clamp(0.0, 1.0));

    return Container(
      decoration: BoxDecoration(
        color: Colors.yellow,
        // color: inputViewParams.backgroundColor,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: TextField(
        onChanged: onChanged,
        keyboardType: TextInputType.emailAddress,
        cursorColor: hintColor.toColor(),
        decoration: InputDecoration(
          hintText: 'input here',
          // hintText: inputViewParams.inputName,
          hintStyle: TextStyle(color: hintColor.toColor()),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        ),
        style: TextStyle(
          fontSize: 16, color: Colors.white,
          // color: inputViewParams.textColor,
        ),
      ),
    );
  }
}
