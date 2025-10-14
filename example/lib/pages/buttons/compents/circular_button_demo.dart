

import 'package:custom_ui/custom_button.dart';
import 'package:flutter/material.dart';

import '../../../widgets/widget_compents.dart';


class CircularButtonDemo extends StatelessWidget {
  final void Function(String) onShowCode;
  const CircularButtonDemo({super.key, required this.onShowCode});

  @override
  Widget build(BuildContext context) {
    return DemoStack(
      snippet: """
CustomButton(
  text: "Circular",
  type: ButtonType.circular,
  color: Colors.purple,
  onPressed: () {},
)
""",
      onShowCode: onShowCode,
      child: CustomButton(
        text: "Circular",
        type: ButtonType.circular,
        color: Colors.purple,
        onPressed: () {},
      ),
    );
  }
}