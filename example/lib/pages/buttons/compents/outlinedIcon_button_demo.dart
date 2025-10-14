import 'package:custom_ui/custom_button.dart';
import 'package:flutter/material.dart';

import '../../../widgets/widget_compents.dart';


class OutlinedIconButtonDemo extends StatelessWidget {
  final void Function(String) onShowCode;
  const OutlinedIconButtonDemo({super.key, required this.onShowCode});

  @override
  Widget build(BuildContext context) {
    return DemoStack(
      snippet: """
CustomButton(
  text: "Star",
  type: ButtonType.outlinedIcon,
  icon: Icon(Icons.star, color: Colors.blue),
  color: Colors.blue,
  radius: 8,
  onPressed: () {},
)
""",
      onShowCode: onShowCode,
      child: CustomButton(
        text: "Star",
        type: ButtonType.outlinedIcon,
        icon: const Icon(Icons.star, color: Colors.blue),
        color: Colors.blue,
        radius: 8,
        onPressed: () {},
      ),
    );
  }
}