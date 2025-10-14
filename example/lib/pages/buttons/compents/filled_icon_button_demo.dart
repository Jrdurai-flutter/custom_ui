import 'package:custom_ui/custom_button.dart';
import 'package:example/widgets/demo_stack.dart';
import 'package:flutter/material.dart';

class FilledIconButtonDemo extends StatelessWidget {
  final void Function(String) onShowCode;
  const FilledIconButtonDemo({super.key, required this.onShowCode});

  @override
  Widget build(BuildContext context) {
    return DemoStack(
      snippet: """
CustomButton(
  text: "Like",
  type: ButtonType.filledIcon,
  icon: Icon(Icons.favorite, color: Colors.white),
  color: Colors.pink,
  radius: 8,
  onPressed: () {},
)
""",
      onShowCode: onShowCode,
      child: CustomButton(
        text: "Like",
        type: ButtonType.filledIcon,
        icon: const Icon(Icons.favorite, color: Colors.white),
        color: Colors.pink,
        radius: 8,
        onPressed: () {},
      ),
    );
  }
}