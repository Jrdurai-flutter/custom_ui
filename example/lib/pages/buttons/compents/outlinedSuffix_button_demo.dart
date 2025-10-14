import 'package:custom_ui/custom_button.dart';
import 'package:example/widgets/demo_stack.dart';
import 'package:flutter/material.dart';

class OutlinedSuffixButtonDemo extends StatelessWidget {
  final void Function(String) onShowCode;
  const OutlinedSuffixButtonDemo({super.key, required this.onShowCode});

  @override
  Widget build(BuildContext context) {
    return DemoStack(
      label: 'Outlined Suffix',
      snippet: """
CustomButton(
  text: 'Outlined',
  type: ButtonType.outlined,
  color: Colors.blue,
  icon: Icon(Icons.chevron_right, color: Colors.blue),
  iconPosition: IconPosition.suffix,
  onPressed: () {},
)
""",
      onShowCode: onShowCode,
      child: CustomButton(
        text: 'Outlined',
        type: ButtonType.outlined,
        color: Colors.blue,
        icon: const Icon(Icons.chevron_right, color: Colors.blue),
        iconPosition: IconPosition.suffix,
        onPressed: () {},
      ),
    );
  }
}