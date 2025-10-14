import 'package:custom_ui/custom_button.dart';
import 'package:example/widgets/demo_stack.dart';
import 'package:flutter/material.dart';

class GradientSuffixButtonDemo extends StatelessWidget {
  final void Function(String) onShowCode;
  const GradientSuffixButtonDemo({super.key, required this.onShowCode});

  @override
  Widget build(BuildContext context) {
    return DemoStack(
      label: 'Gradient Suffix',
      snippet: """
CustomButton(
  text: 'Gradient',
  type: ButtonType.gradient,
  gradient: LinearGradient(colors: [Colors.indigo, Colors.cyan]),
  icon: Icon(Icons.arrow_forward, color: Colors.white),
  iconPosition: IconPosition.suffix,
  onPressed: () {},
)
""",onShowCode: onShowCode,
      child: CustomButton(
        text: 'Gradient',
        type: ButtonType.gradient,
        gradient: const LinearGradient(colors: [Colors.indigo, Colors.cyan]),
        icon: const Icon(Icons.arrow_forward, color: Colors.white),
        iconPosition: IconPosition.suffix,
        onPressed: () {},
      ),
    );
  }
}