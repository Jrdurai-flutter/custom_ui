
import 'package:example/widgets/demo_stack.dart';
import 'package:custom_ui/custom_text_field.dart';
import 'package:flutter/material.dart';

class FilledTextFieldDemo extends StatelessWidget {
  final void Function(String) onShowCode;
  const FilledTextFieldDemo({super.key, required this.onShowCode});

  @override
  Widget build(BuildContext context) {
    return DemoStack(
      child: const SizedBox(
        child: CustomTextField(
          label: 'Filled',
          hint: 'Search...',
          style: TextFieldStyle.filled,
        ),
      ),label:"Filled",
      snippet: """
CustomTextField(
  label: 'Filled',
  hint: 'Search...',
  style: TextFieldStyle.filled,
)
""",
      onShowCode: onShowCode,
    );
  }
}