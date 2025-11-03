
import 'package:flutter/material.dart';

enum MaskType {
  auto,      // auto-detect (email/phone/date/other)
  phone,
  email,
  username,
  date,
}

class CustomMaskedText extends StatelessWidget {
  final String text;
  final int startPosition;
  final int? endLength;
  final MaskType maskType;
  final TextStyle? style;

  const CustomMaskedText({
    super.key,
    required this.text,
    required this.startPosition,
    this.endLength,
    this.maskType = MaskType.auto,
    this.style,
  }) : assert(startPosition >= 0, 'Start position must be >= 0');

  @override
  Widget build(BuildContext context) {
    if (text.isEmpty) return const Text('');

    final masked = _mask(text);

    return Text(masked, style: style);
  }

  /// Detect type and route masking logic
  String _mask(String value) {
    switch (maskType) {
      case MaskType.phone:
        return _maskPhone(value);
      case MaskType.email:
        return _maskEmail(value);
      case MaskType.username:
        return _maskGeneric(value);
      case MaskType.date:
        return _maskDate(value);
      case MaskType.auto:
      default:
        if (value.contains('@')) return _maskEmail(value);
        if (_isPhone(value)) return _maskPhone(value);
        if (_isDate(value)) return _maskDate(value);
        return _maskGeneric(value);
    }
  }

  /// Detect phone numbers
  bool _isPhone(String value) =>
      RegExp(r'^[+\d\s()-]{6,}$').hasMatch(value);

  /// Detect date format
  bool _isDate(String value) =>
      RegExp(r'^\d{4}-\d{2}-\d{2}').hasMatch(value) ||
          RegExp(r'^\d{2}/\d{2}/\d{4}').hasMatch(value);

  /// Generic masking logic for usernames or unknown strings
  String _maskGeneric(String value) {
    if (startPosition >= value.length) return value;
    final visibleStart = value.substring(0, startPosition);

    String visibleEnd = '';
    if (endLength != null && endLength! > 0 && endLength! < value.length - startPosition) {
      visibleEnd = value.substring(value.length - endLength!);
    }

    final maskedCount = value.length - visibleStart.length - visibleEnd.length;
    final maskedSection = '*' * maskedCount;

    return '$visibleStart$maskedSection$visibleEnd';
  }

  /// Masking for phone numbers
  String _maskPhone(String number) {
    final clean = number.replaceAll(RegExp(r'\D'), '');
    return _maskGeneric(clean);
  }

  /// Masking for emails
  String _maskEmail(String email) {
    final parts = email.split('@');
    if (parts.length != 2) return email;

    final username = parts[0];
    final domain = parts[1];

    if (username.length <= startPosition) return email;

    final visibleStart = username.substring(0, startPosition);
    String visibleEnd = '';
    if (endLength != null && endLength! > 0 && endLength! < username.length - startPosition) {
      visibleEnd = username.substring(username.length - endLength!);
    }

    final maskedCount = username.length - visibleStart.length - visibleEnd.length;
    final maskedSection = '*' * maskedCount;

    return '$visibleStart$maskedSection$visibleEnd@$domain';
  }

  /// Masking for date strings (e.g. 2025-11-02 → 2025-**-**)
  String _maskDate(String date) {
    final clean = date.trim();
    if (clean.contains('-')) {
      final parts = clean.split('-');
      if (parts.length == 3) {
        return '${parts[0]}-**-**';
      }
    } else if (clean.contains('/')) {
      final parts = clean.split('/');
      if (parts.length == 3) {
        return '**/**/${parts[2]}';
      }
    }
    return _maskGeneric(clean);
  }
}
/*
--------------------EXAMPLE-----------------------------------

CommonMaskedText(
  text: "9345123490",
  startPosition: 3,
  endLength: 2,
) o/p : 934*****90

CommonMaskedText(
  text: "rajadurai.dev@gmail.com",
  startPosition: 2,
  endLength: 2,
) o/p : ra*******ai@gmail.com

CommonMaskedText(
  text: "Rajadurai",
  startPosition: 3,
  endLength: 1,
  maskType: MaskType.username,
) o/p : Raj****i

CommonMaskedText(
  text: "2025-11-02",
  startPosition: 0,
  maskType: MaskType.date,
) o/p : 2025-**-**



*/