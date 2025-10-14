
import 'package:custom_ui/custom_button.dart';
import 'package:example/widgets/demo_stack.dart';
import 'package:flutter/material.dart';


class ElevatedSuffixButtonDemo extends StatelessWidget {
  final void Function(String) onShowCode;
  const ElevatedSuffixButtonDemo({super.key, required this.onShowCode});

  @override
  Widget build(BuildContext context) {
    return DemoStack(
      label: 'Elevated Suffix',
      snippet: """
CustomButton(
  text: 'Elevated',
  type: ButtonType.elevated,
  icon: Icon(Icons.arrow_forward, color: Colors.white),
  iconPosition: IconPosition.suffix,
  onPressed: () {},
)
""", onShowCode: onShowCode,
      child: CustomButton(
        text: 'Elevated',
        type: ButtonType.elevated,
        icon: const Icon(Icons.arrow_forward, color: Colors.white),
        iconPosition: IconPosition.suffix,
        onPressed: () {},
      ),
    );
  }
}