import 'package:flutter/material.dart';
import 'custom_font_size.dart';

enum TypographyVariant {
  displayLarge,
  displayMedium,
  displaySmall,
  headlineLarge,
  headlineMedium,
  headlineSmall,
  titleLarge,
  titleMedium,
  titleSmall,
  bodyLarge,
  bodyMedium,
  bodySmall,
  labelLarge,
  labelMedium,
  labelSmall,
}

class CustomTypography {
  final BuildContext context;
  const CustomTypography(this.context);

  TextTheme get _theme => Theme.of(context).textTheme;
  CustomFontSize get _sizes => CustomFontSize(context);

  TextStyle _baseStyle(TypographyVariant variant) {
    switch (variant) {
      case TypographyVariant.displayLarge:
        return (_theme.displayLarge ?? const TextStyle()).copyWith(fontSize: _sizes.displayLarge);
      case TypographyVariant.displayMedium:
        return (_theme.displayMedium ?? const TextStyle()).copyWith(fontSize: _sizes.displayMedium);
      case TypographyVariant.displaySmall:
        return (_theme.displaySmall ?? const TextStyle()).copyWith(fontSize: _sizes.displaySmall);
      case TypographyVariant.headlineLarge:
        return (_theme.headlineLarge ?? const TextStyle()).copyWith(fontSize: _sizes.headlineLarge);
      case TypographyVariant.headlineMedium:
        return (_theme.headlineMedium ?? const TextStyle()).copyWith(fontSize: _sizes.headlineMedium);
      case TypographyVariant.headlineSmall:
        return (_theme.headlineSmall ?? const TextStyle()).copyWith(fontSize: _sizes.headlineSmall);
      case TypographyVariant.titleLarge:
        return (_theme.titleLarge ?? const TextStyle(fontWeight: FontWeight.w600))
            .copyWith(fontSize: _sizes.titleLarge);
      case TypographyVariant.titleMedium:
        return (_theme.titleMedium ?? const TextStyle(fontWeight: FontWeight.w600))
            .copyWith(fontSize: _sizes.titleMedium);
      case TypographyVariant.titleSmall:
        return (_theme.titleSmall ?? const TextStyle(fontWeight: FontWeight.w600))
            .copyWith(fontSize: _sizes.titleSmall);
      case TypographyVariant.bodyLarge:
        return (_theme.bodyLarge ?? const TextStyle()).copyWith(fontSize: _sizes.bodyLarge);
      case TypographyVariant.bodyMedium:
        return (_theme.bodyMedium ?? const TextStyle()).copyWith(fontSize: _sizes.bodyMedium);
      case TypographyVariant.bodySmall:
        return (_theme.bodySmall ?? const TextStyle()).copyWith(fontSize: _sizes.bodySmall);
      case TypographyVariant.labelLarge:
        return (_theme.labelLarge ?? const TextStyle(fontWeight: FontWeight.w600))
            .copyWith(fontSize: _sizes.labelLarge);
      case TypographyVariant.labelMedium:
        return (_theme.labelMedium ?? const TextStyle(fontWeight: FontWeight.w600))
            .copyWith(fontSize: _sizes.labelMedium);
      case TypographyVariant.labelSmall:
        return (_theme.labelSmall ?? const TextStyle(fontWeight: FontWeight.w600))
            .copyWith(fontSize: _sizes.labelSmall);
    }
  }

  TextStyle textStyle(
    TypographyVariant variant, {
    Color? color,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    double? fontSize,
    double? height,
    TextDecoration? decoration,
    double? letterSpacing,
  }) {
    final base = _baseStyle(variant);
    return base.copyWith(
      color: color ?? base.color,
      fontWeight: fontWeight ?? base.fontWeight,
      fontStyle: fontStyle ?? base.fontStyle,
      fontSize: fontSize ?? base.fontSize,
      height: height ?? base.height,
      decoration: decoration ?? base.decoration,
      letterSpacing: letterSpacing ?? base.letterSpacing,
    );
  }

  // Convenience getters
  TextStyle get displayLarge => textStyle(TypographyVariant.displayLarge);
  TextStyle get displayMedium => textStyle(TypographyVariant.displayMedium);
  TextStyle get displaySmall => textStyle(TypographyVariant.displaySmall);
  TextStyle get headlineLarge => textStyle(TypographyVariant.headlineLarge);
  TextStyle get headlineMedium => textStyle(TypographyVariant.headlineMedium);
  TextStyle get headlineSmall => textStyle(TypographyVariant.headlineSmall);
  TextStyle get titleLarge => textStyle(TypographyVariant.titleLarge);
  TextStyle get titleMedium => textStyle(TypographyVariant.titleMedium);
  TextStyle get titleSmall => textStyle(TypographyVariant.titleSmall);
  TextStyle get bodyLarge => textStyle(TypographyVariant.bodyLarge);
  TextStyle get bodyMedium => textStyle(TypographyVariant.bodyMedium);
  TextStyle get bodySmall => textStyle(TypographyVariant.bodySmall);
  TextStyle get labelLarge => textStyle(TypographyVariant.labelLarge);
  TextStyle get labelMedium => textStyle(TypographyVariant.labelMedium);
  TextStyle get labelSmall => textStyle(TypographyVariant.labelSmall);
}

class CUText extends StatelessWidget {
  final String text;
  final TypographyVariant variant;
  final Color? color;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final double? fontSize;
  final double? height;
  final TextDecoration? decoration;
  final double? letterSpacing;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;

  const CUText(
    this.text, {
    super.key,
    required this.variant,
    this.color,
    this.fontWeight,
    this.fontStyle,
    this.fontSize,
    this.height,
    this.decoration,
    this.letterSpacing,
    this.textAlign,
    this.maxLines,
    this.overflow,
  });

  @override
  Widget build(BuildContext context) {
    final style = CustomTypography(context).textStyle(
      variant,
      color: color,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
      fontSize: fontSize,
      height: height,
      decoration: decoration,
      letterSpacing: letterSpacing,
    );
    return Text(
      text,
      style: style,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}


