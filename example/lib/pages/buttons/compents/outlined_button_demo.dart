
import 'package:custom_ui/custom_button.dart';
import 'package:example/widgets/demo_stack.dart';
import 'package:flutter/material.dart';


class OutlinedButtonDemo extends StatelessWidget {
  final void Function(String) onShowCode;
  const OutlinedButtonDemo({super.key, required this.onShowCode});

  @override
  Widget build(BuildContext context) {
    return DemoStack(
      snippet: """
CustomButton(
  text: "Outlined",
  type: ButtonType.outlined,
  color: Colors.blue,
  radius: 0,
  onPressed: () {},
)
""",
      onShowCode: onShowCode,
      child: CustomButton(
        text: "Outlined",
        type: ButtonType.outlined,
        color: Colors.blue,
        radius: 0,
        onPressed: () {},
      ),
    );
  }
}