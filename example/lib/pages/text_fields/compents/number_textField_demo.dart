
import 'package:flutter/material.dart';
import 'package:custom_ui/custom_text_field.dart';
import '../../../widgets/demo_row.dart';


/// Number
class NumberTextFieldDemo extends StatelessWidget {
  final void Function(String) onShowCode;
  const NumberTextFieldDemo({super.key, required this.onShowCode});

  @override
  Widget build(BuildContext context) {
    return DemoRow(
      demo: const SizedBox(
        child: CustomTextField(
          hint: '123456',
          keyboardType: TextInputType.number,
          style: TextFieldStyle.outlined,
        ),
      ),
      snippet: """
CustomTextField(
  hint: '123456',
  keyboardType: TextInputType.number,
  style: TextFieldStyle.outlined,
)
""",
      onShowCode: onShowCode,
    );
  }
}
