import 'package:custom_ui/custom_button.dart';
import 'package:example/widgets/demo_stack.dart';
import 'package:flutter/material.dart';

class ElevatedPrefixButtonDemo extends StatelessWidget {
  final void Function(String) onShowCode;
  const ElevatedPrefixButtonDemo({super.key, required this.onShowCode});

  @override
  Widget build(BuildContext context) {
    return DemoStack(
      label: 'Elevated Prefix',
      onShowCode : onShowCode,
      snippet:  """
CustomButton(
  text: 'Elevated',
  type: ButtonType.elevated,
  icon: Icon(Icons.arrow_back, color: Colors.white),
  iconPosition: IconPosition.prefix,
  onPressed: () {},
)
""",
      child: CustomButton(
        text: 'Elevated',
        type: ButtonType.elevated,
        icon: const Icon(Icons.arrow_back, color: Colors.white),
        iconPosition: IconPosition.prefix,
        onPressed: () {},
      ),
    );
  }
}