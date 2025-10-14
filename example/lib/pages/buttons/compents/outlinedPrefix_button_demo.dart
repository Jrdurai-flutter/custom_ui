

import 'package:custom_ui/custom_button.dart';
import 'package:example/widgets/demo_stack.dart';
import 'package:flutter/material.dart';

class OutlinedPrefixButtonDemo extends StatelessWidget {
  final void Function(String) onShowCode;
  const OutlinedPrefixButtonDemo({super.key, required this.onShowCode});

  @override
  Widget build(BuildContext context) {
    return DemoStack(
      label: 'Outlined Prefix',
      snippet: """
CustomButton(
  text: 'Outlined',
  type: ButtonType.outlined,
  color: Colors.blue,
  icon: Icon(Icons.chevron_left, color: Colors.blue),
  iconPosition: IconPosition.prefix,
  onPressed: () {},
)
""", onShowCode: onShowCode,
      child: CustomButton(
        text: 'Outlined',
        type: ButtonType.outlined,
        color: Colors.blue,
        icon: const Icon(Icons.chevron_left, color: Colors.blue),
        iconPosition: IconPosition.prefix,
        onPressed: () {},
      ),
    );
  }
}