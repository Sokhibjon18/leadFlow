import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CommonTextField extends StatefulWidget {
  const CommonTextField({
    super.key,
    this.hint,
    this.controller,
    this.obscureText = false,
    this.prefixIcon,
    this.errorText,
    this.onChanged,
    this.inputType,
    this.inputFormatter,
    this.enabled,
    this.suffixText,
    this.allocateErrorSpace = false,
    this.next = false,
    this.suffixIcon,
    this.onTap,
    this.autoFocus = false,
    this.backgroundColor,
    this.maxLines,
    this.maxLength,
    this.initialValue,
    this.focusNode,
  });

  final String? hint;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? suffixText;
  final TextEditingController? controller;
  final bool obscureText;
  final bool? enabled;
  final String? errorText;
  final ValueChanged<String>? onChanged;
  final TextInputType? inputType;
  final List<TextInputFormatter>? inputFormatter;
  final bool allocateErrorSpace;
  final bool next;
  final GestureTapCallback? onTap;
  final bool autoFocus;
  final Color? backgroundColor;
  final int? maxLines;
  final int? maxLength;
  final String? initialValue;
  final FocusNode? focusNode;

  @override
  State<CommonTextField> createState() => _CommonTextFieldState();
}

class _CommonTextFieldState extends State<CommonTextField> {
  bool passwordVisible = false;

  @override
  void initState() {
    passwordVisible = widget.obscureText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          maxLength: widget.maxLength,
          maxLines: widget.maxLines,
          enabled: widget.enabled,
          controller: widget.controller,
          autofocus: widget.autoFocus,
          onTap: widget.onTap,
          onChanged: widget.onChanged,
          keyboardType: widget.inputType,
          focusNode: widget.focusNode,
          inputFormatters: widget.inputFormatter,
          cursorColor: const Color(0xFF099EE2),
          textInputAction: widget.next ? TextInputAction.next : TextInputAction.done,
          onFieldSubmitted: (_) =>
              widget.next ? FocusScope.of(context).nextFocus() : FocusScope.of(context).unfocus(),
          initialValue: widget.initialValue,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(12),
            suffixText: widget.suffixText,
            errorText: widget.errorText,
            prefixIcon: widget.prefixIcon,
            hintText: widget.hint,
            hintStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Color(0xFF65676B),
            ),
            border: OutlineInputBorder(
              borderSide: const BorderSide(width: 1),
              borderRadius: BorderRadius.circular(12),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                width: 1,
                color: Color(0XFFE7E7E9),
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                width: 1,
                color: Color(0XFFE7E7E9),
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            filled: true,
            fillColor: widget.backgroundColor ?? const Color(0XFFE7E7E9),
            suffixIcon: widget.suffixIcon,
          ),
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Color(0xFF000000),
          ),
          obscureText: passwordVisible,
        ),
        SizedBox(
          height: widget.errorText == null && widget.allocateErrorSpace ? 22 : 0,
        ),
      ],
    );
  }
}
