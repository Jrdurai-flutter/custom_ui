
import 'package:example/widgets/demo_stack.dart';
import 'package:custom_ui/custom_text_field.dart';
import 'package:flutter/material.dart';


class BorderlessTextFieldDemo extends StatelessWidget {
  final void Function(String) onShowCode;
  const BorderlessTextFieldDemo({super.key, required this.onShowCode});

  @override
  Widget build(BuildContext context) {
    return DemoStack(
      child: SizedBox(
        child: CustomTextField(
          hint: 'Borderless',
          style: TextFieldStyle.borderless,
          prefixIcon: Icon(Icons.search),
        ),
      ),
      label: 'Borderless',
      snippet: """
CustomTextField(
  hint: 'Borderless',
  style: TextFieldStyle.borderless,
  prefixIcon: Icon(Icons.search),
)
""",
      onShowCode: onShowCode,
    );
  }
}