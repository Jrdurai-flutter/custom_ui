import 'package:flutter/material.dart';

/// A helper class to manage font sizes for different device types.
/// Supports: Mobile, Tablet/Laptop, and Desktop.
class CustomFontSize {
  final BuildContext context;

  CustomFontSize(this.context);

  double get _width => MediaQuery.of(context).size.width;

  /// Decide the device type based on screen width
  bool get isMobile => _width < 600;
  bool get isTablet => _width >= 600 && _width < 1024;
  bool get isDesktop => _width >= 1024;

  double get _scale {
    if (isMobile) return 0.9; // slightly smaller on phones
    if (isTablet) return 1.0; // baseline
    return 1.1; // slightly larger on desktop
  }

  /// Example categories of font sizes
  double get small {
    if (isMobile) return 12;
    if (isTablet) return 14;
    return 16; // desktop
  }



  double get medium {
    if (isMobile) return 14;
    if (isTablet) return 16;
    return 18; // desktop
  }

  double get large {
    if (isMobile) return 18;
    if (isTablet) return 20;
    return 22; // desktop
  }

  double get title {
    if (isMobile) return 22;
    if (isTablet) return 26;
    return 32; // desktop
  }

  double get headline {
    if (isMobile) return 26;
    if (isTablet) return 32;
    return 40; // desktop
  }

  // Material type scale (M2/M3 aligned) base sizes scaled responsively
  // Reference base sizes: display(57/45/36), headline(32/28/24), title(22/16/14), body(16/14/12), label(14/12/11)
  double get displayLarge => 57 * _scale;
  double get displayMedium => 45 * _scale;
  double get displaySmall => 36 * _scale;

  double get headlineLarge => 32 * _scale;
  double get headlineMedium => 28 * _scale;
  double get headlineSmall => 24 * _scale;

  double get titleLarge => 22 * _scale;
  double get titleMedium => 16 * _scale;
  double get titleSmall => 14 * _scale;

  double get bodyLarge => 16 * _scale;
  double get bodyMedium => 14 * _scale;
  double get bodySmall => 12 * _scale;

  double get labelLarge => 14 * _scale;
  double get labelMedium => 12 * _scale;
  double get labelSmall => 11 * _scale;
}
