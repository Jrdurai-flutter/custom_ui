

import 'package:example/widgets/demo_stack.dart';
import 'package:custom_ui/custom_text_field.dart';
import 'package:flutter/material.dart';

class ParagraphFilledTextFieldDemo extends StatelessWidget {
  final void Function(String) onShowCode;
  const ParagraphFilledTextFieldDemo({super.key, required this.onShowCode});

  @override
  Widget build(BuildContext context) {
    return DemoStack(
      label: "Paragraph Filled",
      snippet: """
CustomTextField(
  hint: 'Write a paragraph...',
  maxLines: 5,
  style: TextFieldStyle.filled,
)
""",
      onShowCode: onShowCode,
      child: const SizedBox(
        child: CustomTextField(
          hint: 'Write a paragraph...',
          maxLines: 5,
          style: TextFieldStyle.filled,
        ),
      ),
    );
  }
}