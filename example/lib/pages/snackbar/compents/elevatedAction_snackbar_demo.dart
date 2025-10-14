
import 'package:custom_ui/custom_ui.dart';
import 'package:example/widgets/demo_stack.dart';
import 'package:flutter/material.dart';

/// Elevated Action Snackbar Demo
class ElevatedActionSnackbarDemo extends StatelessWidget {
  final void Function(String) onShowCode;
  const ElevatedActionSnackbarDemo({super.key, required this.onShowCode});

  @override
  Widget build(BuildContext context) {
    return DemoStack(
      snippet: """
CustomSnackbar.show(
  context: context,
  message: "Download completed",
  actionLabel: "Open",
  actionStyle: ActionStyle.elevated,
  backgroundColor: Colors.purple,
  onActionPressed: () {
    print("Open action pressed");
  },
);
""",
      onShowCode: onShowCode,
      child:  ElevatedButton(
        onPressed: () {
          CustomSnackbar.show(
            context: context,
            message: "Download completed",
            actionLabel: "Open",
            actionStyle: ActionStyle.elevated,
            backgroundColor: Colors.purple,
            onActionPressed: () {
              print("Open action pressed");
            },
          );
        },
        style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
        child: const Text("Elevated Action", style: TextStyle(color: Colors.white)),
      ),
    );
  }
}