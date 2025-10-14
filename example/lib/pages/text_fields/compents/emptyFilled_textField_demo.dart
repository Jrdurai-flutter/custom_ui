
import 'package:example/widgets/demo_stack.dart';
import 'package:custom_ui/custom_text_field.dart';
import 'package:flutter/material.dart';

/// Empty Filled
class EmptyFilledTextFieldDemo extends StatelessWidget {
  final void Function(String) onShowCode;
  const EmptyFilledTextFieldDemo({super.key, required this.onShowCode});

  @override
  Widget build(BuildContext context) {
    return DemoStack(
      child:  SizedBox(
        child: CustomTextField(
          hint: '',
          style: TextFieldStyle.filled,
        ),),

      label:"Empty Filled",
      snippet: """
CustomTextField(
  hint: '',
  style: TextFieldStyle.filled,
)
""",
      onShowCode: onShowCode,
    );
  }
}