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
    this.fieldSize = 60,
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
    for (final c in _controllers) c.dispose();
    for (final f in _focusNodes) f.dispose();
    super.dispose();
  }

  // 🚀 Smooth OTP typing logic
  void _onChanged(String value, int index) {
    if (value.isNotEmpty) {
      // If last field → close keyboard
      if (index == widget.length - 1) {
        FocusScope.of(context).unfocus();
      } else {
        FocusScope.of(context).nextFocus();
      }
    }

    // If delete → go previous
    if (value.isEmpty && index > 0) {
      FocusScope.of(context).previousFocus();
    }

    // 🔥 Paste full OTP support
    if (value.length > 1) {
      final pasted = value.split('');
      for (int i = 0; i < pasted.length && i < widget.length; i++) {
        _controllers[i].text = pasted[i];
      }

      if (pasted.length == widget.length) {
        FocusScope.of(context).unfocus();
        widget.onCompleted?.call(pasted.join());
      }
      return;
    }

    // Combine OTP
    final otp = _controllers.map((c) => c.text).join();
    if (otp.length == widget.length) {
      widget.onCompleted?.call(otp);
    }
  }

  // 🎨 Border Themes
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
          enabledBorder: outlined,
          focusedBorder: outlined,
        );

      case OtpFieldStyle.filled:
        return InputDecoration(
          counterText: '',
          filled: true,
          fillColor: fillColor,
          enabledBorder: outlined.copyWith(borderSide: BorderSide.none),
          focusedBorder:
          outlined.copyWith(borderSide: BorderSide(color: primary, width: 2)),
          contentPadding: const EdgeInsets.symmetric(vertical: 14),
        );

      case OtpFieldStyle.underlined:
        return InputDecoration(
          counterText: '',
          enabledBorder: underline,
          focusedBorder:
          underline.copyWith(borderSide: BorderSide(color: primary, width: 2)),
          contentPadding: const EdgeInsets.symmetric(vertical: 14),
        );

      case OtpFieldStyle.box:
        return InputDecoration(
          counterText: '',
          filled: true,
          fillColor: fillColor,
          enabledBorder:
          outlined.copyWith(borderSide: BorderSide(color: borderColor, width: 1.5)),
          focusedBorder:
          outlined.copyWith(borderSide: BorderSide(color: primary, width: 2)),
          contentPadding: const EdgeInsets.symmetric(vertical: 14),
        );

      case OtpFieldStyle.borderless:
      default:
        return const InputDecoration(
          counterText: '',
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 14),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      //  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(widget.length, (index) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 2,horizontal: 4),
          alignment: Alignment.center,
          width: widget.fieldSize,
          child: TextField(
            controller: _controllers[index],
            focusNode: _focusNodes[index],
            autofocus: index == 0,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            maxLength: 1,
            showCursor: true,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            style: widget.textStyle ??
                theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
            decoration: _buildDecoration(
                context, _focusNodes[index].hasFocus),
            onChanged: (value) => _onChanged(value, index),

            // Prevent keyboard closing & smooth tap
            onTap: () {
              if (_controllers[index].text.isNotEmpty) {
                _controllers[index].clear();
              }
            },
          ),
        );
      }),
    );
  }
}
