
import 'package:custom_ui/custom_button.dart';
import 'package:example/widgets/demo_stack.dart';
import 'package:flutter/material.dart';


class SuccessButtonDemo extends StatelessWidget {
  final void Function(String) onShowCode;
  const SuccessButtonDemo({super.key, required this.onShowCode});

  @override
  Widget build(BuildContext context) {
    return DemoStack(
      snippet: """
CustomButton(
  text: "Success",
  type: ButtonType.elevated,
  color: Colors.green,
  radius: 8,
  onPressed: () {},
)
""",
      onShowCode: onShowCode,
      child: CustomButton(
        text: "Success",
        type: ButtonType.elevated,
        color: Colors.green,
        radius: 8,
        onPressed: () {},
      ),
    );
  }
}