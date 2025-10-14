
import 'package:example/widgets/demo_stack.dart';
import 'package:custom_ui/custom_text_field.dart';
import 'package:flutter/material.dart';

class OutlinedTextFieldDemo extends StatelessWidget {
  final void Function(String) onShowCode;
  const OutlinedTextFieldDemo({super.key, required this.onShowCode});

  @override
  Widget build(BuildContext context) {
    return DemoStack(
      child:  SizedBox(
        child: CustomTextField(
          label: 'Outlined',
          hint: 'Enter text',
          style: TextFieldStyle.outlined,
        ),
      ),
      label: "Outlined",
      snippet: """
CustomTextField(
  label: 'Outlined',
  hint: 'Enter text',
  style: TextFieldStyle.outlined,
)
""",
      onShowCode: onShowCode,
    );
  }
}