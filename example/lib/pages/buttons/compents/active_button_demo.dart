
import 'package:custom_ui/custom_button.dart';
import 'package:example/widgets/demo_stack.dart';
import 'package:flutter/material.dart';

class ActiveButtonDemo extends StatelessWidget {
  final void Function(String) onShowCode;
  const ActiveButtonDemo({super.key, required this.onShowCode});

  @override
  Widget build(BuildContext context) {
    return DemoStack(
      snippet: """
CustomButton(
  text: "Active",
  type: ButtonType.elevated,
  color: Colors.blue,
  radius: 0,
  onPressed: () {},
)
""",
      onShowCode: onShowCode,
      child: CustomButton(
        text: "Active",
        type: ButtonType.elevated,
        color: Colors.blue,
        radius: 0,
        onPressed: () {},
      ),
    );
  }
}