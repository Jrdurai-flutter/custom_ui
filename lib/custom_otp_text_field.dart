import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum OtpFieldStyle {
  outlined,
  filled,
  borderless,
  underlined,
  box,
}

class CustomOtpInputField extends StatefulWidget {
  final int length;
  final OtpFieldStyle style;
  final ValueChanged<String>? onCompleted;
  final double fieldSize;
  final double borderRadius;
  final Color? fillColor;
  final TextStyle? textStyle;

  const CustomOtpInputField({
    super.key,
    this.length = 4,
    this.style = OtpFieldStyle.outlined,
    this.onCompleted,
    this.fieldSize = 48,
    this.borderRadius = 8,
    this.fillColor,
    this.textStyle,
  });

  @override
  State<CustomOtpInputField> createState() => _CustomOtpInputFieldState();
}

class _CustomOtpInputFieldState extends State<CustomOtpInputField> {
  late final List<TextEditingController> _controllers;
  late final List<FocusNode> _focusNodes;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(widget.length, (_) => TextEditingController());
    _focusNodes = List.generate(widget.length, (_) => FocusNode());
  }

  @override
  void dispose() {
    for (final c in _controllers) {
      c.dispose();
    }
    for (final f in _focusNodes) {
      f.dispose();
    }
    super.dispose();
  }

  void _onChanged(String value, int index) {
    // Move forward
    if (value.isNotEmpty && index < widget.length - 1) {
      _focusNodes[index + 1].requestFocus();
    }

    // Move backward
    if (value.isEmpty && index > 0) {
      _focusNodes[index - 1].requestFocus();
    }

    // Combine OTP digits
    final otp = _controllers.map((c) => c.text).join();

    if (otp.length == widget.length && !otp.contains('')) {
      FocusScope.of(context).unfocus();
      widget.onCompleted?.call(otp);
    }
  }

  InputDecoration _buildDecoration(BuildContext context, bool isFocused) {
    final theme = Theme.of(context);
    final primary = theme.colorScheme.primary;
    final borderColor = isFocused ? primary : Colors.grey.shade400;

    final outlined = OutlineInputBorder(
      borderRadius: BorderRadius.circular(widget.borderRadius),
      borderSide: BorderSide(color: borderColor, width: isFocused ? 2 : 1),
    );

    final underline = UnderlineInputBorder(
      borderSide: BorderSide(color: borderColor, width: isFocused ? 2 : 1),
    );

    Color fillColor = widget.fillColor ??
        (widget.style == OtpFieldStyle.filled
            ? theme.colorScheme.surfaceVariant
            : Colors.transparent);

    switch (widget.style) {
      case OtpFieldStyle.outlined:
        return InputDecoration(
          counterText: '',
          contentPadding: const EdgeInsets.symmetric(vertical: 14),
          filled: false,
          enabledBorder: outlined,
          focusedBorder: outlined,
        );

      case OtpFieldStyle.filled:
        return InputDecoration(
          counterText: '',
          filled: true,
          fillColor: fillColor,
          enabledBorder:
          outlined.copyWith(borderSide: BorderSide.none), // soft filled
          focusedBorder: outlined.copyWith(
              borderSide: BorderSide(color: primary, width: 2)),
          contentPadding: const EdgeInsets.symmetric(vertical: 14),
        );

      case OtpFieldStyle.underlined:
        return InputDecoration(
          counterText: '',
          enabledBorder: underline,
          focusedBorder: underline.copyWith(
              borderSide: BorderSide(color: primary, width: 2)),
          contentPadding: const EdgeInsets.symmetric(vertical: 14),
        );

      case OtpFieldStyle.box:
        return InputDecoration(
          counterText: '',
          filled: true,
          fillColor: fillColor,
          enabledBorder: outlined.copyWith(
              borderSide: BorderSide(color: borderColor, width: 1.5)),
          focusedBorder: outlined.copyWith(
              borderSide: BorderSide(color: primary, width: 2)),
          contentPadding: const EdgeInsets.symmetric(vertical: 14),
        );

      case OtpFieldStyle.borderless:
      default:
        return const InputDecoration(
          counterText: '',
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 14),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(widget.length, (index) {
        final node = _focusNodes[index];

        return SizedBox(
          width: widget.fieldSize,
          child: Focus(
            focusNode: node,
            child: Builder(
              builder: (context) {
                final isFocused = Focus.of(context).hasFocus;
                return TextField(
                  controller: _controllers[index],
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  maxLength: 1,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  style: widget.textStyle ??
                      theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                  decoration: _buildDecoration(context, isFocused),
                  onChanged: (value) => _onChanged(value, index),
                );
              },
            ),
          ),
        );
      }),
    );
  }
}
