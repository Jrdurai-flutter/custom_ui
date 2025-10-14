import 'package:custom_ui/custom_button.dart';
import 'package:example/widgets/demo_stack.dart';
import 'package:flutter/material.dart';


class GradientButtonDemo extends StatelessWidget {
  final void Function(String) onShowCode;
  const GradientButtonDemo({super.key, required this.onShowCode});

  @override
  Widget build(BuildContext context) {
    return DemoStack(
      snippet: """
CustomButton(
  text: "Gradient",
  type: ButtonType.gradient,
  gradient: LinearGradient(colors: [Colors.blue, Colors.purple]),
  radius: 8,
  onPressed: () {},
)
""",
      onShowCode: onShowCode,
      child: CustomButton(
        text: "Gradient",
        type: ButtonType.gradient,
        gradient: const LinearGradient(colors: [Colors.blue, Colors.purple]),
        radius: 8,
        onPressed: () {},
      ),
    );
  }
}