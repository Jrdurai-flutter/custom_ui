import 'package:flutter/material.dart';

enum TextFieldStyle {
  outlined,
  filled,
  borderless,
}

class CustomTextField extends StatelessWidget {
  final String? label;
  final String? hint;
  final Color? hintTextColor;
  final TextEditingController? controller;
  final TextFieldStyle style;
  final bool obscureText;
  final bool readonly;
  final Color? fillColor;
  final double borderRadius;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextInputType keyboardType;
  final int? maxLines;
  final String? helperText;
  final String? errorText;
  final ValueChanged<String>? onChanged;
  final String? Function(String?)? validator;
  final AutovalidateMode autovalidateMode;
  final int? maxLength; // ✅ added maxLength

  const CustomTextField({
    super.key,
    this.label,
    this.hint,
    this.hintTextColor,
    this.controller,
    this.style = TextFieldStyle.outlined,
    this.obscureText = false,
    this.readonly = false,
    this.fillColor,
    this.borderRadius = 12,
    this.prefixIcon,
    this.suffixIcon,
    this.keyboardType = TextInputType.text,
    this.maxLines = 1,
    this.helperText,
    this.errorText,
    this.onChanged,
    this.validator,
    this.autovalidateMode = AutovalidateMode.disabled,
    this.maxLength, // ✅ initialize maxLength
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primary = theme.colorScheme.primary;

    final OutlineInputBorder outlined = OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius),
      borderSide: BorderSide(color: primary.withOpacity(0.6)),
    );

    final OutlineInputBorder focused = OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius),
      borderSide: BorderSide(color: primary, width: 2),
    );

    final InputDecoration decoration = InputDecoration(
      labelText: label,
      hintText: hint,
      hintStyle: TextStyle(color: hintTextColor ?? theme.hintColor.withOpacity(0.6), ),
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      helperText: helperText,
      errorText: errorText,
      filled: style == TextFieldStyle.filled,
      fillColor: style == TextFieldStyle.filled
          ? (fillColor ?? theme.colorScheme.surfaceVariant)
          : null,
      enabledBorder: style == TextFieldStyle.outlined
          ? outlined
          : style == TextFieldStyle.filled
          ? outlined.copyWith(borderSide: BorderSide.none)
          : InputBorder.none,
      focusedBorder: style == TextFieldStyle.outlined
          ? focused
          : style == TextFieldStyle.filled
          ? focused.copyWith(borderSide: BorderSide(color: primary, width: 2))
          : InputBorder.none,
      border: style == TextFieldStyle.outlined ? outlined : InputBorder.none,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      counterText: '', // hide default counter if you want
    );

    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      maxLines: obscureText ? 1 : maxLines,
      onChanged: onChanged,
      decoration: decoration,
      readOnly: readonly,
      validator: validator,
      autovalidateMode: autovalidateMode,
      maxLength: maxLength, // ✅ apply maxLength
    );
  }
}
