

import 'package:custom_ui/custom_button.dart';
import 'package:example/widgets/demo_stack.dart';
import 'package:flutter/material.dart';



class TextPrefixButtonDemo extends StatelessWidget {
  final void Function(String) onShowCode;
  const TextPrefixButtonDemo({super.key, required this.onShowCode});

  @override
  Widget build(BuildContext context) {
    return DemoStack(
      label: 'Text Prefix',
      snippet: """
CustomButton(
  text: 'Text',
  type: ButtonType.text,
  color: Colors.deepPurple,
  icon: Icon(Icons.arrow_back, color: Colors.deepPurple),
  iconPosition: IconPosition.prefix,
  onPressed: () {},
)
""",onShowCode: onShowCode,
      child: CustomButton(
        text: 'Text',
        type: ButtonType.text,
        color: Colors.deepPurple,
        icon: const Icon(Icons.arrow_back, color: Colors.deepPurple),
        iconPosition: IconPosition.prefix,
        onPressed: () {},
      ),
    );
  }
}