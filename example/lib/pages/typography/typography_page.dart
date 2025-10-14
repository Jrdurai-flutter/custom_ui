import 'package:flutter/material.dart';
// ignore_for_file: unused_import
import 'package:custom_ui/custom_ui.dart';

import '../../widgets/widget_compents.dart';
import 'components/typography_components.dart';

class TypographyShowcasePage extends StatelessWidget {
  final void Function(String) onShowCode;
  const TypographyShowcasePage({super.key, required this.onShowCode});

  @override
  Widget build(BuildContext context) {
    return DemoSection(children: [
      TypographyScaleDemo(onShowCode: onShowCode),
      TypographyWeightsDemo(onShowCode: onShowCode),
      TypographyColorsDemo(onShowCode: onShowCode),
      TypographyOverflowDemo(onShowCode: onShowCode),
    ]);
  }
}


