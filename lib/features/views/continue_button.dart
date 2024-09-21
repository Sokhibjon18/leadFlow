import 'package:flutter/material.dart';

class ContinueButton extends StatelessWidget {
  const ContinueButton({
    super.key,
    // required this.buttonParams,
    required this.onPressed,
  });

  // final ButtonParams buttonParams;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.blue,
          // color: buttonParams.backgroundColor,
        ),
        child: Text(
          'Continue',
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            // color: buttonParams.textColor,
          ),
        ),
      ),
    );
  }
}
