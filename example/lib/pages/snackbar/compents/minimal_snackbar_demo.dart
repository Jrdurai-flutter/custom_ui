
import 'package:custom_ui/custom_ui.dart';
import 'package:example/widgets/demo_stack.dart';
import 'package:flutter/material.dart';
/// Minimal Style Snackbar Demo
class MinimalSnackbarDemo extends StatelessWidget {
  final void Function(String) onShowCode;
  const MinimalSnackbarDemo({super.key, required this.onShowCode});

  @override
  Widget build(BuildContext context) {
    return DemoStack(
      snippet: """
CustomSnackbar.show(
  context: context,
  message: "Minimal style snackbar",
  style: SnackbarStyle.minimal,
  backgroundColor: Colors.grey[200],
  textColor: Colors.black87,
);
""",
      onShowCode: onShowCode,
      child:  ElevatedButton(
        onPressed: () {
          CustomSnackbar.show(
            context: context,
            message: "Minimal style snackbar",
            style: SnackbarStyle.minimal,
            backgroundColor: Colors.grey[200],
            textColor: Colors.black87,
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.grey[300],
          foregroundColor: Colors.black87,
        ),
        child: const Text("Minimal"),
      ),
    );
  }
}