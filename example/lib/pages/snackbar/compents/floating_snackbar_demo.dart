import 'package:custom_ui/custom_ui.dart';
import 'package:example/widgets/demo_stack.dart';
import 'package:flutter/material.dart';
/// Floating Style Snackbar Demo
class FloatingSnackbarDemo extends StatelessWidget {
  final void Function(String) onShowCode;
  const FloatingSnackbarDemo({super.key, required this.onShowCode});

  @override
  Widget build(BuildContext context) {
    return DemoStack(
      snippet: """
CustomSnackbar.show(
  context: context,
  message: "Floating style snackbar",
  style: SnackbarStyle.floating,
  backgroundColor: Colors.teal,
);
""",
      onShowCode: onShowCode,
      child:  ElevatedButton(
        onPressed: () {
          CustomSnackbar.show(
            context: context,
            message: "Floating style snackbar",
            style: SnackbarStyle.floating,
            backgroundColor: Colors.teal,
          );
        },
        style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
        child: const Text("Floating", style: TextStyle(color: Colors.white)),
      ),
    );
  }
}