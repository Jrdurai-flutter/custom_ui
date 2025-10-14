import 'package:flutter/material.dart';
import 'package:custom_ui/custom_button.dart';
import '../../../widgets/demo_row.dart';


class TextButtonDemo extends StatelessWidget {
  final void Function(String) onShowCode;

  const TextButtonDemo({super.key, required this.onShowCode});

  @override
  Widget build(BuildContext context) {
    return DemoRow(
      demo: CustomButton(
        text: "Text",
        type: ButtonType.text,
        color: Colors.red,
        onPressed: () {},
      ),
      snippet: """
CustomButton(
  text: "Text",
  type: ButtonType.text,
  color: Colors.red,
  onPressed: () {},
)
""",
      onShowCode: onShowCode,
    );
  }
}
