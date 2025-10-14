import 'package:flutter/material.dart';

import 'custom_font_size.dart';

/// CustomFontStyle provides responsive font sizes
/// and text styles (normal, bold, italic) for Mobile, Tablet, Desktop.
class CustomFontStyle {
  final BuildContext context;

  CustomFontStyle(this.context);

  double get _width => MediaQuery.of(context).size.width;




  // ---------------- Text Styles ----------------
  TextStyle normal({Color color = Colors.black, double? size}) =>
      TextStyle(fontSize: size ?? CustomFontSize(context).medium, fontWeight: FontWeight.normal, color: color);

  TextStyle bold({Color color = Colors.black, double? size}) =>
      TextStyle(fontSize: size ?? CustomFontSize(context).medium, fontWeight: FontWeight.bold, color: color);

  TextStyle italic({Color color = Colors.black, double? size}) =>
      TextStyle(fontSize: size ?? CustomFontSize(context).medium, fontStyle: FontStyle.italic, color: color);

  TextStyle boldItalic({Color color = Colors.black, double? size}) =>
      TextStyle(
          fontSize: size ?? CustomFontSize(context).medium,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
          color: color);
}
