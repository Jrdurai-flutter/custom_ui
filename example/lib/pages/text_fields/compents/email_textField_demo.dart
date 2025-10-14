
import 'package:flutter/material.dart';
import 'package:custom_ui/custom_text_field.dart';
import '../../../widgets/demo_row.dart';
/// Email
class EmailTextFieldDemo extends StatelessWidget {
  final void Function(String) onShowCode;
  const EmailTextFieldDemo({super.key, required this.onShowCode});

  @override
  Widget build(BuildContext context) {
    return DemoRow(
      demo: SizedBox(
        child: CustomTextField(
          hint: 'name@example.com',
          keyboardType: TextInputType.emailAddress,
          style: TextFieldStyle.outlined,
        ),
      ),
      snippet: """
CustomTextField(
  hint: 'name@example.com',
  keyboardType: TextInputType.emailAddress,
  style: TextFieldStyle.outlined,
)
""",
      onShowCode: onShowCode,
    );
  }
}