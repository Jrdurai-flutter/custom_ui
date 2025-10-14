
import 'package:custom_ui/custom_button.dart';
import 'package:example/widgets/demo_stack.dart';
import 'package:flutter/material.dart';


class InactiveButtonDemo extends StatelessWidget {
  final void Function(String) onShowCode;
  const InactiveButtonDemo({super.key, required this.onShowCode});

  @override
  Widget build(BuildContext context) {
    return DemoStack(
      snippet: """
// Simulate disabled by setting onPressed to null
CustomButton(
  text: "Inactive",
  type: ButtonType.elevated,
  color: Colors.grey,
  radius: 8,
  onPressed: null,
)
""",
      onShowCode: onShowCode,
      child: CustomButton(
        text: "Inactive",
        type: ButtonType.elevated,
        color: Colors.grey,
        radius: 8,
        onPressed: (){},
      ),
    );
  }
}