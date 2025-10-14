
import 'package:custom_ui/custom_button.dart';
import 'package:example/widgets/demo_stack.dart';
import 'package:flutter/material.dart';



class DangerButtonDemo extends StatelessWidget {
  final void Function(String) onShowCode;
  const DangerButtonDemo({super.key, required this.onShowCode});

  @override
  Widget build(BuildContext context) {
    return DemoStack(
      snippet: """
CustomButton(
  text: "Danger",
  type: ButtonType.elevated,
  color: Colors.red,
  radius: 8,
  onPressed: () {},
)
""",
      onShowCode: onShowCode,
      child: CustomButton(
        text: "Danger",
        type: ButtonType.elevated,
        color: Colors.red,
        radius: 8,
        onPressed: () {},
      ),
    );
  }
}