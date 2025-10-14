
import 'package:example/widgets/demo_stack.dart';
import 'package:custom_ui/custom_text_field.dart';
import 'package:flutter/material.dart'
;
class EmptyOutlinedTextFieldDemo extends StatelessWidget {
  final void Function(String) onShowCode;
  const EmptyOutlinedTextFieldDemo({super.key, required this.onShowCode});

  @override
  Widget build(BuildContext context) {
    return DemoStack(
      child: const SizedBox(

        child: CustomTextField(
          hint: '',
          style: TextFieldStyle.outlined,
        ),
      ),

      snippet: """
CustomTextField(
  hint: '',
  style: TextFieldStyle.outlined,
)
""",
      onShowCode: onShowCode, label: 'Empty Outlined',
    );
  }
}