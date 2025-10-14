
import 'package:example/widgets/demo_stack.dart';
import 'package:custom_ui/custom_text_field.dart';
import 'package:flutter/material.dart';
/// Paragraph Outlined
class ParagraphOutlinedTextFieldDemo extends StatelessWidget {
  final void Function(String) onShowCode;
  const ParagraphOutlinedTextFieldDemo({super.key, required this.onShowCode});

  @override
  Widget build(BuildContext context) {
    return DemoStack(
      label: "Paragraph Outlined",
      snippet: """
CustomTextField(
  hint: 'Write a paragraph...',
  maxLines: 5,
  style: TextFieldStyle.outlined,
)
""",
      onShowCode: onShowCode,
      child: const SizedBox(
        child: CustomTextField(
          hint: 'Write a paragraph...',
          maxLines: 5,
          style: TextFieldStyle.outlined,
        ),
      ),
    );
  }
}