
import 'package:custom_ui/custom_ui.dart';
import 'package:example/widgets/demo_stack.dart';
import 'package:flutter/material.dart';

/// Outlined Action Snackbar Demo
class OutlinedActionSnackbarDemo extends StatelessWidget {
  final void Function(String) onShowCode;
  const OutlinedActionSnackbarDemo({super.key, required this.onShowCode});

  @override
  Widget build(BuildContext context) {
    return DemoStack(
      snippet: """
CustomSnackbar.show(
  context: context,
  message: "Changes saved as draft",
  actionLabel: "Publish",
  actionStyle: ActionStyle.outlined,
  backgroundColor: Colors.brown,
  onActionPressed: () {
    print("Publish action pressed");
  },
);
""",
      onShowCode: onShowCode,
      child:  ElevatedButton(
        onPressed: () {
          CustomSnackbar.show(
            context: context,
            message: "Changes saved as draft",
            actionLabel: "Publish",
            actionStyle: ActionStyle.outlined,
            backgroundColor: Colors.brown,
            onActionPressed: () {
              print("Publish action pressed");
            },
          );
        },
        style: ElevatedButton.styleFrom(backgroundColor: Colors.brown),
        child: const Text("Outlined Action", style: TextStyle(color: Colors.white)),
      ),
    );
  }
}