
import 'package:custom_ui/custom_button.dart';
import 'package:example/widgets/demo_stack.dart';
import 'package:flutter/material.dart';


class WarningButtonDemo extends StatelessWidget {
  final void Function(String) onShowCode;
  const WarningButtonDemo({super.key, required this.onShowCode});

  @override
  Widget build(BuildContext context) {
    return DemoStack(
      snippet: """
CustomButton(
  text: "Warning",
  type: ButtonType.outlined,
  color: Colors.amber,
  radius: 8,
  onPressed: () {},
)
""",
      onShowCode: onShowCode,
      child: CustomButton(
        text: "Warning",
        type: ButtonType.outlined,
        color: Colors.amber,
        radius: 8,
        onPressed: () {},
      ),
    );
  }
}